# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=FrogSnot
_gitname=Concryptor
_appname=${_gitname,,}
pkgname=${_appname}
pkgdesc="A gigabyte-per-second, multi-threaded file encryption engine"

pkgver=1.0.5
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('AGPL-3.0-or-later')

provides=("${_appname}")
conflicts=("${_appname}"{-bin,-git})

makedepends=('rust' 'cargo')
depends=('glibc' 'libgcc')

options=(!strip)

source=("${_appname}-${pkgver}.tgz::${_ghurl}/archive/${_gitversion}.tar.gz")
sha256sums=('9e13f992d585abce8e8910f9c6e358e6ae2ec5bff6c1213acf0a9f96d074053e')


prepare() {
	cd ${srcdir}/${_gitname}-${pkgver} || exit 1

	msg2 "Fetching Data:"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd ${srcdir}/${_gitname}-${pkgver} || exit 1

	msg2 "Compiling:"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --frozen
}

check() {
	cd ${srcdir}/${_gitname}-${pkgver} || exit 1

	msg2 "Full Test Suite:"
	cargo test

	# msg2 "Run benchmarks (HTML reports in target/criterion/):"
	# cargo bench
}

package() {
	cd ${srcdir}/${_gitname}-${pkgver} || exit 1

	msg2 "Packaging:"

	install -Dm755 "target/release/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
