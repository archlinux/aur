# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Christian Babeux <christian.babeux@0x80.ca>

pkgname=gambit-c
pkgver=4.9.2
pkgrel=1
pkgdesc='Efficient implementation of the Scheme programming language'
arch=(x86_64)
# http://gambitscheme.org/ is down sometimes
url='https://github.com/gambit/gambit'
license=(LGPL Apache)
options=(staticlibs)
makedepends=(git)
source=("$pkgname-$pkgver.tgz::https://www.iro.umontreal.ca/~${pkgname%-c}/download/${pkgname%-c}/v${pkgver%.*}/source/${pkgname/-c/-v}${pkgver//./_}-devel.tgz")
sha256sums=('bbcb47ce1075607b8560bd249f636056746eee588b9af1801d92f71beaa8f2f6')

build() {
  cd "${pkgname/-c/-v}${pkgver//./_}-devel"

  ./configure \
    --prefix=/usr \
    --docdir=/usr/share/doc/gambit-c \
    --infodir=/usr/share/info \
    --libdir=/usr/lib/gambit-c \
    --enable-gcc-opts \
    --enable-single-host
  make
}

package() {
  make -C "${pkgname/-c/-v}${pkgver//./_}-devel" install DESTDIR="$pkgdir"

  # /usr/bin/gsc conflicts with ghostscript
  mv "$pkgdir/usr/bin/gsc" "$pkgdir/usr/bin/gambitc"
  ln -sf /usr/bin/gambitc "$pkgdir/usr/bin/gsc-script"
}

# getver: -u 2 gambitscheme.org/wiki/index.php/Main_Page
# vim: ts=2 sw=2 et:
