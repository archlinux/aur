# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=SickleFire
_gitname=m-vis
_appname=${_gitname//-/}
pkgname=${_appname}
pkgdesc="Lightweight cross-platform memory visualizer tool"

pkgver=0.3.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
depends=('glibc' 'libgcc')
makedepends=('rust' 'cargo')

source_x86_64=("${pkgname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/archive/${_gitversion}.tar.gz")
sha256sums_x86_64=('1e976459355285bb73a19174ad8b9c6ad00e48f16c486742d3d2edfd5d0ab38a')

prepare() {
	cd "${srcdir}/${_gitname}-${_gitversion//v/}" || exit

	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd "${srcdir}/${_gitname}-${_gitversion//v/}" || exit

	RUSTFLAGS="--remap-path-prefix=$(pwd)=/build/" cargo build --release --locked
}

package() {
	cd "${srcdir}/${_gitname}-${_gitversion//v/}" || exit

	install -Dm755 "target/release/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
