# Maintainer: staszek <staszekborkowski7@gmail.com>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor=StaszeKrk
pkgname=plaza
pkgver=0.3.3
pkgrel=1
pkgdesc="Cross-distro TUI package-manager browser (Arch: pacman + AUR)"

arch=('x86_64')
license=('GPL-3.0-or-later')
url="https://github.com/${pkgauthor}/${pkgname}"

provides=("${pkgname}")

makedepends=('cargo')
depends=('gcc-libs')
optdepends=('yay: AUR search and per-source upgrades'
            'pacman-contrib: live update counts via checkupdates')

options=('!lto')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('8e757cf2353407182b068cc3b77db5a5ebb024b1a34212e9337c5273fef642b1')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}" || exit

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

	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

	install -Dm644 "docs/theming.md" "${pkgdir}/usr/share/doc/${pkgname}/THEMING.md"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
