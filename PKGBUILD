# Maintainer: Eldon Mathias <eldon@emathias.com>
pkgname="brother-mfc240c"
pkgver="1.0.2"
pkgrel="2"
pkgdesc="Brother MFC-240C CUPS driver"
url="http://www.brother.com"
license=('GPL')
install="brother-mfc240c.install"
arch=('i686' 'x86_64')
depends_x86_64=('lib32-glibc') 
md5sums=('806c9c5672793de84cae9c255a4d402b'
         '207cf1eb6bbab8d2ecafd8a2b5bc8f4b'
         'e2564327cb7fc6501ca9657080855322')

source=(
  brother-mfc240c.patch \
  http://www.brother.com/pub/bsc/linux/dlf/mfc240ccupswrapper-1.0.1-1.i386.rpm
  http://www.brother.com/pub/bsc/linux/dlf/mfc240clpr-1.0.1-1.i386.rpm
)

prepare() {
  cd "$srcdir/usr/" || return 1
  patch -p1 < ../brother-mfc240c.patch

  cd "$srcdir" || return 1
  "$srcdir/usr/local/Brother/Printer/mfc240c/cupswrapper/cupswrappermfc240c"
}

package() {
  mkdir -p "$pkgdir/usr/share"
  cp -R "$srcdir/usr/bin" "$pkgdir/usr"
  cp -R "$srcdir/usr/local/Brother" "$pkgdir/usr/share/brother"

  rm "$pkgdir/usr/share/brother/Printer/mfc240c/cupswrapper/cupswrappermfc240c"
  rm "$pkgdir/usr/share/brother/Printer/mfc240c/inf/setupPrintcapij"

  install -m 644 -D ppd_file "$pkgdir/usr/share/cups/model/brmfc240c.ppd"
  install -m 755 -D wrapper "$pkgdir/usr/lib/cups/filter/brlpdwrappermfc240c"
}

