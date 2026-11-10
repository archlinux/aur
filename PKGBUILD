# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=campuslivre
_gitname=matlivre
_appname=MatLivre
pkgname=${_appname,,}
pkgdesc="A fast live script editor and runtime for MATLAB code."

pkgver=0.1.7
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname,,}"{,-cli})

makedepends=('cargo')
depends=('glibc' 'libgcc' 'hicolor-icon-theme')

options=('!lto' '!strip')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('7f2a6f7a5df5d56588e3d958682022797ae364e05c98e6c4f6de8847ee2ad4ba')

prepare() {
	cd "${pkgname}-${pkgver}" || exit

	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd "${pkgname}-${pkgver}" || exit

	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

check() {
	cd "${pkgname}-${pkgver}" || exit

	export CARGO_TARGET_DIR=target
	cargo test --frozen --release
}

package() {
	cd "${pkgname}-${pkgver}" || exit

	install -Dm755 "target/release/${_appname,,}"{,-cli} -t "${pkgdir}/usr/bin/"

	install -Dm644 "tools/linux/${_appname,,}.desktop" -t "${pkgdir}/usr/share/applications/"

	install -Dm644 "crates/livre-app/assets/${_appname,,}.png" -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps/"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
