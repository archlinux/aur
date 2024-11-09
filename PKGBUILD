# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname=sysbox-ce-bin
pkgver=0.6.5
pkgrel=1
pkgdesc="Container runtime with VM-like isolation (run Systemd, Docker, K8s in containers)"
url="https://github.com/nestybox/sysbox"
arch=('x86_64' 'aarch64')
license=('Apache')
source_x86_64=("https://downloads.nestybox.com/sysbox/releases/v${pkgver}/sysbox-ce_${pkgver}-0.linux_amd64.deb")
source_aarch64=("https://downloads.nestybox.com/sysbox/releases/v${pkgver}/sysbox-ce_${pkgver}-0.linux_arm64.deb")
sha256sums_x86_64=('f02ffb48eae99d6c884c9aa0378070cc716d028f58e87deec5ae00a41b706fe8')
sha256sums_aarch64=('d9267eb176190b96dcfa29ba4c4c685a26a4a1aca1d7f15deb31ec33ed63de15')
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
