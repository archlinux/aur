# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=rtpengine-kernel-dkms
pkgver=12.4.1.5
pkgrel=1
pkgdesc='Kernel module for rtpengine media proxy'
url="https://github.com/sipwise/rtpengine"
license=('GPL-3.0-or-later')
arch=('x86_64')
depends=('dkms')
optdepends=('linux-headers: Build the module for Arch kernel'
	'linux-lts-headers: Build the module for LTS Arch kernel')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sipwise/rtpengine/archive/refs/tags/mr${pkgver}.tar.gz")
sha256sums=('68de456412502e1ebb08bcceb49073e89732cf971faf91fbeb2b4a4a9d86318f')

prepare() {
	cd rtpengine-mr${pkgver}
	# Set version
	sed -e "s|#MODULE_VERSION#|$pkgver|" -e "s|ngcp-||" debian/ngcp-rtpengine-kernel-dkms.dkms >dkms.conf
	# Insert patches below this line
}

package() {
	cd rtpengine-mr${pkgver}
	install -Dm644 -t "${pkgdir}/usr/src/rtpengine-${pkgver}" dkms.conf kernel-module/{Makefile,*.{inc,c,h}}
	# Automatic module loading during boot
	install -Dm644 kernel-module/xt_RTPENGINE.modules.load.d "${pkgdir}/etc/modules-load.d/${pkgname}.conf"
}
