# Maintainer: Oleksandr Natalenko <pfactum@gmail.com>
# Author of original PKGBUILD: Igor Mosyagin <c6h10o5@gmail.com>
pkgname=brother-mfc-7860dw
pkgver=2.1.0
_driver_ver=2.1.0
_wrapper_ver=2.0.4
pkgrel=2
pkgdesc="CUPS driver for Brother MFC-7860DW printer"
arch=('i686' 'x86_64')
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
license=('GPL')
depends=()
if [ "$CARCH" = "x86_64" ]; then
    depends=('cups' 'ghostscript' 'gsfonts' 'foomatic-filters' 'lib32-glibc')
else
    depends=('cups' 'ghostscript' 'gsfonts' 'foomatic-filters')
fi
makedepends=('rpmextract')
install=brother-mfc-7860dw.install
source=(http://www.brother.com/pub/bsc/linux/dlf/mfc7860dwlpr-$_driver_ver-1.i386.rpm
http://www.brother.com/pub/bsc/linux/dlf/cupswrapperMFC7860DW-$_wrapper_ver-2.i386.rpm
        brother-mfc-7860dw.patch)
md5sums=('d321ad6ca699a19a6aa608d67ae41198'
         '9cf9fb55b6972d1b897205295029c17d'
         '1a96507310b73086b69f5f120a30e274'
         )

build() {
  cd "$srcdir"

  # extract files
  rpmextract.sh mfc7860dwlpr-$_driver_ver-1.i386.rpm
  rpmextract.sh cupswrapperMFC7860DW-$_wrapper_ver-2.i386.rpm

  # patch files to adhere arch packaging standard
  patch -p1 < "$srcdir/brother-mfc-7860dw.patch" || return 1
  
  # generate ppd and wrapper file
  sh "$srcdir/usr/local/Brother/Printer/MFC7860DW/cupswrapper/cupswrapperMFC7860DW-$_wrapper_ver"
}

package() {
  # put files where they belong
  mkdir -p "$pkgdir/usr/share/brother"
  cp -r "$srcdir/usr/local/Brother/Printer" "$pkgdir/usr/share/brother/printer"
  cp -r "$srcdir/var" "$pkgdir/"

  rm "$pkgdir/usr/share/brother/printer/MFC7860DW/cupswrapper/cupswrapperMFC7860DW-$_wrapper_ver"
  rm "$pkgdir/usr/share/brother/printer/MFC7860DW/inf/setupPrintcap2"

  install -m 644 -D ppd_file "$pkgdir/usr/share/cups/model/MFC7860DW.ppd"
  install -m 755 -D wrapper  "$pkgdir/usr/lib/cups/filter/brlpdwrapperMFC7860DW"
}

