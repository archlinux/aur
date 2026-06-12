# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Drackrath
_gitname=Aurelia
_appname=${_gitname,,}
pkgname=${_appname}
pkgdesc="A fast, lightweight, command-line Steam launcher and library manager written in Rust"

pkgver=0.1.5
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
makedepends=('rust' 'cargo')
depends=('glibc' 'libgcc' 'xz' 'bzip2' 'openssl')

options=(!strip)

source=("${pkgname}-${pkgver}.tgz::${url}/archive/refs/tags/${_gitversion}.tar.gz")
sha256sums=('c0e8ca203d034625d6676989220d94eabf4927685ad1d26d3edd4f5e0785988d')


prepare() {
	cd ${srcdir}/${_gitname}-${pkgver} || exit 1

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd ${srcdir}/${_gitname}-${pkgver} || exit 1

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --frozen
}

package() {
	cd ${srcdir}/${_gitname}-${pkgver} || exit 1

	install -Dm755 "target/release/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "USAGE.md" "${pkgdir}/usr/share/doc/${pkgname}/USAGE.md"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
