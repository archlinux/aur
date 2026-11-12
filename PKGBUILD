# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=cvlmtg
_gitname=HUME
_appname=${_gitname,,}
pkgname=${_appname}
pkgdesc="A selection-first modal text editor for the terminal, scriptable in Scheme"

pkgver=0.20.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

makedepends=('cargo')
provides=("${_appname}")

options=('!lto' '!strip')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/${_gitversion}.tar.gz")
sha256sums=('d55abc741a79f920244e43e9860c801bb089b9b5d547e212c261c81ff7ea68b1')


prepare() {
	cd "${pkgname^^}-${pkgver}" || exit

	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd "${pkgname^^}-${pkgver}" || exit

	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

# check() {
# 	cd "${pkgname^^}-${pkgver}" || exit
#
# 	export CARGO_TARGET_DIR=target
# 	cargo test --frozen --release
# }

package() {
	cd "${pkgname^^}-${pkgver}" || exit

	install -Dm755 "target/release/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -dm755 "${pkgdir}/usr/share/${_appname}/"
	cp -rfa "runtime" "${pkgdir}/usr/share/${_appname}/"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
