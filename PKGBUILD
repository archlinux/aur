# Maintainer: Bin Martig <bbbbmb97@gmail.com>
# Contributor: Frederick Gnodtke <frederick@gnodtke.net>

_model=mfcl8690cdw
pkgname=brother-mfc-l8690cdw
pkgver=1.5.0
pkgrel=1
pkgdesc="LPR driver and CUPS wrapper for Brother MFC-L8690CDW printer"
arch=("x86_64")
url="https://support.brother.com/g/b/downloadlist.aspx?c=eu_ot&lang=en&prod=mfcl8690cdw_eu_as&os=128"
license=("LicenseRef-BROTHER-EULA")
depends=("gcc-libs"
"perl"
"bash")
conflicts=("brother-mfcl8690cdw-lpr-bin"
"brother-mfcl8690cdw-cups-bin")
install="${pkgname}.install"
source=("${_model}-lpr::https://download.brother.com/welcome/dlf103241/${_model}lpr-${pkgver}-0.i386.deb"
"${_model}-cupswrapper::https://download.brother.com/welcome/dlf103250/${_model}cupswrapper-${pkgver}-0.i386.deb"
"BROTHER-EULA"
"setupPrintcapij.patch"
"cupswrappermfcl8690cdw.patch")
noextract=("${_model}-lpr"
"${_model}-cupswrapper")
b2sums=("36fe8cbf97cde9848ad401cf235b6c685c88330b4b66e2d733673a6a5448d8ec2f1f79b07f81010e7e718b79a7da9075d1325c475726fc92eca621952284e976"
"194d40f619abacf8655e08ff4a1b66f45cac26be1ee29ce33925a421a5dde6686d5e951ebb012f19048774a300deac18a9a426e7e78927b9e6dec844670ed416"
"a89bdc1fe13befa9a1813e61ca09e9b5ab4b528bce707a4cbd93d819341e9274fe886336f173e84b11819ed97eb5cd2ef0caea1dec8517fb34ddc60dd2c79e0c"
"dce87cd454f4571f974d23eb1733aa397790a594e1061808a2850ec51b7fceddaae72b3c58321306f6d232302cccea1c62ef2d519bb3c96148bd9901f6e8767c"
"d28a38238e8e6dfd4d56f58fc124bc9633def099a3033565dd840a8414aa0307b8a3e7a86cfb579be3285cfbf7e72941b13eab6e2d528f3dde7daa9690cd807e")

prepare() {
    # Manually exctract sources so nothing gets overwritten
	ar -x "${_model}-lpr" data.tar.gz
    tar -xf data.tar.gz
    rm data.tar.gz
    ar -x "${_model}-cupswrapper" data.tar.gz
    tar -xf data.tar.gz
    rm data.tar.gz

    # Patch post-install scripts to work with lprNG and systemd
    cd "${srcdir}/opt/brother/Printers/${_model}/inf"
    patch < "${srcdir}/setupPrintcapij.patch"
    cd "${srcdir}/opt/brother/Printers/${_model}/cupswrapper"
    patch < "${srcdir}/cupswrappermfcl8690cdw.patch"
}

package() {
# Install files
cd "${srcdir}/opt/brother/Printers/${_model}"
# LPR
install -Dm755 "lpd/x86_64/brmfcl8690cdwfilter" "${pkgdir}/opt/brother/Printers/${_model}/lpd/brmfcl8690cdwfilter"
install -Dm755 "lpd/x86_64/brprintconf_mfcl8690cdw" "${pkgdir}/opt/brother/Printers/${_model}/lpd/brprintconf_mfcl8690cdw"
install -Dm755 "lpd/filter_mfcl8690cdw" "${pkgdir}/opt/brother/Printers/${_model}/lpd/filter_mfcl8690cdw"
cp -r "inf" "${pkgdir}/opt/brother/Printers/${_model}"
chmod 755 "${pkgdir}/opt/brother/Printers/${_model}/inf"
# CUPS
install -Dm755 "cupswrapper/brother_lpdwrapper_mfcl8690cdw" "${pkgdir}/opt/brother/Printers/${_model}/cupswrapper/brother_lpdwrapper_mfcl8690cdw"
install -Dm755 "cupswrapper/cupswrappermfcl8690cdw" "${pkgdir}/opt/brother/Printers/${_model}/cupswrapper/cupswrappermfcl8690cdw"
install -Dm644 "cupswrapper/brother_mfcl8690cdw_printer_en.ppd" "${pkgdir}/opt/brother/Printers/${_model}/cupswrapper/brother_mfcl8690cdw_printer_en.ppd"

mkdir -p "${pkgdir}/usr/bin"
ln -s "/opt/brother/Printers/mfcl8690cdw/lpd/brprintconf_mfcl8690cdw" "${pkgdir}/usr/bin/brprintconf_mfcl8690cdw"

install -Dm644 "${srcdir}/BROTHER-EULA" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
