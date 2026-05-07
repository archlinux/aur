# Maintainer: CrypticCreator <crypticcreator@noreply.codeberg.org>
pkgname=selene-player-git
_pkgname=selene-player
pkgver=v0.8.0.r1.gfe987f5
pkgrel=2
pkgdesc="A feature complete music player and metadata editor"

url="https://codeberg.org/selene-player/selene"
_git="https://codeberg.org/selene-player/selene.git"

license=("MIT")
arch=(x86_64)

makedepends=('git' 'cargo')
depends=()

source=("${_pkgname}::git+${_git}")

sha256sums=('SKIP')

_bin="selene"

pkgver() {
	cd "${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${_pkgname}"
	export CARGO_TARGET_DIR=target
	cargo clean
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "${_pkgname}"

	export CARGO_TARGET_DIR=target

	cargo build --release --locked --offline -p selene-cli
}

package() {
	cd "${_pkgname}"
	install -Dm 0755 "target/release/${_bin}" "${pkgdir}/usr/bin/${_bin}"
	install -Dm 0644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm 0644 "assets/selene.service" "${pkgdir}/usr/lib/systemd/user/selene.service"
}
