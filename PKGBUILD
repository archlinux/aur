# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: MadPhysicist <jfoxrabinovitz at gmail dot com>

_opt_kut='kyo'
_opt_kut='ta_utax_'

# Unified: kyocera-cups kyocera-utax-ta

set -u
pkgname='kyocera-utax-ta'
_pkgver='9.1-0'; _rev='20220203'
_blob='dc92d4bd-a761-4c0f-a981-0f1efc7c1a7f'
pkgver="${_pkgver//-/.}.${_rev}"
pkgrel='1'
pkgdesc='PPD drivers for Kyocera UTAX TA Triumph Adler CD CDC CLP DC LP P printers copiers wide format'
arch=('i686' 'x86_64')
# https://www.kyoceradocumentsolutions.eu/index/products/product/fs4200dn.technical_specification.html (zip incomplete PPD list)
#url='https://www.utaxuk.co.uk/'
url='https://www.utax.de/'
license=('custom')
depends=('cups')
depends+=('python-pypdf3' 'python-reportlab')
options=('!strip')
source=(
  "TALinuxDriver${_pkgver%-*}-${_rev}.tar.gz::https://catalogue-prod.utax.de/blobs/${_blob}"
)
md5sums=('fb465c80027fbeadf5634bc91694793b')
sha1sums=('e425379af9119a05a0f08079e664ad9c5178fdee')
sha256sums=('86ceca48b1f5e39944c8f3115223ebd018e2f7ded53667c9d3e90afcb4241da4')

prepare() {
  set -u
  # Set number of bits: '32bit' or '64bit', depending on ${CARCH}
  declare -A _suffix=([i686]='i386' [x86_64]='x86_64')

  local _ver='Redhat/Redhat/Global'
  local _fl="${_ver}/${_opt_kut}dialog_${_suffix[${CARCH}]}/${_opt_kut}dialog-${_pkgver}.${_suffix[${CARCH}]}.rpm"
  set +u; msg2 "Extracting ${_fl}"; set +u
  mkdir 'dta'
  bsdtar -C 'dta' -xf "${_fl}"
  rm -r 'dta/usr/lib/.build-id'
  set +u
}

package() {
  set -u
  # Install the package

  cd 'dta'
  mv 'usr' "${pkgdir}"

  local _pvx="${_pkgver%%-*}"
  _pvx="${_pvx%.0}"

  # From rpm postinstall
  local _ALTERNATE_PPD_DIRECTORY=/usr/share/cups/model/TA_UTAX
  #local _PRIMARY_PPD_DIRECTORY=/usr/share/ppd/ta_utax/
  local _INSTALLED_PPD_DIRECTORY="/usr/share/kyocera/ppd${_pvx}"
  local _TMP_INSTALL="/usr/share/kyocera${_pvx}/"
  #local _PYTHON_DIRECTORY=/usr/share/kyocera/Python/
  #local _KYOCERA_CONFIG=/usr/share/kyocera
  #local _TMP_DIR=/tmp/kyocera_printers
  #local _CONFIG_TMP=/tmp/kyocera_config

  #_ALTERNATE_PPD_DIRECTORY="${_ALTERNATE_PPD_DIRECTORY/kyocera/Kyocera}"
  _INSTALLED_PPD_DIRECTORY="${_TMP_INSTALL}${_INSTALLED_PPD_DIRECTORY##*/}"

  # Change folders to be more like 8.1404 for comparison
  install -d "${pkgdir}/usr/share/cups/model"
  mv "${pkgdir}${_INSTALLED_PPD_DIRECTORY}" "${pkgdir}${_ALTERNATE_PPD_DIRECTORY}"

  # Remove PyPDF3
  rm -r "${pkgdir}${_TMP_INSTALL}"

  if :; then
    # Remove dialog launcher. It doesn't work for me.
    rm "${pkgdir}/usr/bin/${_opt_kut}dialog${_pvx}"
    rm -r "${pkgdir}/usr/share/applications/" "${pkgdir}/usr/share/doc/"
  else
    depends+=('qt5-base')
  fi

  if :; then
    rm "${pkgdir}/usr/bin"/kyoPPD* "${pkgdir}/usr/lib/cups/filter"/kyofilter*
    depends+=('kyocera-cups')
  fi

  # grep -he '^*ModelName:' "${pkgdir}${_ALTERNATE_PPD_DIRECTORY}"/*.ppd | sed -E -e 's: {2,}: :g' | sort -u > "${startdir}/models.${pkgver}.txt"

  # Compressing hinders package compression which results in a much larger package
  # gzip "${pkgdir}${_ALTERNATE_PPD_DIRECTORY}"/*.ppd

  # Install LICENSES
  install -Dpm644 "${srcdir}/LICENSES.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  set +u
}
set +u
