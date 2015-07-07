# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
pkgname=brother-dcp350c
pkgver=1.0.1
pkgrel=2
pkgdesc="Brother DCP-350C CUPS driver"
arch=('i686')
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
license=('custom:Brother Industries')
makedepends=('rpmextract')
changelog=brother-dcp350c.changelog
install=brother-dcp350c.install
source=(brother-dcp350c.patch
		http://www.brother.com/pub/bsc/linux/dlf/dcp350clpr-1.0.1-1.i386.rpm
		http://www.brother.com/pub/bsc/linux/dlf/dcp350ccupswrapper-1.0.1-1.i386.rpm)
md5sums=('edba49be34b7a7006f6cf9151ed29365' '1faa2bc86558bb6150e8affbd265b7dc' 'c6118a2d600199b31950bec3f6082643')

build()
{
  cd $srcdir
  for i in *.rpm; do
    rpmextract.sh "$i" || return 1
  done

  patch -p0 < ../brother-dcp350c.patch || return 1

  $srcdir/usr/local/Brother/Printer/dcp350c/cupswrapper/cupswrapperdcp350c
}

package()
{
  mkdir -p $pkgdir/usr/share
  cp -R $srcdir/usr/bin $pkgdir/usr
  cp -R $srcdir/usr/local/Brother/Printer/dcp350c $pkgdir/usr/share/brother

  rm $pkgdir/usr/share/brother/cupswrapper/cupswrapperdcp350c
  rm $pkgdir/usr/share/brother/inf/setupPrintcapij

  install -m 644 -D ppd_file $pkgdir/usr/share/cups/model/brdcp350c.ppd
  install -m 755 -D wrapper $pkgdir/usr/lib/cups/filter/brlpdwrapperdcp350c
}

