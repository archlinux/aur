#Maintainer: 1994 <1994intime@protonmail.com>

pkgname=pinephone-kbpwrd
pkgver=0.1.6r9d9bcf0
pkgrel=1
pkgdesc="PinePhone (Pro) Keyboard Case Power Manager"
arch=('aarch64')
url='https://github.com/estokes/pinephone-kbpwrd'
license=('MIT')
makedepends=('rust')
source=("${pkgname}::git+https://github.com/estokes/pinephone-kbpwrd.git"
	"kbpwrd.service")
sha256sums=('SKIP'
            '13ddfd3692f7920271655d56554cc8793f94e40fd55ada7e8d01e56f261f795e')

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

