# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=rtpengine-kernel-dkms
pkgver=26.0.1.3
pkgrel=1
pkgdesc="Kernel module for Sipwise rtpengine media proxy (DKMS)"
url="https://github.com/sipwise/rtpengine"
license=('GPL-3.0-or-later')
arch=('any')
depends=('bash' 'dkms')
provides=("rtpengine-kernel-module=${pkgver}")
conflicts=('rtpengine-kernel-module')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/mr${pkgver}.tar.gz")
sha256sums=('50960682ff4b844b2c3f14bf90c35d3d1e4eb938b2accf1030d7230cba985b5a')

prepare() {
  cd "rtpengine-mr${pkgver}"

  # Patch gen-rtpengine-kmod-flags to work on Arch (remove Debian dependencies)
  sed -i 's|if command -v dpkg-parsechangelog >/dev/null; then|if false; then|' \
    kernel-module/gen-rtpengine-kmod-flags
  sed -i 's|if \[ -f "${M}/../debian/changelog" \]; then|if false; then|' \
    kernel-module/gen-rtpengine-kmod-flags
  sed -i "s|if \[ -z \"\${RTPENGINE_VERSION}\" \]; then|RTPENGINE_VERSION=\"${pkgver}-arch\"\nif false; then|" \
    kernel-module/gen-rtpengine-kmod-flags

  # Create dkms.conf from Debian template:
  # - replace version placeholder
  # - strip "ngcp-" prefix from PACKAGE_NAME
  # - remove deprecated CLEAN directive for modern DKMS compatibility
  sed -e "s|#MODULE_VERSION#|${pkgver}|" \
      -e "s|ngcp-rtpengine|rtpengine|g" \
      -e "/^CLEAN=/d" \
      debian/ngcp-rtpengine-kernel-dkms.dkms > dkms.conf
}

package() {
  cd "rtpengine-mr${pkgver}"

  local dkms_dir="${pkgdir}/usr/src/rtpengine-${pkgver}"
  install -dm755 "${dkms_dir}"

  # Install dkms.conf
  install -Dm644 dkms.conf "${dkms_dir}/dkms.conf"
  
  # Install kernel module sources and Makefile
  install -Dm644 kernel-module/Makefile "${dkms_dir}/Makefile"
  install -Dm644 kernel-module/*.{inc,c,h} -t "${dkms_dir}/"
  
  # Install patched gen-rtpengine-kmod-flags script
  install -Dm755 kernel-module/gen-rtpengine-kmod-flags "${dkms_dir}/gen-rtpengine-kmod-flags"

  # Install modules-load configuration for automatic loading at boot
  # Using the nft_rtpengine configuration since iptables is deprecated in v26
  install -Dm644 kernel-module/nft_rtpengine.modules.load.d \
    "${pkgdir}/usr/lib/modules-load.d/${pkgname}.conf"
}

# vim: set ts=2 sw=2 et:
