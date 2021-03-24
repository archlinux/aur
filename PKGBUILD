# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgbasename=fontconfig
pkgname=lib32-$_pkgbasename-git
pkgver=2.13.91+18+g01e4f08
pkgrel=1
pkgdesc="A library for configuring and customizing font access (32-bit)"
arch=(x86_64)
url="https://www.freedesktop.org/wiki/Software/fontconfig/"
license=(custom)
provides=(lib32-fontconfig libfontconfig.so)
conflicts=(lib32-fontconfig)
depends=(lib32-expat libfreetype.so $_pkgbasename)
makedepends=(git meson gperf lib32-freetype2)
install=fontconfig-32.install
source=("git+https://gitlab.freedesktop.org/fontconfig/fontconfig"
        fontconfig-32.hook)
sha256sums=('SKIP'
            'SKIP')

# a nice page to test font matching:
# http://zipcon.net/~swhite/docs/computers/browsers/fonttest.html
# http://getemoji.com/

pkgver() {
  cd $_pkgbasename
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgbasename

}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"

  arch-meson fontconfig build \
    --libdir=/usr/lib32 \
    -D doc=disabled \
    -D doc-txt=disabled \
    -D doc-man=disabled \
    -D doc-pdf=disabled \
    -D doc-html=disabled \
    -D tests=disabled
    ninja $NINJAFLAGS -C build
}

#check() {
#  cd $_pkgbasename
#  meson test -C build --print-errorlogs
#}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  rm -r "${pkgdir}"/{etc,usr/{include,share}}
  mv "${pkgdir}"/usr/bin/fc-cache{,-32}
  find "${pkgdir}"/usr/bin -type f -not -name '*-32' -delete
  install -Dm 644 *.hook -t "${pkgdir}"/usr/share/libalpm/hooks/
  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s fontconfig "${pkgdir}"/usr/share/licenses/lib32-fontconfig
}
