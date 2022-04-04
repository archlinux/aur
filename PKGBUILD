#Maintainer: 1994 <1994intime@protonmail.com>

pkgname=pinephone-kbpwrd
pkgver=0.1.7rbdd56e3
pkgrel=1
pkgdesc="PinePhone (Pro) Keyboard Case Power Manager"
arch=('aarch64')
url='https://github.com/estokes/pinephone-kbpwrd'
license=('MIT')
makedepends=('rust')
source=("${pkgname}::git+https://github.com/estokes/pinephone-kbpwrd.git"
	"kbpwrd.service")
sha256sums=('SKIP'
            '8b035cab39d1fae2c88a32bbc5d1dc085321a00859563e47066a4344ac568da4')

prepare() {
	if ! grep -q pinephone /proc/device-tree/compatible
	then
		echo WARNING! This application is intended to run only on a pinephone device
	fi
}

pkgver() {
	cd "${pkgname}"
	echo $(cat Cargo.toml | grep version | head -1 | awk '{print $3}' | sed 's/[",]//g')r$(git rev-parse --short HEAD)
}

build() {
	cd "${pkgname}"
	cargo build --release
}

package() {
	cd "${pkgname}"
	install -Dm755 target/release/kbpwrd "${pkgdir}/usr/bin/kbpwrd"
	install -Dm644 "${srcdir}/kbpwrd.service" "${pkgdir}/usr/lib/systemd/system/kbpwrd.service"
}

