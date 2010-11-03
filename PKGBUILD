# Maintainer: Peter Lewis <prlewis@letterboxes.org>

pkgname=poldi
pkgver=0.4
pkgrel=3
pkgdesc="PAM module for authentication using a smartcard"
arch=('i686' 'x86_64')
url="http://http://www.g10code.com/p-poldi.html"
license="GPL"
depends=('libgcrypt' 'libgpg-error' 'libksba' 'pam')
makedepends=()
options=()
backup=()
install=('poldi.install')
source=("ftp://ftp.gnupg.org/gcrypt/alpha/poldi/$pkgname-$pkgver.tar.bz2" "poldi-arch.patch")
md5sums=('5a0312c3124e3dbb558a24f1017c169c' '3533f7b428e2c9a4bbfff2271ba24e5d')

build() {

  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < ../poldi-arch.patch

  ./configure --prefix=/usr --with-pam-module-directory=/lib/security --sysconfdir="$pkgdir/usr/share/doc/poldi/example_etc"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install-conf-skeleton

  mkdir "$pkgdir/lib"
  mkdir "$pkgdir/lib/security"
  cp src/pam/pam_poldi.so "$pkgdir/lib/security/"

  rm "$pkgdir/usr/share/info/dir"
}
