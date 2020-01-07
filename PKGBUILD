# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

set -u
pkgname='seagate-seachest'
pkgver=2.8.0
pkgrel=1
pkgdesc='Seagate SeaChest suite including Basics Configure (sctReadTimer,TLER,writecache) Erase (secure,trim) Firmware (update) Format (setSectorSize) GenericTests Info Lite PowerControl SMART Security, formerly seaflashlin'
arch=('x86_64')
url='https://www.seagate.com/support/software/seachest/'
#url='https://github.com/Seagate/ToolBin/tree/master/SeaChest'
license=('custom')
depends=('gcc-libs' 'ncurses5-compat-libs')
options=('!strip')
source=("SeaChestUtilities_${pkgver}.zip::http://support.seagate.com/seachest/SeaChestUtilities.zip")
md5sums=('37b5c22f9f26d4781e9463a10693ca1d')
sha256sums=('7106aa2467a78eef57384e28b8b6f994a2fc9c38742b917533e991dbbbc2777c')

pkgver() {
  sed -E -n -e 's/^ SeaChest_Basics Version: (.*)\r$/\1/p' 'SeaChest_Combo_UserGuides.txt'
}

prepare() {
  set -u
  grep -Fe ' Version:' 'SeaChest_Combo_UserGuides.txt'
  set +u
}

package() {
  set -u
  install -Dpm644 'About.SeaChest.txt' -t "${pkgdir}/usr/share/licenses/${pkgname}"
  cd 'Linux'
  declare -A _archf=([i686]='32' [x86_64]='64')
  local _f _fx
  for _f in "Lin${_archf[${CARCH}]}"/*; do
    _fx="${_f%%_[[:digit:]]*}"
    install -Dpm744 "${_f}" "${pkgdir}/usr/bin/${_fx##*/}"
  done
  install -d "${pkgdir}/usr/share"
  mv 'man' "${pkgdir}/usr/share"
  set +u
}
set +u
