# Maintainer: CrypticCreator <crypticcreator@noreply.codeberg.org>
pkgname=selene-player-git
_pkgname=selene-player
pkgver=r164.408c0ab
pkgrel=1
pkgdesc="A feature complete music player and metadata editor"

url="https://codeberg.org/CrypticCreator/Selene"
_git="https://codeberg.org/CrypticCreator/selene.git"

license=("MIT")
arch=(x86_64)

makedepends=('git' 'cargo')
depends=('ffmpeg')

source=("${_pkgname}::git+${_git}")

sha256sums=('SKIP')

_bin="selene"

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${_pkgname}"
    # cargo clean
    export CARGO_TARGET_DIR=target
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${_pkgname}"
    export CARGO_TARGET_DIR=target
    cargo build --release --locked --offline
}

package() {
    cd "${_pkgname}"
    install -Dm 0755 "target/release/${_bin}" "${pkgdir}/usr/bin/${_bin}"
    install -Dm 0644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm 0644 "assets/selene.service" "${pkgdir}/usr/lib/systemd/user/selene.service"
}
