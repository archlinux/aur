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

# KyoceraLinuxPackages_20191115_tar.gz is a GUI addon that would be a separate package if anyone wanted it.

_opt_UTAX=0

set -u
pkgname='kyocera-cups'
pkgver='8.1601'
pkgrel='2'
pkgdesc='PPD drivers for Kyocera CS ECOSYS FS KM TASKalfa KPDL printers copiers wide format'
arch=('i686' 'x86_64')
# https://www.kyoceradocumentsolutions.eu/index/products/product/fs4200dn.technical_specification.html (zip incomplete PPD list)
#url='https://usa.kyoceradocumentsolutions.com/en/products-services/hardware/printers/ecosys-fs-4200dn.html' # (.tar.gz complete PPD list)
url='https://www.kyoceradocumentsolutions.us/en/support/downloads.html' # select FS-4200dn
license=('custom')
depends=('cups')
conflicts=('kyocera-ecosys-m2035dn' 'kyocera-ecosys-p6035cdn')
options=('!strip')
#install="${pkgname}.install"
# https://downloads.kyoceradocumentsolutions.com.au/drivers/Drivers/KyoceraLinuxPackages-20141229.tar.gz # 8.1404
#source=("https://cdn.kyostatics.net/dlc/eu/driver/all/linux_8_1602_ecosys.-downloadcenteritem-Single-File.downloadcenteritem.tmp/Linux_8.1602_EC..._P5021_5026.zip")
#source=("https://usa.kyoceradocumentsolutions.com/content/dam/kdc/kdag/downloads/technical/executables/drivers/kyoceradocumentsolutions/us/en/Kyocera_Linux_PPD_Ver_${pkgver}.tar.gz")
_srcdir="Kyocera_Linux_PPD_Ver_${pkgver}.tar.gz"
#source=("${_srcdir}::https://www.kyoceradocumentsolutions.us/content/download-center-americas/us/drivers/drivers/${_srcdir//./_}.download.gz")
source=("https://la.kyoceradocumentsolutions.com/content/dam/kdc/kdag/downloads/technical/executables/drivers/kyoceradocumentsolutions/lad/en/Kyocera_Linux_PPD_Ver_${pkgver}.tar.gz")
md5sums=('23228956c4f4df8a57dca10c9d783b59'
         'd3e7d0fe76377b0b058a9fb497cdfafa')
sha1sums=('ad7adba5e29464e9c3c1f052c6899d54f5afe0f4'
          'cdb6d5622f9ca977ac178fb19553f5730096597b')
sha256sums=('1375b67d4f79be0a02418cf8a03ea475e20ef92bf221fdb585f15a55c2d964e5'
            'c0ca7dba26542a9b75b51300da289e753cfaa0f43b09c9230041ab5c728b49a4')

source+=('repack.sh')

#_uagent='Mozilla'
#_uagent='Mozilla/5.0 (X11; Linux x86_64; rv:63.0) Gecko/20100101 Firefox/63.0'
#DLAGENTS=("${DLAGENTS[@]//curl -/curl -A '${_uagent}' -}")

if [ "${_opt_UTAX}" -ne 0 ]; then
  pkgdesc='PPD drivers for Kyocera CS ECOSYS FS KM TASKalfa KPDL and UTAX TA Triumph Adler printers copiers wide format'
  source+=('TALinuxPackages-20141229-Repack.7z')
  md5sums+=('5426711f3aac491c49dadcf420207b4b')
  sha1sums+=('8d1251d95f576c2e834e8c71b9840da54202db2b')
  sha256sums+=('8eedb636fbbb208b45dc355a795237d946141d00c63f3fe1fc96c4614070e01a')
  conflicts+=('kyocera-utax-ta')
fi

declare -gA _bittage=([i686]='32bit' [x86_64]='64bit')

prepare() {
  set -u
  # Set number of bits: '32bit' or '64bit', depending on ${CARCH}
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

_package_UTAX() {
  set -u
  if [ -d 'LinuxPackagesTA' ]; then # _opt_UTAX
    cd 'LinuxPackagesTA'
    # Set language name: Default is English
    # Valid options are: English, French, German, Italian, Portuguese, Spanish
    # Options are result of `ls LinuxPackagesTA/${_bittage}/Global`
    local _language='English'

    # LICENSES.txt documents are identical, copy only one of them:
    install -Dm644 'LICENSES.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES-UTAX.txt"

    # Install TA PPDs
    install -Dm644 "${_bittage[${CARCH}]}/Global/${_language}/PPDs"/*.[pP][pP][dD] -t "${pkgdir}/usr/share/cups/model/UTAX_TA"

    local _f1 _f2
    for _f1 in "${pkgdir}/usr/share/cups/model"/*/*.[pP][pP][dD]; do
      _f2="${_f1// /_}"
      _f2="${_f2/.PPD/.ppd}"
      if [ "${_f1}" != "${_f2}" ]; then
        mv "${_f1}" "${_f2}"
      fi
    done

    # kyofilter_C programs are identical for a given bittage, copy only one of them:
    install -Dm755 "${_bittage[${CARCH}]}/Global/${_language}/filter/kyofilter_C" -t "${pkgdir}/usr/lib/cups/filter"
    cd ..
  fi
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

  _package_UTAX

  # grep -he '^*ModelName:' "${pkgdir}/usr/share/cups/model/Kyocera"/*.ppd | sort -u > "${startdir}/models.${pkgver}.txt"

  # Compressing hinders package compression which results in a much larger package
  # gzip "${pkgdir}/usr/share/cups/model/Kyocera"/*.ppd

  # Install LICENSES
  install -Dpm644 "${srcdir}/dist/KyoceraLinuxPackages/LICENSES.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.txt"
  set +u
}
set +u
