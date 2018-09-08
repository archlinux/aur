# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: MadPhysicist <jfoxrabinovitz at gmail dot com>

set -u
pkgname='kyocera-utax-ta'
_pkgver='20140115'
pkgver="0.0.${_pkgver}"
pkgrel='1'
pkgdesc='PPD drivers for Kyocera UTAX TA Triumph Adler CD CDC CLP DC LP P printers copiers wide format'
arch=('i686' 'x86_64')
# https://www.kyoceradocumentsolutions.eu/index/products/product/fs4200dn.technical_specification.html (zip incomplete PPD list)
url='https://www.utax.de/'
#url='https://www.utaxuk.co.uk/'
license=('custom')
depends=('cups')
options=('!strip')
source=(
  "https://www.triumph-adler.com/resource/blob/720/d317ddb2d4689ba40b3d24a409bf5601/talinuxpackages-ccd-clp-${_pkgver}-tar-data.gz"
  "https://www.triumph-adler.com/resource/blob/852/b60e9e48a2dfc4b1e2eedb05a1f71506/linuxppd-p4030mfp-imfp-p4035mfp-imfp-p5035imfp-p6035imfp-20141024-zip-data.zip"
  "https://www.triumph-adler.com/resource/blob/2536/eea11042f08f25b505525a91a95c423d/linuxppd-p3520d-p3521d-dn-pc2160dn-pc2660dn-pc3060dn-pc3570dn-20141024-zip-data.zip"
)
sha1sums=('b2a9f5cab041060d367fe9eb140a17aadb72f0b9'
          '3bd8d8085010d299747bf2f7cb92e9970df57043'
          '02cd98e5346ec4aa008cdb0a648d78f0e4342150')
sha256sums=('d5031282b32266912f08c9f9b19b092c93e8aabda925d83a505e48e185e172ad'
            'a9e2b3e0f8a9e2d9dc3d8828c0276f7b90123a2cfc03c3da11d6e0328a096893'
            'a0581ceb1616a4ba899a4191d219832cd6bafd47934ca2f5e0a5b35c148a04d9')

package() {
  set -u

  # Set language name: Default is English, pick only one
  local _language=(
    'English'
    #'French'
    #'German'
    #'Italian'
    #'Portuguese'
    #'Spanish'
  )

  # Set number of bits: '32bit' or '64bit', depending on ${CARCH}
  declare -A _bittage=([i686]='32bit' [x86_64]='64bit')

  install -d "${pkgdir}/usr/share/cups/model/UTAX_TA"
  find -type 'f' '(' -ipath "*/${_bittage[${CARCH}]}/Global/${_language[0]}/*" -o -ipath "*/LinuxPPD*/Global/${_language[0]}/*" ')' -iname '*.ppd' -exec mv '{}' "${pkgdir}/usr/share/cups/model/UTAX_TA" ';'
  install -d "${pkgdir}/usr/lib/cups/filter/"
  find -type 'f' -ipath "*/${_bittage[${CARCH}]}/Global/${_language[0]}/*" -iname 'kyofilter_*' -exec mv '{}' "${pkgdir}/usr/lib/cups/filter/" ';'
  chmod 555 "${pkgdir}/usr/lib/cups/filter"/*

  # Change extension to lower case .ppd
  local _f1 _f2
  for _f1 in "${pkgdir}/usr/share/cups/model"/*/*.[pP][pP][dD]; do
    _f2="${_f1// /_}"
    _f2="${_f2/.PPD/.ppd}"
    if [ "${_f1}" != "${_f2}" ]; then
      mv "${_f1}" "${_f2}"
    fi
  done

  # remove CR from EOL
  sed -e 's:\r\+$::g' -i "${pkgdir}/usr/share/cups/model"/*/*.ppd

  # grep -he '^*ModelName:' "${pkgdir}/usr/share/cups/model"/*/*.ppd | sort -u > "${startdir}/models.${pkgver}.txt"

  # Compressing hinders package compression which results in a much larger package
  # gzip "${pkgdir}/usr/share/cups/model"/*/*.ppd
  set +u
}
set +u
