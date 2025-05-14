# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=rtpengine-kernel-dkms
pkgver=13.3.1.4
pkgrel=1
pkgdesc="Kernel module for rtpengine media proxy"
url="https://github.com/sipwise/rtpengine"
license=('GPL-3.0-or-later')
arch=('x86_64')
depends=('bash' 'dkms')
optdepends=('linux: The Linux kernel'
            'linux-headers: Header files and scripts for building modules for Linux kernel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/mr${pkgver}.tar.gz")
sha256sums=('b67f3589b9cf51df80908d80645f323a2bcaf35ee59326b4dc3660a721ed8250')

prepare() {
  cd "rtpengine-mr${pkgver}"

  # Patch gen-rtpengine-kmod-flags to work on Arch (remove Debian dependencies)
  sed -i 's|if command -v dpkg-parsechangelog >/dev/null; then|if false; then|' \
    kernel-module/gen-rtpengine-kmod-flags
  sed -i 's|if \[ -f "${M}/../debian/changelog" \]; then|if false; then|' \
    kernel-module/gen-rtpengine-kmod-flags
  sed -i "s|if \[ -z \"\${RTPENGINE_VERSION}\" \]; then|RTPENGINE_VERSION=\"${pkgver}-arch\"\nif false; then|" \
    kernel-module/gen-rtpengine-kmod-flags

  # Create dkms.conf from template, replacing placeholders
  sed -e "s|#MODULE_VERSION#|${pkgver}|" \
    -e "s|ngcp-||" \
    -e "s|^CLEAN=|CLEAN_SPEC=|" \
    debian/ngcp-rtpengine-kernel-dkms.dkms >dkms.conf
}

package() {
  cd "rtpengine-mr${pkgver}"

  # Install dkms.conf and kernel module sources
  install -Dm644 dkms.conf "${pkgdir}/usr/src/rtpengine-${pkgver}/dkms.conf"
  install -Dm644 kernel-module/Makefile "${pkgdir}/usr/src/rtpengine-${pkgver}/Makefile"
  install -Dm644 kernel-module/*.{inc,c,h} "${pkgdir}/usr/src/rtpengine-${pkgver}"
  # Install patched gen-rtpengine-kmod-flags script
  install -Dm755 kernel-module/gen-rtpengine-kmod-flags "${pkgdir}/usr/src/rtpengine-${pkgver}/gen-rtpengine-kmod-flags"

  # Install modules-load configuration for automatic loading at boot
  install -Dm644 kernel-module/xt_RTPENGINE.modules.load.d \
    "${pkgdir}/etc/modules-load.d/${pkgname}.conf"
}

# vim: set ts=2 sw=2 et:
