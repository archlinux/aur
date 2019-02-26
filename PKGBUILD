# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

set -u
pkgname='seagate-seachest'
# Version is numbered according to the firmware upgrader
_pver='2.5.4'
_plib='1_18_3' # Sometimes the library version is slightly off
pkgver="${_pver}.${_plib}"
pkgrel='1'
pkgdesc='Seagate SeaChest suite including Basics Configure (sctReadTimer,TLER,writecache) Erase (secure,trim) Firmware (update) Format (setSectorSize) GenericTests Info Lite PowerControl SMART Security, formerly seaflashlin'
arch=('i686' 'x86_64')
url='https://www.seagate.com/support/software/seachest/'
#url='https://github.com/Seagate/ToolBin/tree/master/SeaChest'
license=('custom')
options=('!strip')
source=('http://support.seagate.com/seachest/SeaChestUtilities.zip')
md5sums=('d3d2d1dd58d9b5c669662997d9d78062')
sha256sums=('e30848b722d72ad9fe014dafedc8e65389d82800465c7cc3430e40181bbf6922')

SOURCE_DATE_EPOCH='disabled' # disable reproducible builds FFS

package() {
  set -u
  cd 'Linux'
  declare -A _archf=([i686]='32' [x86_64]='64')
  if [ ! -f "Lin${_archf[${CARCH}]}/SeaChest_Firmware_${_pver//./}_${_plib//_/}_${_archf[${CARCH}]}" ]; then
    echo "New version"
    set +u
    false
  fi
  local _f _fx
  for _f in "Lin${_archf[${CARCH}]}"/*; do
    _fx="${_f%%_[[:digit:]]*}"
    install -Dpm744 "${_f}" "${pkgdir}/usr/bin/${_fx##*/}"
  done
  for _f in *.txt; do
    _fx="${_f%%.[[:digit:]]*}.txt"
    install -Dpm644 "${_f}" "${pkgdir}/usr/share/doc/${pkgname}/${_fx##*/}"
  done
  set +u
}
set +u
