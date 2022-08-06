# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

# 1 for RAID
# 0 for non RAID (smaller)
_opt_RAID=0

set -u
pkgname='seagate-seachest'
# Version is numbered according to Basics, formerly the firmware upgrader
# The package version is the second set of numbers #_#_#, not the fist #.#.#.
pkgver='3.3.1.3_2_1'
pkgrel=1
pkgdesc='Seagate SeaChest suite including Basics Configure (sctReadTimer,TLER,writecache) Erase (secure,trim) Firmware (update) Format (setSectorSize) GenericTests Info Lite PowerControl SMART Security, formerly seaflashlin'
arch=('x86_64')
url='https://www.seagate.com/support/software/seachest/'
#url='https://github.com/Seagate/ToolBin/tree/master/SeaChest'
#url='https://github.com/Seagate/openSeaChest'
license=('custom')
depends=('gcc-libs')
#depends+=('ncurses5-compat-libs') # no longer as of version 3
#if [ "${_opt_RAID}" -ne 0 ]; then
#  makedepends=('unzip')
#fi
options=('!strip')
source=("SeaChestUtilities_${pkgver}.zip::http://support.seagate.com/seachest/SeaChestUtilities.zip")
md5sums=('deb6bdc43d84e5ccb0284c354f5638e6')
sha256sums=('6a6afd6767aa00ee43716398585960674c4ddbdb9abdc1640fb63f63e4b48e51')

pkgver_disabled() {
  sed -E -n -e 's/^ SeaChest_Basics Version: ([^ ]+).*$/\1/p' 'SeaChest_Combo_UserGuides.txt' | sed -e 's:-:.:'
}

prepare() {
  set -u
  grep -Fe ' Version:' 'SeaChest_Combo_UserGuides.txt'
  #grep -Fe ' Version:' 'SeaChest_Combo_UserGuides.txt' > "${startdir}/SeaChest.Version.${pkgver}.txt"
  #chmod -R 755 'Linux/Lin64'
  local _newver
  _newver="$(sed -E -n -e 's/^ SeaChest_Basics Version: ([^ ]+).*$/\1/p' 'SeaChest_Combo_UserGuides.txt' | sed -e 's:-:.:')"
  if [ "${pkgver}" != "${_newver}" ]; then
    echo "New Version ${_newver}"
    set +u
    exit 1
  fi
  set +u
}

package() {
  set -u
  install -Dpm644 'About.SeaChest.txt' -t "${pkgdir}/usr/share/licenses/${pkgname}"
  local _trim
  if [ "${_opt_RAID}" -eq 0 ]; then
    case "${CARCH}" in
    x86_64) pushd $(find -type 'd' -name 'x86_64') > /dev/null; _trim='_x86_64-';;
    *arm*) pushd $(find -type 'd' -name 'aarch64') > /dev/null; _trim='_aarch64-';;
    esac
    for _f in SeaChest*; do
      install -Dpm744 "${_f}" "${pkgdir}/usr/bin/${_f%%${_trim}*}"
    done
  else
    case "${CARCH}" in
    x86_64) pushd $(find -type 'd' -name 'x86_64-RAID') > /dev/null; _trim='_x86_64-';;
    *arm*) pushd $(find -type 'd' -name 'aarch64_RAID') > /dev/null; _trim='_aarch64-';;
    esac
    install -d "${pkgdir}/tmp"
    local _f _fx
    for _f in SeaChest*.zip; do
      #unzip -q -o -d "${pkgdir}/tmp" "${_f}"
      bsdtar -C "${pkgdir}/tmp" -xf "${_f}"
    done
    pushd "${pkgdir}/tmp" > /dev/null
    for _f in SeaChest*; do
      #unzip -q -P 'I-have-read-and-accept-the-Seagate-and-Broadcom-Licenses' "${_f}"
      bsdtar --passphrase 'I-have-read-and-accept-the-Seagate-and-Broadcom-Licenses' -xf "${_f}"
    done
    install -Dpm644 *.txt *.pdf -t "${pkgdir}/usr/share/licenses/${pkgname}"
    for _f in SeaChest*/SeaChest*; do
      install -Dpm744 "${_f}" "${pkgdir}/usr/bin/${_f%%${_trim}*}"
    done
    popd > /dev/null
    rm -rf "${pkgdir}/tmp"
  fi
  popd > /dev/null
  install -d "${pkgdir}/usr/share/doc"
  mv 'doc' "${pkgdir}/usr/share/doc/${pkgname}"
  mv 'SeaChest_Combo_UserGuides.txt' "${pkgdir}/usr/share/doc/${pkgname}"
  #install -d "${pkgdir}/usr/share"
  #mv 'man' "${pkgdir}/usr/share"
  set +u
}
set +u
