# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=rtpengine-kernel-dkms
pkgver=12.5.1.3
pkgrel=1
pkgdesc='Kernel module for rtpengine media proxy'
url="https://github.com/sipwise/rtpengine"
license=('GPL-3.0-or-later')
arch=('x86_64')
depends=('dkms')
optdepends=('linux-headers: build modules against the Arch kernel'
            'linux-lts-headers: build modules against the LTS kernel'
            'linux-zen-headers: build modules against the ZEN kernel'
            'linux-hardened-headers: build modules against the HARDENED kernel')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sipwise/rtpengine/archive/refs/tags/mr${pkgver}.tar.gz")
sha256sums=('77e36ca170c540b1d38e6b1041f1f15d9ef2613fcbe5d8417cb09332e48b9e35')

prepare() {
  cd rtpengine-mr${pkgver}

  # Set version
  sed -e "s|#MODULE_VERSION#|$pkgver|" -e "s|ngcp-||" debian/ngcp-rtpengine-kernel-dkms.dkms >dkms.conf
  # Insert patches below this line
}

package() {
  cd rtpengine-mr${pkgver}

  install -Dm644 -t "${pkgdir}/usr/src/rtpengine-${pkgver}" dkms.conf kernel-module/{Makefile,*{.inc,.c,.h}}
  # Automatic module loading during boot
  install -Dm644 kernel-module/xt_RTPENGINE.modules.load.d "${pkgdir}/etc/modules-load.d/${pkgname}.conf"
}

# vim: ts=2 sw=2 et:
