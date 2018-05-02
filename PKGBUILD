# Maintainer: Sibren Vasse <arch at sibrenvasse dot nl>
# Contributor: Matt Welch <matt dot welch at gmail dot com>
# Contributor: Anish Bhatt <anish at gatech dot edu>
# Contributor: Det <nimetonmaili gmail a-dot com>
# Contributor: Alucryd <alucryd at gmail dot com>
# Contributor: Jason Melton <jason dot melton at gmail dot com>
# Contributor: Youpi <max dot flocard at gmail dot com>
# Contributor: sl1pkn07 <sl1pkn07 at gmail dot com>

pkgname=nvidia-beta-dkms
pkgver=396.24
pkgrel=1
pkgdesc="NVIDIA kernel module sources (DKMS) - BETA version"
arch=('x86_64')
url="http://www.nvidia.com/"
license=('custom:NVIDIA')
depends=('dkms' 'linux' "nvidia-utils-beta>=${pkgver}" 'libgl')
optdepends=('linux-headers: Build the module for Arch kernel'
            'linux-lts-headers: Build the module for LTS Arch kernel')
provides=("nvidia=${pkgver}" 'nvidia-dkms')
conflicts=('nvidia')
options=('!strip')
install=${pkgname}.install
_pkg="NVIDIA-Linux-x86_64-$pkgver-no-compat32"
source=("http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
sha256sums=('41b80d2a4519ac78ac17c02fec976256d2ba5c9618640d2a9be9cb70685b2a9c')

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
