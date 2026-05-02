# Maintainer: Stephano Cetola <stephano@cetola.net>
# SPDX-License-Identifier: MIT

pkgbase=mnt-reform-qcacld2-dkms
pkgname=('mnt-reform-qcacld2-dkms' 'mnt-reform-qcacld2-firmware')
_qcacld2_commit=c54d3e596f0e0ffa918e9f5e8f8dbb990cd4d428
_qcacld2_short=${_qcacld2_commit:0:8}

pkgver=20260421.${_qcacld2_short}
pkgrel=1

arch=('aarch64' 'x86_64')
url="https://source.mnt.re/reform/qcacld2"
license=('custom:varies')
makedepends=('git')
options=(!strip !docs !emptydirs)

source=(
  "qcacld2::git+https://source.mnt.re/reform/qcacld2.git#commit=${_qcacld2_commit}"
)
sha256sums=('SKIP')

package_mnt-reform-qcacld2-dkms() {
  pkgdesc="DKMS source for the MNT Reform qcacld2 Wi-Fi driver (pinned ${_qcacld2_short})"
  depends=('dkms')
  provides=('mnt-reform-qcacld2')
  conflicts=('mnt-reform-qcacld2')

  local _dkmsname="mnt-reform-qcacld2"
  local _srcroot="${pkgdir}/usr/src/${_dkmsname}-${pkgver}"

  install -d "${_srcroot}"
  cp -a "${srcdir}/qcacld2/." "${_srcroot}/"
  rm -rf "${_srcroot}/.git"

  cat > "${_srcroot}/dkms.conf" <<EOF_DKMS
PACKAGE_NAME="${_dkmsname}"
PACKAGE_VERSION="${pkgver}"

BUILT_MODULE_NAME[0]="wlan"
BUILT_MODULE_LOCATION[0]="."
DEST_MODULE_LOCATION[0]="/kernel/drivers/net/wireless"

MAKE[0]="make -C /lib/modules/\${kernelver}/build M=\${dkms_tree}/\${PACKAGE_NAME}/\${PACKAGE_VERSION}/build modules \
  WLAN_ROOT=\${dkms_tree}/\${PACKAGE_NAME}/\${PACKAGE_VERSION}/build \
  MODNAME=wlan \
  CONFIG_QCA_WIFI_ISOC=0 CONFIG_QCA_WIFI_2_0=1 CONFIG_QCA_CLD_WLAN=m WLAN_OPEN_SOURCE=1 \
  CONFIG_CLD_HL_SDIO_CORE=y CONFIG_FORCE_MLO_SUPPORT=y"

AUTOINSTALL="yes"
BUILD_EXCLUSIVE_CONFIG="CONFIG_WIRELESS"
EOF_DKMS
}

package_mnt-reform-qcacld2-firmware() {
  pkgdesc="Firmware, config, and modprobe config for MNT Reform qcacld2 Wi-Fi"
  depends=()
  backup=('etc/modprobe.d/reform-qcacld2.conf')

  cd "${srcdir}/qcacld2/debian-meta"

  install -dm755 "$pkgdir/usr/lib/firmware/qcacld2"
  install -Dm644 usr/lib/firmware/qcacld2/* \
    "$pkgdir/usr/lib/firmware/qcacld2/"
  # Also install to the directory where the driver looks
  # Not sure why this happens on Arch and not Debian
  install -dm755 "$pkgdir/usr/lib/firmware"
  install -Dm644 usr/lib/firmware/qcacld2/* \
    "$pkgdir/usr/lib/firmware/"

  install -dm755 "$pkgdir/usr/lib/firmware/wlan/qcacld2"
  install -Dm644 usr/lib/firmware/wlan/qcacld2/* \
    "$pkgdir/usr/lib/firmware/wlan/qcacld2/"
  # Also install to the directory where the driver looks
  # Not sure why this happens on Arch and not Debian
  install -dm755 "$pkgdir/usr/lib/firmware/wlan"
  install -Dm644 usr/lib/firmware/wlan/qcacld2/* \
    "$pkgdir/usr/lib/firmware/wlan/"

  install -Dm644 etc/modprobe.d/reform-qcacld2.conf \
    "$pkgdir/etc/modprobe.d/reform-qcacld2.conf"
}
