# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgbasename=fontconfig
pkgname=lib32-$_pkgbasename-git
pkgver=2.13.91+18+g01e4f08
pkgrel=1
epoch=2
pkgdesc="A library for configuring and customizing font access (32-bit)"
arch=(x86_64)
url="https://www.freedesktop.org/wiki/Software/fontconfig/"
license=(custom)
provides=(lib32-fontconfig)
conflicts=(lib32-fontconfig)
depends=(lib32-expat lib32-freetype2 $_pkgbasename)
makedepends=(git autoconf-archive gperf python-lxml python-six lib32-json-c)
install=lib32-fontconfig.install
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
#  meson test -C build
#}

package() {
  DESTDIR="$pkgdir" ninja $NINJAFLAGS -C build install

  rm -r "$pkgdir"/{etc,usr/{include,share}}
  find "$pkgdir/usr/bin" -not -type d -not -name fc-cache -delete
  mv "$pkgdir"/usr/bin/fc-cache{,-32}

  install -Dm644 ../fontconfig-32.hook "$pkgdir/usr/share/libalpm/hooks/fontconfig-32.hook"

  # Install license
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
