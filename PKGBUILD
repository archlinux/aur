# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

set -u
pkgname='seagate-seachest'
pkgver=3.0.2
pkgrel=1
pkgdesc='Seagate SeaChest suite including Basics Configure (sctReadTimer,TLER,writecache) Erase (secure,trim) Firmware (update) Format (setSectorSize) GenericTests Info Lite PowerControl SMART Security, formerly seaflashlin'
arch=('x86_64')
url='https://www.seagate.com/support/software/seachest/'
#url='https://github.com/Seagate/ToolBin/tree/master/SeaChest'
license=('custom')
depends=('gcc-libs')
#depends+=('ncurses5-compat-libs')
options=('!strip')
source=("SeaChestUtilities_${pkgver}.zip::http://support.seagate.com/seachest/SeaChestUtilities.zip")
md5sums=('f93b3468976df0282d1c54a610ecc62d')
sha256sums=('39f5f4ff7a0bc2cd26baabe6d6d4093fd0c5ad3df3aa7078bca7eb725e9aa629')

pkgver() {
  sed -E -n -e 's/^ SeaChest_Basics Version: ([^-\s]+).*$/\1/p' 'SeaChest_Combo_UserGuides.txt'
}

prepare() {
  set -u
  grep -Fe ' Version:' 'SeaChest_Combo_UserGuides.txt'
  chmod -R 755 'Linux/Lin64'
  set +u
}

package() {
  set -u
  install -Dpm644 'About.SeaChest.txt' -t "${pkgdir}/usr/share/licenses/${pkgname}"
  local _trim
  case "${CARCH}" in
  x86_64) cd 'Linux/Lin64/centos-7_x86_64'; _trim='_x86_64-redhat-linux';;
  *arm*) cd 'Linux/Lin64/centos-7_aarch64'; _trim='_aarch64-redhat-linux';;
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
