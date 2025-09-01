# Maintainer: zhiayang <zhiayang@nowhere>

pkgname=wgman
pkgver=0.6.3
pkgrel=2
pkgdesc='Simple WireGuard wrapper-manager-thing'
url='https://github.com/zhiayang/wgman'
depends=('wireguard-tools')
if [ $(uname) = "Linux" ]; then
	depends+=('libcap')
fi

makedepends=()
checkdepends=()
license=(Apache)
arch=('any')
_commit='4aa43fd2bd54c2efdbf2716c8a2a1c18dcdde3c9'
source=("git+https://github.com/zhiayang/wgman.git#commit=${_commit}")
sha256sums=('SKIP')

_pacman_root=${pacman_root:-}

build() {
	cd wgman
	make build PREFIX=${_pacman_root}
}

package() {
	cd wgman
	install -Dm755 build/wgman "$pkgdir"/${_pacman_root}/usr/bin/wgman

	mkdir -p "$pkgdir"/${_pacman_root}/etc/wgman/

	if [ $(uname) = "Linux" ]; then
		install -Dm755 wgman.target "$pkgdir"/${_pacman_root}/usr/lib/systemd/system/wgman.target
		install -Dm755 wgman@.service "$pkgdir"/${_pacman_root}/usr/lib/systemd/system/wgman@.service
	fi
}
