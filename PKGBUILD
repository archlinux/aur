# Maintainer : Anish Bhatt <anish at gatech dot edu>
# Co-Maintainer: Det <nimetonmaili gmail a-dot com>
# Contributor: Alucryd <alucryd at gmail dot com>
# Contributor: Jason Melton <jason dot melton at gmail dot com>
# Contributor: Youpi <max dot flocard at gmail dot com>
# Contributor: sl1pkn07 <sl1pkn07 at gmail dot com>

pkgname=nvidia-beta-dkms
pkgver=378.13
pkgrel=1
pkgdesc="NVIDIA kernel module sources (DKMS) - BETA version"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.nvidia.com/"
license=('custom:NVIDIA')
depends=('dkms' 'linux>=3.7' 'linux<4.10' "nvidia-utils-beta>=${pkgver}" 'libgl')
optdepends=('linux-headers: Build the module for Arch kernel'
            'linux-lts-headers: Build the module for LTS Arch kernel')
provides=("nvidia=${pkgver}" 'nvidia-dkms')
conflicts=('nvidia')
options=('!strip')
install=${pkgname}.install
source_i686=("http://us.download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run")
source_x86_64=("http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
source_armv7h=("http://us.download.nvidia.com/XFree86/Linux-x86-ARM/${pkgver}/NVIDIA-Linux-armv7l-gnueabihf-${pkgver}.run")
# http://us.download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run.md5
# http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run.md5
# http://us.download.nvidia.com/XFree86/Linux-x86-ARM/${pkgver}/NVIDIA-Linux-armv7l-gnueabihf-${pkgver}.run.md5
md5sums_i686=('dd1077750af9a067739ec291fb24175f')
md5sums_x86_64=('fe4d25b19a780a690cafc8e3b7c0113f')
md5sums_armv7h=('34c4ed565c7c6f5aad208f2292e54413')

[[ $CARCH == i686 ]] && _pkg=NVIDIA-Linux-x86-${pkgver}
[[ $CARCH == x86_64 ]] && _pkg=NVIDIA-Linux-x86_64-${pkgver}-no-compat32
[[ $CARCH == armv7h ]] && _pkg=NVIDIA-Linux-armv7l-gnueabihf-${pkgver}

prepare() {
  # Remove previous builds
  if [[ -d ${_pkg} ]]; then
    rm -rf ${_pkg}
  fi
  
  # Extract
  sh ${_pkg}.run --extract-only
  cd ${_pkg}/kernel
  # patches here

  # Update dkms.conf
  sed -e "s/__VERSION_STRING/${pkgver}/" \
      -e 's/__JOBS/${&}/' \
      -e 's/__DKMS_MODULES//' \
      -e '4iBUILT_MODULE_NAME[0]="nvidia"\
DEST_MODULE_LOCATION[0]="/kernel/drivers/video"\
BUILT_MODULE_NAME[1]="nvidia-uvm"\
DEST_MODULE_LOCATION[1]="/kernel/drivers/video"\
BUILT_MODULE_NAME[2]="nvidia-modeset"\
DEST_MODULE_LOCATION[2]="/kernel/drivers/video"\
BUILT_MODULE_NAME[3]="nvidia-drm"\
DEST_MODULE_LOCATION[3]="/kernel/drivers/video"\
__JOBS=`nproc`'\
    -i dkms.conf
}

package() {
  cd ${_pkg}/kernel

  # Create directory structure
  install -d "${pkgdir}"/usr/lib/modprobe.d/
  install -d "${pkgdir}"/usr/share/licenses/
  install -d "${pkgdir}"/usr/src/nvidia-${pkgver}/

  # Install
  cp -dr --no-preserve=ownership * "${pkgdir}"/usr/src/nvidia-${pkgver}/

  # Link license
  ln -s /usr/share/licenses/nvidia "${pkgdir}"/usr/share/licenses/${pkgname}

  # Blacklist Nouveau
  echo "blacklist nouveau" > "${pkgdir}"/usr/lib/modprobe.d/nvidia.conf
}

# vim: ts=2 sw=2 et:
