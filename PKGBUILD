# Maintainer:
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=xplc
pkgver=0.3.13
pkgrel=10
pkgdesc="Cross-Platform Lightweight Components"
arch=('x86_64')
url="http://xplc.sourceforge.net"
license=('LGPL')
depends=('gcc-libs')
source=("https://downloads.sourceforge.net/${pkgname}/$pkgname-$pkgver.tar.gz"
        0001-Fix-narrowing-conversion-error.patch
        xplc-0.3.13-as-needed.patch)
sha256sums=('158a0f44a2eb055522377c275bbd0e7412dd3b8a9b75ec344c0457b3a1a29cbb'
            '13eaf225b33ca26a5152fedd51ca835757fd0f652d36d5428b19670966820074'
            '8381931466572f4804fa553e8d86d05039d622aa344415c490eab00e0fca7e31')

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 -i ../0001-Fix-narrowing-conversion-error.patch
  patch -Np0 -i ../xplc-0.3.13-as-needed.patch # Gentoo
}

build() {
  cd "$pkgname-$pkgver"
  CFLAGS+=" -ffat-lto-objects" \
  ./configure --prefix=/usr \
    --mandir=/usr/share/man \
    --without-libuuid
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  mv "$pkgdir/usr/share/man/man1/"{uuidgen.1,uuidcdef.1}
  rm -f "$pkgdir/usr/bin/uuidgen"
  rm "$pkgdir"/usr/lib/xplc-0.3.13/libxplc_s.a
}
