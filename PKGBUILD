# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=gnomeria
_gitname=usbtree
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="Cross-platform TUI for inspecting the USB device tree"

pkgver=0.0.7
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")

makedepends=('rust' 'pkgconf' 'openssl' 'libgit2')
depends=('glibc' 'libgcc')

options=(!strip)

source=("${_appname}-${pkgver}.tgz::${_ghurl}/archive/${_gitversion}.tar.gz")
sha256sums=('9082048d8921cda8c6af2cdfa77257dd197ee782085da6e69946e747346f0fb3')

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
