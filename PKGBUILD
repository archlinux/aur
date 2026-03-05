# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname=sysbox-ce-bin
pkgver=0.6.7
pkgrel=2
pkgdesc="Container runtime with VM-like isolation (run Systemd, Docker, K8s in containers)"
url="https://github.com/nestybox/sysbox"
arch=('x86_64' 'aarch64')
license=('Apache-2.0')
source_x86_64=("https://github.com/nestybox/sysbox/releases/download/v${pkgver}/sysbox-ce_${pkgver}.linux_amd64.deb")
source_aarch64=("https://github.com/nestybox/sysbox/releases/download/v${pkgver}/sysbox-ce_${pkgver}.linux_arm64.deb")
sha256sums_x86_64=('b7ac389e5a19592cadf16e0ca30e40919516128f6e1b7f99e1cb4ff64554172e')
sha256sums_aarch64=('16d80123ba53058cf90f5a68686e297621ea97942602682e34b3352783908f91')
install=install.sh
depends=('rsync' 'fuse2')
optdepends=('shiftfs: For uid-mapping on very old kernels without idmapped-mounts')
provides=('sysbox-ce')
conflicts=('sysbox-ce')

prepare() {
	mkdir -p data
	tar xf data.tar.xz -C data
}

package() {
	cd "data"
	(cd lib/sysctl.d && find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/lib/sysctl.d/{}" \; )
	(cd lib/systemd && find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/lib/systemd/{}" \; )
	(cd usr/bin && find . -type f -exec install -Dm755 "{}" "${pkgdir}/usr/bin/{}" \; )
	(cd usr/share/doc && find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/{}" \; )
}
