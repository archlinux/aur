# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname=sysbox-ce-bin
pkgver=0.7.1
pkgrel=1
epoch=2
pkgdesc="Container runtime with VM-like isolation (run Systemd, Docker, K8s in containers)"
url="https://github.com/nestybox/sysbox"
arch=('x86_64' 'aarch64')
license=('Apache-2.0')
source_x86_64=("https://github.com/nestybox/sysbox/releases/download/v${pkgver}/sysbox-ce_${pkgver}.linux_amd64.deb")
source_aarch64=("https://github.com/nestybox/sysbox/releases/download/v${pkgver}/sysbox-ce_${pkgver}.linux_arm64.deb")
sha256sums_x86_64=('9d6d5484f980d0a17f86c492c1262015c2afb66280bdb97215b79fde6a0261c5')
sha256sums_aarch64=('04ca894ae0b53f0fa54eaacc173ce40363c9a95ea5450f773716a84ef650a69b')
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
