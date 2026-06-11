# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=tracyspacy
_gitname=fli
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="CLI tool to list directory content"

pkgver=0.1.0
pkgrel=1
_gitversion=${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

depends=('glibc')
provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("${_appname}-${pkgver}.tgz::${_ghurl}/archive/${_gitversion}.tar.gz")
sha256sums=('5da79268f42067c79bb57427bb949c6040596a927baa723918c20824e8a14879')


prepare() {
	cd ${srcdir}/${_appname}-${pkgver} || exit 1

	export RUSTUP_TOOLCHAIN=stable
	cargo update --precise "${pkgver}" --package "${_appname}"
	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd ${srcdir}/${_appname}-${pkgver} || exit 1

	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd ${srcdir}/${_appname}-${pkgver} || exit 1

	install -Dm755 "target/release/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
