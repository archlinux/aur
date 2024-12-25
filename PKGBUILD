# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=rtpengine-kernel-dkms
pkgver=13.1.1.1
pkgrel=1
pkgdesc="Kernel module for rtpengine media proxy"
url="https://github.com/sipwise/rtpengine"
license=('GPL-3.0-or-later')
arch=('x86_64')
depends=('dkms')
optdepends=('linux: The Linux kernel'
            'linux-headers: Header files and scripts for building modules for Linux kernel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/mr${pkgver}.tar.gz")
sha256sums=('4d6297851508a5eb6681c76c13f0c20f9b2ad28476541080bc0b55b2049fe3b6')

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
