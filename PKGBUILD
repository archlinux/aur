# Maintainer:
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=xplc
pkgver=0.3.13
pkgrel=9
pkgdesc="Cross-Platform Lightweight Components"
arch=('x86_64')
url="http://xplc.sourceforge.net"
license=('LGPL')
depends=('gcc-libs')
source=("https://downloads.sourceforge.net/${pkgname}/$pkgname-$pkgver.tar.gz"
        0001-Fix-narrowing-conversion-error.patch
        xplc-0.3.13-as-needed.patch)
md5sums=('39da3270527c8712b8e8fcf03768d29f'
         '049ca1c475703c52b2e11d06bfb676fc'
         '308e3b8f7d7f6a7df05699bdcaed9b18')

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 -i ../0001-Fix-narrowing-conversion-error.patch
  patch -Np0 -i ../xplc-0.3.13-as-needed.patch # Gentoo
}

build() {
  cd "$pkgname-$pkgver"
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
