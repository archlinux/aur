# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=julesklord
_gitname=mangofetch
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="Tool for fetch everythin' in internet"

pkgver=0.7.3
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0')

provides=("${_appname}")
makedepends=('rust' 'cargo')
depends=('glibc' 'libgcc' 'xz')

options=(!strip)

source=("${pkgname}-${pkgver}.tgz::${url}/archive/refs/tags/${_gitversion}.tar.gz")
sha256sums=('83c4220ccb8966c10e238317fe107f2cc2af8b3c6c8bd59c9e9d4b088b805ef1')


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

check() {
	cd ${srcdir}/${_gitname}-${pkgver} || exit 1

	# export MANGOFETCH_OFFLINE=1
	# cargo test -p mangofetch-core

	./target/release/${_appname} about
}

package() {
	cd ${srcdir}/${_gitname}-${pkgver} || exit 1

	install -Dm755 "target/release/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
