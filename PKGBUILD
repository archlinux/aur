# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Motohiro Ueki <ueki.com@gmail.com>
# Contributor: nkoizu <nkoizu@gmail.com>

pkgname=gauche
pkgver=0.9.13
pkgrel=1
url='https://practical-scheme.net/gauche/'
arch=(x86_64)
pkgdesc='R7RS Scheme implementation (includes gosh)'
depends=(libatomic_ops libxcrypt slib)
makedepends=(autoconf gauche git)
license=(BSD)
_info_page_date='29 Oct 2023 10:10' # For reproducible builds
source=("$pkgname::git+https://github.com/shirok/Gauche#commit=9eaf47225474755a39f58bbda07dd6bfd0459e66") # tag: v0.9.13
b2sums=('SKIP')

build() {
  cd $pkgname
  BUILD_GOSH=/usr/bin/gosh
  CFLAGS+=' -ffat-lto-objects -w'
  ./DIST gen
  ./configure --prefix=/usr --with-slib=/usr/share/slib --with-tls
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install-pkg install-doc
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  touch -d "$_info_page_date" "$pkgdir"/usr/share/info/gauche-ref*info*.gz
}
