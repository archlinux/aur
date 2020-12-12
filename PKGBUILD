# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: MadPhysicist <jfoxrabinovitz at gmail dot com>

# UTAX TA Triumph Adler printers TALinuxPackages-20141229.tar.gz are no longer included from 8.1404 to 8.1601
# source = http://usa.kyoceradocumentsolutions.com/americas/jsp/upload/resource/27560/0/Kyocera%20Linux%20PPD%20Ver%208.1404.exe    4ed4db0e25daf989e36360351a8ba26e303b8483
# source = http://usa.kyoceradocumentsolutions.com/americas/jsp/upload/resource/27560/0/Kyocera%20Linux%20PPD%20Ver%208.1404.tar.gz bb6a30802f3b945e023a3f1fcdf69e1b6f5fd92d
# "Kyocera Linux PPD Ver 8.1404.tar.gz" 183530945
# TALinuxPackages-20141229.tar.gz 85084682 16855339a3d6d01a61fd9bdb6f6ec4df 7112f6d4801a758e522921ee5d71f44bbf5eddfc
# Most UTAX printers are available from https://www.utax.com/ https://www.utax.de/ https://www.utaxuk.co.uk/
# UTAX file versions use kyofilter_B and are slightly older than the ones distributed by Kyocera

# TODO: Some printer models have newer or older drivers. Should we add them?

# How to find driver (long pauses for page display)
# Kyocera USA Download Center, Drivers, Product Category: All, Products: All, Technical Downloads: Drivers, Operating System: UNIX / LINUX

set -u
pkgname='kyocera-cups'
pkgver='8.1601'
pkgrel='2'
#pkgdesc='PPD drivers for Kyocera CS ECOSYS FS KM TASKalfa KPDL and UTAX TA Triumph Adler printers copiers wide format'
pkgdesc='PPD drivers for Kyocera CS ECOSYS FS KM TASKalfa KPDL printers copiers wide format'
arch=('i686' 'x86_64')
# https://www.kyoceradocumentsolutions.eu/index/products/product/fs4200dn.technical_specification.html (zip incomplete PPD list)
url='https://usa.kyoceradocumentsolutions.com/en/products-services/hardware/printers/ecosys-fs-4200dn.html' # (.tar.gz complete PPD list)
license=('custom')
depends=('cups')
conflicts=('kyocera-ecosys-m2035dn' 'kyocera-ecosys-p6035cdn')
options=('!strip')
#install="${pkgname}.install"
# https://downloads.kyoceradocumentsolutions.com.au/drivers/Drivers/KyoceraLinuxPackages-20141229.tar.gz # 8.1404
#source=("https://cdn.kyostatics.net/dlc/eu/driver/all/linux_8_1602_ecosys.-downloadcenteritem-Single-File.downloadcenteritem.tmp/Linux_8.1602_EC..._P5021_5026.zip")
#source=("https://usa.kyoceradocumentsolutions.com/content/dam/kdc/kdag/downloads/technical/executables/drivers/kyoceradocumentsolutions/us/en/Kyocera_Linux_PPD_Ver_${pkgver}.tar.gz")
_srcdir="Kyocera_Linux_PPD_Ver_${pkgver}.tar.gz"
source=("${_srcdir}::https://www.kyoceradocumentsolutions.us/content/download-center-americas/us/drivers/drivers/${_srcdir//./_}.download.gz")
md5sums=('23228956c4f4df8a57dca10c9d783b59')
sha1sums=('ad7adba5e29464e9c3c1f052c6899d54f5afe0f4')
sha256sums=('1375b67d4f79be0a02418cf8a03ea475e20ef92bf221fdb585f15a55c2d964e5')

#_uagent='Mozilla'
#_uagent='Mozilla/5.0 (X11; Linux x86_64; rv:63.0) Gecko/20100101 Firefox/63.0'
#DLAGENTS=("${DLAGENTS[@]//curl -/curl -A '${_uagent}' -}")

prepare() {
  set -u
  # Set number of bits: '32bit' or '64bit', depending on ${CARCH}
  declare -A _bittage=([i686]='32bit' [x86_64]='64bit')
  declare -A _suffix=([i686]='i386' [x86_64]='amd64')

  # Set language name: Default is English
  # Valid options are: de, en, es, fr, it, pt
  # Options are result of `ls ${srcdir}/dist/KyoceraLinuxPackages/Global/${_bittage}`
  local _language='en'

  # No additional makedepends since bsdtar can handle rpms:
  # http://unix.stackexchange.com/a/125703/79307
  bsdtar -xf "dist/KyoceraLinuxPackages/Global/${_bittage[${CARCH}]}/kyodialog3.${_language}_0.5-0_${_suffix[${CARCH}]}.rpm"
  set +u
}

package() {
  set -u
  # Install the package
  mv 'usr' "${pkgdir}"

  # Change folders to be more like 8.1404 for comparison
  install -d "${pkgdir}/usr/share/cups/model"
  mv "${pkgdir}/usr/share/ppd/kyocera" "${pkgdir}/usr/share/cups/model/Kyocera"
  rmdir "${pkgdir}/usr/share/ppd"

  if :; then
    # Remove dialog launcher. It doesn't work for me.
    rm "${pkgdir}/usr/bin/kyodialog3"
    rm -r "${pkgdir}/usr/share/applications/" "${pkgdir}/usr/share/doc/" "${pkgdir}/usr/share/kyocera"
  fi

  # grep -he '^*ModelName:' "${pkgdir}/usr/share/cups/model/Kyocera"/*.ppd | sort -u > "${startdir}/models.${pkgver}.txt"

  # Compressing hinders package compression which results in a much larger package
  # gzip "${pkgdir}/usr/share/cups/model/Kyocera"/*.ppd

  # Install LICENSES
  install -Dpm644 "${srcdir}/dist/KyoceraLinuxPackages/LICENSES.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.txt"
  set +u
}
set +u
