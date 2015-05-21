pkgname=signing-party-svn
pkgver=495
pkgrel=6
pkgdesc="Collection for all kinds of pgp related things, including signing scripts, party preparation scripts etc."
url="http://pgp-tools.alioth.debian.org/"
arch=(i686 x86_64)
license=(GPL)
depends=(perl-libintl-perl perl-text-iconv recode perl-mailtools perl-gd perl-gnupg-interface perl-mime-tools perl-text-template perl-any-moose perl-net-idn-encode)
makedepends=(subversion)
conflicts=(sig2dot)
install=$pkgname.install
source=($pkgname::svn://svn.debian.org/svn/pgp-tools/trunk/
        signing-party-svn.patch
        xdg-directories.patch
        xdg-directories-bugfix.patch)
md5sums=('SKIP'
         '0d1b5c71e0d3f7ee4cd3e0a4eb71bcf6'
         '880930f6005c0d5f8d2812b3e7f05895'
         '669bc976d9848786d10ee6217f06f2c0')

prepare() {
  cd "$pkgname/keyanalyze/pgpring"
  sed -e '/AM_C_PROTOTYPES/d' -i configure.in
  touch NEWS README AUTHORS ChangeLog
  aclocal
  autoconf
  automake --add-missing
  ./configure
  patch -p0 -d "$srcdir/$pkgname" -i "$srcdir/signing-party-svn.patch"
  make
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  patch -p1 -d "$srcdir/$pkgname" -i "$srcdir/xdg-directories.patch"
  patch -p1 -d "$srcdir/$pkgname" -i "$srcdir/xdg-directories-bugfix.patch"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
