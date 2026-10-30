# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

gitauthor=nol00p
gitname=Shoin
appname=${gitname,,}
pkgname=${appname}
pkgdesc="A no-clutter terminal Markdown editor with modal editing"

pkgver=0.2.1
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
sha256sums=('b18d123ba0686e1861ef8eec7223f989daa97d2d2263d51c9cac06f8d9006d64')

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
