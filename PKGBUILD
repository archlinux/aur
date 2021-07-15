# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname=sysbox-ce-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Container runtime with VM-like isolation (run Systemd, Docker, K8s in containers)"
url="https://github.com/nestybox/sysbox"
arch=('x86_64')
license=('Apache')
source=("https://github.com/nestybox/sysbox/releases/download/v${pkgver}/sysbox-ce_${pkgver}-0.debian-buster_amd64.deb")
sha256sums=('1b21cb19544a8e594a49ddce35f914035445a55e55f1cd4ba398a42e08ff86aa')
install=install.sh
depends=('rsync' 'fuse2')
optdepends=('shiftfs: Operation without userns-remap')
conflicts=('sysbox-ce')

prepare() {
	mkdir -p data
	tar xf data.tar.xz -C data
}

package() {
	cd "data"
	(cd usr/lib/modules-load.d && find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/lib/modules-load.d/{}" \; )
	(cd lib/sysctl.d && find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/lib/sysctl.d/{}" \; )
	(cd lib/systemd && find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/lib/systemd/{}" \; )
	(cd usr/bin && find . -type f -exec install -Dm755 "{}" "${pkgdir}/usr/bin/{}" \; )
	(cd usr/share/doc && find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/{}" \; )
}
