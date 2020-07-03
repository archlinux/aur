# Maintainer: Kamil Pajek <kamil.pajek@gmail.com>
_Model='HL-L5000D'
_MODEL="${_Model//-/}"
_model="${_MODEL,,}"
pkgname="brother-${_Model,,}"
pkgver='3.5.1'
pkgrel='1'
pkgdesc="LPR and CUPS driver for the Brother ${_Model}"
arch=('x86_64' 'i686')
url="https://support.brother.com/g/b/producttop.aspx?c=eu_ot&lang=en&prod=${_model}_us_eu_as"
license=('custom:EULA' 'GPL2')
depends=('cups' 'perl')
optdepends=('print-manager: A tool for managing print jobs and printers'
            'system-config-printer: A CUPS printer configuration tool and status applet')
source=("https://download.brother.com/welcome/dlf102543/${_model}lpr-${pkgver}-${pkgrel}.i386.rpm"
        "https://download.brother.com/welcome/dlf102544/${_model}cupswrapper-${pkgver}-${pkgrel}.i386.rpm"
        'lpr-license.txt')
b2sums=('c1dd8ddbec5da0a8923132fb4ca29b2be84e7551de5d4dc200900a3b86d0d86cc9a8e51f39b7f5118614f30df0a0a5f5dd9a8cf83f30ebb8a76ea49b0505bca8'
        '1618eca6a2152f609e3b7b8d994f17df9653863c83ffd4d1f22f2b89e16a2a8adc92f4f31bd1aaf879e583cc14cfed1afd23aeb9eba3577520d7c078c589e331'
        'a89bdc1fe13befa9a1813e61ca09e9b5ab4b528bce707a4cbd93d819341e9274fe886336f173e84b11819ed97eb5cd2ef0caea1dec8517fb34ddc60dd2c79e0c')

package() {
  sed -i "s/Brother ${_MODEL}/Brother ${_Model}/" \
         "${srcdir}/opt/brother/Printers/${_MODEL}/cupswrapper/brother-${_MODEL}-cups-en.ppd"

  cp -a "${srcdir}/var" "${pkgdir}"

  for _file in \
    "cupswrapper/brother-${_MODEL}-cups-en.ppd" \
    "inf/br${_MODEL}func" \
    "inf/br${_MODEL}rc"
  do
    install -Dm644 {${srcdir},${pkgdir}}"/opt/brother/Printers/${_MODEL}/${_file}"
  done

  for _file in \
    "cupswrapper/lpdwrapper" \
    "cupswrapper/paperconfigml2" \
    "inf/setupPrintcap" \
    "lpd/lpdfilter"
  do
    install -Dm755 {${srcdir},${pkgdir}}"/opt/brother/Printers/${_MODEL}/${_file}"
  done

  for _file in brprintconflsr3 rawtobr3; do
    install -Dm755 \
    "${srcdir}/opt/brother/Printers/${_MODEL}/lpd/${CARCH}/${_file}" \
    "${pkgdir}/opt/brother/Printers/${_MODEL}/lpd/${_file}"
  done

  install -d "${pkgdir}/usr/share/cups/model"
  ln -s "/opt/brother/Printers/${_MODEL}/cupswrapper/brother-${_MODEL}-cups-en.ppd" \
        "${pkgdir}/usr/share/cups/model"

  install -d "${pkgdir}/usr/lib/cups/filter"
  ln -s "/opt/brother/Printers/${_MODEL}/cupswrapper/lpdwrapper" \
        "${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_${_MODEL}"

  install -d "${pkgdir}/etc/opt/brother/Printers/${_MODEL}/inf/"
  ln -s "/opt/brother/Printers/${_MODEL}/inf/br${_MODEL}rc" \
        "${pkgdir}/etc/opt/brother/Printers/${_MODEL}/inf/"

  install -Dm444 'lpr-license.txt' "${pkgdir}/usr/share/licenses/${pkgname}/lpr-license.txt"

  ln -s "/usr/share/licenses/common/GPL2/license.txt" \
  "${pkgdir}/usr/share/licenses/${pkgname}/cupswrapper-license.txt"
}
