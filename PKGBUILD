# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Patrick McCarty <pnorcks at gmail dot com>
# Contributor: Jimmy Tang <jtang@tchpc.tcd.ie>

pkgname=pristine-tar
pkgver=1.33
pkgrel=1
pkgdesc="Tool to regenerate a pristine upstream tarball using only a small binary delta file and a copy of the source which can be a revision control checkout."
arch=('i686' 'x86_64')
url="https://packages.debian.org/sid/pristine-tar"
license=('GPL')
depends=('perl' 'xdelta')
conflicts=('pristine-tar-git')
source=(http://ftp.debian.org/debian/pool/main/p/${pkgname}/${pkgname}_${pkgver}.tar.gz
        0002-Use-posix-tar-format-by-default.patch
        0003-Mangle-PAX-headers-when-using-posix-tar-format.patch
        0004-HACK-workaround-for-some-broken-pristine-tar-branche.patch)
sha256sums=('7d87cfe6b957e100e5cd87dca0835af299b4e03f8cb24990f01bbf0f065197b4'
            '09b7e2fba6f53ad1ac85d6000393835aedb8785ddcfd176f043f6301e267c614'
            'd470d888fba8c32c20602a2e90219893d15074cf447c5920b37fa57fe5d38692'
            '0d2cbbeeb8c5fbba193b4ac39a33de800515811f6858e26a8874ed3bce6f394c')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # patches used in the Tizen tools package
  # (improvements for POSIX tar support)
  # available in the pristine-tar package at download.tizen.org/tools
  patch -p1 < ../0002-Use-posix-tar-format-by-default.patch
  patch -p1 < ../0003-Mangle-PAX-headers-when-using-posix-tar-format.patch

  # extra patch for Tizen compat
  patch -p1 < ../0004-HACK-workaround-for-some-broken-pristine-tar-branche.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  export PATH=/usr/bin/core_perl:$PATH

  perl Makefile.PL
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make install DESTDIR=$pkgdir PREFIX=/usr INSTALLSITESCRIPT=/usr/bin
  install -d $pkgdir/usr/share/doc/pristine-tar
  install -D GPL TODO delta-format.txt $pkgdir/usr/share/doc/pristine-tar
}

# vim:set ts=2 sw=2 et:
