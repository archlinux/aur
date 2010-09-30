# Contributor: Olivier Mehani <shtrom-aur@ssji.net>
# $Id$
# vim:set ts=2 sw=2 et:
pkgname=ndt
pkgver=3.6.4
pkgrel=1
pkgdesc="The Network Diagnostic Tool (NDT) is a client/server program that provides network configuration and performance testing"
arch=('x86_64')
url="http://www.internet2.edu/performance/ndt/index.html"
license=('BSD')
depends=('web100-utils' 'jopenchart')
source=(http://software.internet2.edu/sources/ndt/$pkgname-$pkgver.tar.gz
        fix_configure_include_paths.patch
        fix_configure_mandir.patch
        fix_JAnalyze_Makefile_target.patch
        fix_I2util_configure_mandir.patch)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -p1 < $srcdir/fix_configure_include_paths.patch
  patch -p1 < $srcdir/fix_configure_mandir.patch
  patch -p1 < $srcdir/fix_JAnalyze_Makefile_target.patch
  patch -p1 < $srcdir/fix_I2util_configure_mandir.patch

  ./configure --prefix=/usr
  # XXX: The CLASSPATH specification looks bodgey...
  make ndtdir="/usr/share/java/ndt" CLASSPATH_ENV="CLASSPATH=/usr/share/java/jopenchart/charting-0.94.jar" || return 1
  make ndtdir="$pkgdir/usr/share/java/ndt" prefix="$pkgdir/usr" install

  mv $pkgdir/usr/bin/analyze $pkgdir/usr/bin/ndt-analyze
  mv $pkgdir/usr/share/man/man1/analyze.1 $pkgdir/usr/share/man/man1/ndt-analyze.1
  sed -i "s/analyze[^r]/ndt-&/" $pkgdir/usr/share/man/man1/ndt-analyze.1

  mkdir -p $pkgdir/usr/share/doc/$pkgname-$pkgver
  cp AUTHORS ChangeLog DISCUSSION-LIST NEWS README Readme-fakewww Readme-web100srv tcpbw100.template $pkgdir/usr/share/doc/$pkgname-$pkgver
}

md5sums=('098d9d55536b8a0ab07ef13eb15b7fd4'
         'ec3e388b9a54094216af62cab7bb07d7'
         '69851a12c0927ec28e13b55f80f6d7cc'
         '90838b71a45f9e7e8432c4077b0259ca'
         '6d36f6e8f81f9f79b6a24bb4958529c9')
