# Maintainer : Anish Bhatt <anish at gatech dot edu>
# Contributor: Alucryd <alucryd at gmail dot com>
# Contributor: Jason Melton <jason dot melton at gmail dot com>
# Contributor: Youpi <max dot flocard at gmail dot com>
# Contributor: sl1pkn07 <sl1pkn07 at gmail dot com>

pkgname=nvidia-beta-dkms
pkgver=355.06
pkgrel=1
pkgdesc="NVIDIA kernel module sources (DKMS) - BETA version"
makedepends=('pacman>=4.2.0')
arch=('i686' 'x86_64')

[[ $CARCH == i686 ]] && _arch=x86 && _pkg=NVIDIA-Linux-${_arch}-${pkgver}
[[ $CARCH == x86_64 ]] && _arch=x86_64 && _pkg=NVIDIA-Linux-${_arch}-${pkgver}-no-compat32

url="http://www.nvidia.com/"
license=('custom:NVIDIA')
depends=('dkms' 'linux>=3.7' 'linux<4.2' "nvidia-utils-beta>=${pkgver}")
provides=("nvidia=${pkgver}" 'nvidia-dkms')
conflicts=('nvidia-beta')

source=("http://us.download.nvidia.com/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run")

# http://us.download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run.md5
# http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run.md5
md5sums=('8bdf64adc94bd9e170e4a7412ca9e5ba')
[ "${CARCH}" = 'x86_64' ] && md5sums[0]='8bdf64adc94bd9e170e4a7412ca9e5ba'

install=${pkgname}.install

prepare() {
  pushd "${srcdir}"

# Extract
  if [[ -d ${_pkg} ]] ; then
    rm -rf ${_pkg}
  fi
  sh ${_pkg}.run --extract-only

  pushd ${_pkg}/kernel
  eval "sed -i 's/__VERSION_STRING/${pkgver}/' dkms.conf"
  sed -i 's/__JOBS/${&}/' dkms.conf
  sed -i '4iBUILT_MODULE_NAME[0]="nvidia"\
DEST_MODULE_LOCATION[0]="/kernel/drivers/video"\
BUILT_MODULE_NAME[1]="nvidia-uvm"\
DEST_MODULE_LOCATION[1]="/kernel/drivers/video"\
__JOBS=`nproc`' dkms.conf
  sed -i 's/__DKMS_MODULES//' dkms.conf
  popd
  popd
}

package() {
  cd "${srcdir}"/${_pkg}/kernel

# Install
  install -dm 755 "${pkgdir}"/usr/{lib/modprobe.d,share/licenses,src/nvidia-${pkgver}}
  cp -dr --no-preserve=ownership * "${pkgdir}"/usr/src/nvidia-${pkgver}/

  echo "blacklist nouveau" > "${pkgdir}"/usr/lib/modprobe.d/nvidia.conf
  ln -s /usr/share/licenses/nvidia "${pkgdir}"/usr/share/licenses/${pkgname}

# Fix permissions
  find "${pkgdir}" -type d -exec chmod 755 {} +
  find "${pkgdir}" -type f -exec chmod 644 {} +
  chmod 755 "${pkgdir}"/usr/src/nvidia-${pkgver}/conftest.sh
}

# vim: ts=2 sw=2 et:
