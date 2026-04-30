# Contributor: Bernhard Jaud <itsme+aur at genuineparts dot org>
# This uses modified code from package brother-mfc-9335cdn by Leo Pham <regretfulumbrella at gmail dot com>
_model=mfcl3760cdw
pkgname=brother-mfc-l3760cdw
pkgver=3.5.1
pkgrel=2
pkgdesc='LPR and CUPS drivers for the Brother MFC-L3760CDW'
arch=('i686' 'x86_64')
options=('!debug')
url='http://support.brother.com/g/s/id/linux/en/index.html'
license=('custom:brother' 'GPL')
depends=('cups')
if [[ $CARCH = x86_64 ]]; then
    depends+=('lib32-expat' 'lib32-gcc-libs')
fi
makedepends=('perl' 'tar')
install='brother-mfc-l3760cdw.install'
source=('https://download.brother.com/welcome/dlf105762/mfcl3760cdwpdrv-3.5.1-1.i386.deb'
    'cupswrappermfcl3760cdw.patch'
    'setupPrintcapij.patch')
md5sums=('a5fb3394dc1b7f0b9aec16ffdbaf5100'
    '3d2a40564ba52979a45610707a0df431'
    '2533f089d2152fdda3712b82a4330d00')

package() {
    ar x mfcl3760cdwpdrv-3.5.1-1.i386.deb && tar xzvf data.tar.gz

    #Patch the files
    cd "${srcdir}/opt/brother/Printers/${_model}/inf"
    patch <"${srcdir}/setupPrintcapij.patch"
    cd "${srcdir}/opt/brother/Printers/${_model}/cupswrapper"
    patch <"${srcdir}/cupswrappermfcl3760cdw.patch"

    # Symlink files and set Paper Size as discovered by timostolz
    cd "${srcdir}/opt/brother/Printers/${_model}"
    install -Dm755 "lpd/x86_64/brmfcl3760cdwfilter" "${pkgdir}/opt/brother/Printers/${_model}/lpd/brmfcl3760cdwfilter"
    install -Dm755 "lpd/x86_64/brprintconf_mfcl3760cdw" "${pkgdir}/opt/brother/Printers/${_model}/lpd/brprintconf_mfcl3760cdw"
    install -Dm755 "lpd/filter_mfcl3760cdw" "${pkgdir}/opt/brother/Printers/${_model}/lpd/filter_mfcl3760cdw"

    install -d "${pkgdir}/usr/lib/cups/filter/"
    ln -sf "/opt/brother/Printers/mfcl3760cdw/cupswrapper/brother_lpdwrapper_mfcl3760cdw" \
           "${pkgdir}/usr/lib/cups/filter/"

    install -d "${pkgdir}/usr/share/cups/model/"
    ln -sf "/opt/brother/Printers/mfcl3760cdw/cupswrapper/brother_mfcl3760cdw_printer_en.ppd" \
           "${pkgdir}/usr/share/cups/model/"

    cp -r "inf" "${pkgdir}/opt/brother/Printers/${_model}"
    chmod 755 "${pkgdir}/opt/brother/Printers/${_model}/inf"

    # Patch filenames to work on Arch
    #perl -i -pe 's#/etc/init.d#/etc/rc.d#g' ./cupswrapper/cupswrappermfcl3760cdw
    perl -i -pe 's#printcap\.local#printcap#g' ./inf/setupPrintcapij

    cp -rf $srcdir/opt/ $pkgdir/
}
