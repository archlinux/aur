# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

set -u
pkgname='oki-c321-c331-c531'
pkgver='1.1'
pkgrel='1'
pkgdesc='CUPS printer driver for the Okidata C321 C331 C531'
arch=('any')
url='http://www.okidata.com/'
license=('custom')
depends=('cups')
makedepends=('gzip')
source=('http://www.oki.com/uk/printing/download/C531_C331_C321_Linux_110_31034.zip' 'oki-license.txt')
sha256sums=('45d8b343ec06a849166dcc98e6d3818584a18315ae1fd4c73a784b8adc248091'
            '092bb318766a779c9beff91e831a4cfde2ba99b37a9047f6917b946be768b37c')

package() {
  set -u
  install -Dpm644 'oki-license.txt' -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  cd C*/
  install -d "${pkgdir}/usr/share/cups/model"
  local _ppd
  for _ppd in *.ppd.gz; do
    gunzip < "${_ppd}" | \
    sed -e '/^*NickName:/ s:OKI DATA CORP \(C[0-9][0-9][0-9]\)(PS):Oki \1 PS (OKI DATA CORP \1):g' \
    | gzip > "${pkgdir}/usr/share/cups/model/${_ppd}"
    touch -r "${_ppd}" "${pkgdir}/usr/share/cups/model/${_ppd}"
  done
  set +u
}
set +u
