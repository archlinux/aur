# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

set -u
pkgname='seagate-seachest'
# The package version is #_#_# not #.#.#.
_pkgver='3.0.2-2_2_1'
pkgver="${_pkgver//-/.}"
pkgrel=1
pkgdesc='Seagate SeaChest suite including Basics Configure (sctReadTimer,TLER,writecache) Erase (secure,trim) Firmware (update) Format (setSectorSize) GenericTests Info Lite PowerControl SMART Security, formerly seaflashlin'
arch=('x86_64')
url='https://www.seagate.com/support/software/seachest/'
#url='https://github.com/Seagate/ToolBin/tree/master/SeaChest'
license=('custom')
depends=('gcc-libs')
#depends+=('ncurses5-compat-libs')
options=('!strip')
source=("SeaChestUtilities_${_pkgver}.zip::http://support.seagate.com/seachest/SeaChestUtilities.zip")
md5sums=('5374f9de4fb37fe5578abb054d4765e8')
sha256sums=('74de19f61962990e34f13689d05dcd702f17c249f8548f07687aeb3c25ba274b')

pkgver_disabled() {
  sed -E -n -e 's/^ SeaChest_Basics Version: ([^-\s]+).*$/\1/p' 'SeaChest_Combo_UserGuides.txt'
}

prepare() {
  set -u
  grep -Fe ' Version:' 'SeaChest_Combo_UserGuides.txt'
  #chmod -R 755 'Linux/Lin64'
  set +u
}

package() {
  set -u
  install -Dpm644 'About.SeaChest.txt' -t "${pkgdir}/usr/share/licenses/${pkgname}"
  local _trim
  case "${CARCH}" in
  x86_64) cd 'Linux/Non-RAID/Lin64-Non_RAID/centos-7_x86_64'; _trim='_x86_64-redhat-linux';;
  *arm*) cd 'Linux/Non-RAID/Lin64-Non_RAID/centos-7_aarch64'; _trim='_aarch64-redhat-linux';;
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
