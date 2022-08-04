# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Motohiro Ueki <ueki.com@gmail.com>
# Contributor: nkoizu <nkoizu@gmail.com>

pkgname=gauche
pkgver=0.9.12
pkgrel=1
url='https://practical-scheme.net/gauche/'
arch=(x86_64)
pkgdesc='R7RS Scheme implementation (includes gosh)'
depends=(libatomic_ops libxcrypt slib)
makedepends=(autoconf gauche git)
license=(BSD)
source=("$pkgname::git+https://github.com/shirok/Gauche#commit=950943ffcd6a2b88322855cb0f6d01e2ac6cfbdf") # tag: v0.9.12
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
  # Fix info page dates
  touch -d '4 Aug 2022 10:10' "$pkgdir"/usr/share/info/gauche-ref*info*.gz
}

# getver: practical-scheme.net/gauche/gmemo/index.cgi?ReleaseNotes
