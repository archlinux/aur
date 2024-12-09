# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=rtpengine-kernel-dkms
pkgver=13.0.1.6
pkgrel=1
pkgdesc="Kernel module for rtpengine media proxy"
url="https://github.com/sipwise/rtpengine"
license=('GPL-3.0-or-later')
arch=('x86_64')
depends=('dkms')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/mr${pkgver}.tar.gz")
sha256sums=('5c5a233e755ab5673e5ed55d88b2b4434e0f665051597f20dc89740ddf2837ec')

prepare() {
  cd "rtpengine-mr${pkgver}"

  # Create dkms.conf from template, replacing placeholders
  sed -e "s|#MODULE_VERSION#|${pkgver}|" \
      -e "s|ngcp-||" \
      debian/ngcp-rtpengine-kernel-dkms.dkms > dkms.conf

  # Apply custom patches here if necessary
  # patch -p1 < "${srcdir}/example.patch"
}

package() {
  cd "rtpengine-mr${pkgver}"

  # Install dkms.conf and kernel module sources
  install -Dm644 dkms.conf "${pkgdir}/usr/src/rtpengine-${pkgver}/dkms.conf"
  install -Dm644 kernel-module/Makefile "${pkgdir}/usr/src/rtpengine-${pkgver}/Makefile"
  install -Dm644 kernel-module/*.{inc,c,h} "${pkgdir}/usr/src/rtpengine-${pkgver}/"

  # Install modules-load configuration for automatic loading at boot
  install -Dm644 kernel-module/xt_RTPENGINE.modules.load.d \
    "${pkgdir}/etc/modules-load.d/${pkgname}.conf"
}

# vim: set ts=2 sw=2 et:
