# Maintainer: Matt Judge  < m dot judge at cantab.net >
# Reference: https://wiki.archlinux.org/index.php/Packaging_Brother_printer_drivers

pkgname="brother-dcp-145c"
pkgver="1.1.2_2"
pkgrel="1"
pkgdesc="Brother DCP-145C CUPS driver"
url="http://support.brother.com/g/b/downloadtop.aspx?c=eu_ot&lang=en&prod=dcp145c_eu_as"
license=('GPL')
install="brother-dcp-145c.install"
arch=('i686' 'x86_64')
depends=('cups')
depends_x86_64=('lib32-glibc') 
md5sums=('2be122a6f63654cd9a1b6a9427235394'
         '58ec23ccb3e8d7617006b9659fb36a95'
         'bd8b8ab373172266eed34040658344be')

source=(
  brother-dcp-145c.patch \
  http://download.brother.com/welcome/dlf005444/dcp145ccupswrapper-1.1.2-2.i386.rpm
  http://download.brother.com/welcome/dlf005442/dcp145clpr-1.1.2-2.i386.rpm
)

prepare() {
  cd "$srcdir/usr/" || return 1
  patch -p1 < ../brother-dcp-145c.patch

  cd "$srcdir" || return 1
  "$srcdir/usr/local/Brother/Printer/dcp145c/cupswrapper/cupswrapperdcp145c"
}

package() {
  mkdir -p "$pkgdir/usr/share"
  cp -R "$srcdir/usr/bin" "$pkgdir/usr"
  # cp -R "$srcdir/usr/lib" "$pkgdir/usr"
  cp -R "$srcdir/usr/local/Brother" "$pkgdir/usr/share/brother"

  rm "$pkgdir/usr/share/brother/Printer/dcp145c/cupswrapper/cupswrapperdcp145c"
  rm "$pkgdir/usr/share/brother/Printer/dcp145c/inf/setupPrintcapij"

  install -m 644 -D ppd_file "$pkgdir/usr/share/cups/model/brdcp145c.ppd"
  install -m 755 -D wrapper "$pkgdir/usr/lib/cups/filter/brlpdwrapperdcp145c"

  find $pkgdir -type f -exec chmod 644 {} \;
  
  chmod +x "$pkgdir/usr/bin/brprintconf_dcp145c"
  chmod +x "$pkgdir/usr/lib/cups/filter/brlpdwrapperdcp145c"
  chmod +x "$pkgdir/usr/share/brother/Printer/dcp145c/cupswrapper/brcupsconfpt1"
  chmod +x "$pkgdir/usr/share/brother/Printer/dcp145c/lpd/brdcp145cfilter"
  chmod +x "$pkgdir/usr/share/brother/Printer/dcp145c/lpd/filterdcp145c"
  chmod +x "$pkgdir/usr/share/brother/Printer/dcp145c/lpd/psconvertij2"
}
