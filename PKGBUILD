# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Yesh-02
_gitname=psleep
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="A tiny, fast CLI utility written in Rust that works just like sleep but shows a live progress bar"

pkgver=0.2.4
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

makedepends=('rust' 'pkgconf' 'openssl' 'libgit2')
depends=('glibc' 'libgcc')

provides=("${_appname}")

options=(!strip)

source=("${_appname}-${pkgver}.tgz::${_ghurl}/archive/${_gitversion}.tar.gz")
sha256sums=('e65f475a6824ce860c78d71095cf8e9bf122e69917868625b57ca4783c787904')

prepare() {
	cd "${pkgname}-${pkgver}/" || exit

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd "${pkgname}-${pkgver}/" || exit

	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd "${pkgname}-${pkgver}/" || exit

	install -Dm755 "target/release/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
