# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=(fontconfig-minimal-git)
pkgver=2.13.91+48+gfcb0420
pkgrel=1
#epoch=1
pkgdesc="Library for configuring and customizing font access"
url="https://www.freedesktop.org/wiki/Software/fontconfig/"
arch=(x86_64)
license=(custom)
makedepends=(git autoconf-archive gperf python-lxml python-six json-c expat freetype2)
optdepends=('docbook-utils: docs'
            'docbook-sgml: docs')
#checkdepends=(unzip)
source=("git+https://gitlab.freedesktop.org/fontconfig/fontconfig.git"
        fontconfig.hook)
sha256sums=('SKIP'
            'SKIP')

# a nice page to test font matching:
# http://zipcon.net/~swhite/docs/computers/browsers/fonttest.html
# http://getemoji.com/

pkgver() {
  cd fontconfig
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd fontconfig

}

build() {
  arch-meson fontconfig build \
    -D doc=disabled \
    -D doc-txt=disabled \
    -D doc-man=disabled \
    -D doc-pdf=disabled \
    -D doc-html=disabled \
    -D tests=disabled
  ninja $NINJAFLAGS -C build
}

#check() {
#  cd fontconfig
#  meson test -C build
#}

package_fontconfig-minimal-git() {
  depends=(expat libfreetype.so)
  provides=(libfontconfig.so fontconfig)
  conflicts=(fontconfig)
  install=fontconfig.install
  backup=(etc/fonts/fonts.conf)

  DESTDIR="$pkgdir" ninja $NINJAFLAGS -C build install

  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 ../*.hook
#  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 COPYING

  # Split -docs
#  mkdir -p "$srcdir/doc/usr/share/man"
#  mv {"$pkgdir","$srcdir"/doc}/usr/share/doc
#  mv {"$pkgdir","$srcdir"/doc}/usr/share/man/man3
}

# vim:set sw=2 et:
