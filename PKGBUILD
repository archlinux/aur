# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=campuslivre
_gitname=matlivre
_appname=MatLivre
pkgname=${_appname,,}
pkgdesc="A fast live script editor and runtime for MATLAB code."

pkgver=0.1.7
pkgrel=2
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname,,}"{,-cli})

makedepends=('cargo')
depends=('glibc' 'libgcc' 'libx11' 'libxcursor' 'libxi' 'libxkbcommon-x11' 'wayland' 'libglvnd' 'hicolor-icon-theme')
optdepends=('xdg-desktop-portal: file dialogs (requires a desktop portal backend)'
			'ttf-dejavu: text fonts for figure exports')

options=('!lto' '!strip')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz"
		"${_appname,,}.xml")
sha256sums=('7f2a6f7a5df5d56588e3d958682022797ae364e05c98e6c4f6de8847ee2ad4ba'
            'dce2978f4a1507f4307b59f2946c491e2441c33a4524e5ae6078888cf9460681')

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

	install -Dm644 "../${_appname,,}.xml" -t "${pkgdir}/usr/share/mime/packages/"

	install -Dm644 "tools/linux/${_appname,,}.desktop" -t "${pkgdir}/usr/share/applications/"

	install -Dm644 "crates/livre-app/assets/${_appname,,}.png" -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps/"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
