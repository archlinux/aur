# Maintainer: AnmiTaliDev <anmitali198@gmail.com>

pkgname=mt7902-bluetooth-dkms-git
pkgver=r204.7e6d6e3
pkgrel=1
pkgdesc="DKMS Bluetooth driver for MediaTek MT7902 chipset"
arch=('x86_64')
url="https://github.com/AnmiTaliDev/mt7902-bluetooth-dkms-git"
license=('GPL2')
depends=('dkms' 'mt7902-firmware-git')
makedepends=('git')
provides=('mt7902-bluetooth-dkms')
conflicts=('mt7902-bluetooth-dkms')
install="${pkgname}.install"
source=("git+https://github.com/OnlineLearningTutorials/mt7902_temp.git"
        "dkms.conf"
        "Makefile.dkms")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "${srcdir}/mt7902_temp"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/mt7902_temp"

  # Get the latest kernel version directory
  local kernel_dir=$(ls -d linux-* | sort -V | tail -n1)

  if [ -z "$kernel_dir" ]; then
    echo "Error: No kernel directory found"
    return 1
  fi

  echo "Using kernel directory: $kernel_dir"

  # Copy the bluetooth driver sources to a temporary directory
  mkdir -p "${srcdir}/mt7902-bluetooth"
  cp -r "${kernel_dir}/drivers/bluetooth"/* "${srcdir}/mt7902-bluetooth/"

  # Copy our custom Makefile for DKMS
  cp "${srcdir}/Makefile.dkms" "${srcdir}/mt7902-bluetooth/Makefile"
}

package() {
  local _pkgver="${pkgver}"
  local dkms_dir="${pkgdir}/usr/src/mt7902-bluetooth-${_pkgver}"

  # Create DKMS source directory
  install -dm755 "${dkms_dir}"

  # Copy driver sources
  cp -r "${srcdir}/mt7902-bluetooth"/* "${dkms_dir}/"

  # Install dkms.conf
  install -Dm644 "${srcdir}/dkms.conf" "${dkms_dir}/dkms.conf"

  # Replace version placeholder in dkms.conf
  sed -i "s/@PKGVER@/${_pkgver}/g" "${dkms_dir}/dkms.conf"

  # Install LICENSE
  install -Dm644 "${srcdir}/mt7902_temp/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
