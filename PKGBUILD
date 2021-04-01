# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname=sysbox-ce-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Container runtime with VM-like isolation (run Systemd, Docker, K8s in containers)"
url="https://github.com/nestybox/sysbox"
arch=('x86_64')
license=('Apache')
source=("https://github.com/nestybox/sysbox/releases/download/v${pkgver}/sysbox-ce_${pkgver}-0.debian-buster_amd64.deb")
sha256sums=('02aa4b3ab3e823d91e01c742875a4ece9d6415c9915c5f08df918725361b928e')
install=install.sh
optdepends=('shiftfs: Operation without userns-remap (stock kernel)'
            'shiftfs-dkms: Operation without userns-remap (DKMS)')

prepare() {
	mkdir -p data
	tar xf data.tar.xz -C data
	cd data

	find lib/systemd -type f -exec sed -i 's|/usr/local/sbin|/usr/bin|g' {} +
}

package() {
	cd "data"
	(cd etc/modules-load.d && find . -type f -exec install -Dm644 "{}" "${pkgdir}/etc/modules-load.d/{}" \; )
	(cd lib/sysctl.d && find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/lib/sysctl.d/{}" \; )
	(cd lib/systemd && find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/lib/systemd/{}" \; )
	(cd usr/local/sbin && find . -type f -exec install -Dm755 "{}" "${pkgdir}/usr/bin/{}" \; )
	(cd usr/share/doc && find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/{}" \; )
}
