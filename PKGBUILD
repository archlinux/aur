# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appauthor=EatSleepCode-Repeat
_appname=bnb
_execname=${_appname,,}

pkgname=${_execname}-shell
pkgver=0.5.0
pkgrel=1
pkgdesc="A fast, cross-platform terminal shell built in Rust with Powerlevel10k aesthetics, fuzzy search, and safety guardrails"

arch=('x86_64' 'aarch64')
license=('MIT')

url="https://github.com/${_appauthor}/${_appname}"
_urlraw="https://raw.githubusercontent.com/${_appauthor}/${_appname}/v${pkgver//_/-}"

provides=("${_execname}")

makedepends=('cargo' 'yq')
depends=('glibc' 'libgcc')

install="${_execname}.install"

options=('!lto' '!strip')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('b1c42d03e9711539bd293d931d017ebc1e9cda0f905520ce37c63dd275bc80c9')


prepare() {
	cd "${_appname}-${pkgver}" || exit

	tomlq -i -t --arg new_ver "${pkgver}" '.package.version = $new_ver' Cargo.toml
	tomlq -i -t --arg new_ver "${pkgver}" '(.package[] | select(.name == "bnb-shell")).version = $new_ver' Cargo.lock

	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd "${_appname}-${pkgver}" || exit

	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

check() {
	cd "${_appname}-${pkgver}" || exit

	export CARGO_TARGET_DIR=target
	cargo test --frozen --release
}

package() {
	cd "${_appname}-${pkgver}" || exit

	install -Dm755 "target/release/${_execname}" "${pkgdir}/usr/bin/${_execname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
