# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

gitauthor=nol00p
gitname=Shoin
appname=${gitname,,}
pkgname=${appname}
pkgdesc="A no-clutter terminal Markdown editor with modal editing"

pkgver=0.2.5
pkgrel=1
gitver=v${pkgver}

arch=('x86_64')
license=('Apache-2.0')
url="https://github.com/${gitauthor}/${gitname}"

provides=("${appname}")

makedepends=('cargo')
depends=('glibc' 'libgcc')

options=('!lto' '!strip')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/${gitver}.tar.gz")
sha256sums=('86acfd2da14b2ed3bc9dd6da12e6071971ea4e583ef16f69f9c7da2d446e5533')

prepare() {
	cd "${gitname}-${gitver//v/}" || exit

	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd "${gitname}-${gitver//v/}" || exit

	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

check() {
	cd "${gitname}-${gitver//v/}" || exit

	export CARGO_TARGET_DIR=target
	cargo test --frozen --release
}

package() {
	cd "${gitname}-${gitver//v/}" || exit

	install -Dm755 target/release/${appname} -t "${pkgdir}/usr/bin/"

	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${gitname}/"

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${gitname}/"
}
