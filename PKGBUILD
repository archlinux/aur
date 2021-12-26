# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

set -u
pkgname='seagate-seachest'
# Version is numbered according to Basics, formerly the firmware upgrader
# The package version is the second set of numbers #_#_#, not the fist #.#.#.
pkgver='3.1.0.2_2_3'
pkgrel=1
pkgdesc='Seagate SeaChest suite including Basics Configure (sctReadTimer,TLER,writecache) Erase (secure,trim) Firmware (update) Format (setSectorSize) GenericTests Info Lite PowerControl SMART Security, formerly seaflashlin'
arch=('x86_64')
url='https://www.seagate.com/support/software/seachest/'
#url='https://github.com/Seagate/ToolBin/tree/master/SeaChest'
#url='https://github.com/Seagate/openSeaChest'
license=('custom')
depends=('gcc-libs')
#depends+=('ncurses5-compat-libs') # no longer as of version 3
options=('!strip')
source=("SeaChestUtilities_${pkgver}.zip::http://support.seagate.com/seachest/SeaChestUtilities.zip")
md5sums=('57af0181d0e31e7862bef0cf44569009')
sha256sums=('6a65140782a07cc36f888ee47a2ba1b5060dca34b4be079114d2e348ac266c23')

pkgver_disabled() {
  sed -E -n -e 's/^ SeaChest_Basics Version: ([^ ]+).*$/\1/p' 'SeaChest_Combo_UserGuides.txt' | sed -e 's:-:.:'
}

prepare() {
  set -u
  grep -Fe ' Version:' 'SeaChest_Combo_UserGuides.txt'
  #grep -Fe ' Version:' 'SeaChest_Combo_UserGuides.txt' > "${startdir}/SeaChest.Version.${pkgver}.txt"
  #chmod -R 755 'Linux/Lin64'
  local _newver="$(sed -E -n -e 's/^ SeaChest_Basics Version: ([^ ]+).*$/\1/p' 'SeaChest_Combo_UserGuides.txt' | sed -e 's:-:.:')"
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
  case "${CARCH}" in
  x86_64) cd $(find -type 'd' -name 'centos-7_x86_64'); _trim='_x86_64-redhat-linux';;
  *arm*) cd $(find -type 'd' -name 'centos-7_aarch64'); _trim='_aarch64-redhat-linux';;
  esac
  local _f _fx
  for _f in SeaChest*; do
    install -Dpm744 "${_f}" "${pkgdir}/usr/bin/${_f%%${_trim}}"
  done
  #install -d "${pkgdir}/usr/share"
  #mv 'man' "${pkgdir}/usr/share"
  set +u
}
set +u
