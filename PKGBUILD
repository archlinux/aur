# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=rtpengine-kernel-dkms
pkgver=13.1.1.4
pkgrel=1
pkgdesc="Kernel module for rtpengine media proxy"
url="https://github.com/sipwise/rtpengine"
license=('GPL-3.0-or-later')
arch=('x86_64')
depends=('dkms')
optdepends=('linux: The Linux kernel'
            'linux-headers: Header files and scripts for building modules for Linux kernel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/mr${pkgver}.tar.gz")
sha256sums=('21dd40ee7a18d5df904e821f475d55ac2eb51b993576876084784a56c9479bc2')

prepare() {
  cd "rtpengine-mr${pkgver}"

  # Create dkms.conf from template, replacing placeholders
  sed -e "s|#MODULE_VERSION#|${pkgver}|" \
    -e "s|ngcp-||" \
    debian/ngcp-rtpengine-kernel-dkms.dkms >dkms.conf

  # Apply custom patches here if necessary
  # patch -p1 < "${srcdir}/example.patch"
}

package() {
  cd "rtpengine-mr${pkgver}"

  # Install dkms.conf and kernel module sources
  install -Dm644 dkms.conf "${pkgdir}/usr/src/rtpengine-${pkgver}/dkms.conf"
  install -Dm644 kernel-module/Makefile "${pkgdir}/usr/src/rtpengine-${pkgver}/Makefile"
  install -Dm644 kernel-module/*.{inc,c,h} "${pkgdir}/usr/src/rtpengine-${pkgver}"

  # Install modules-load configuration for automatic loading at boot
  install -Dm644 kernel-module/xt_RTPENGINE.modules.load.d \
    "${pkgdir}/etc/modules-load.d/${pkgname}.conf"
}

# vim: set ts=2 sw=2 et:
