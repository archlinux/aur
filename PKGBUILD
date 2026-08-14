# Maintainer: staszek <staszekborkowski7@gmail.com>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor=StaszeKrk
pkgname=plaza
pkgver=1.1.3
pkgrel=1
pkgdesc="Cross-distro TUI package-manager browser (Arch: pacman + AUR)"

arch=('x86_64')
license=('GPL-3.0-or-later')
url="https://github.com/${pkgauthor}/${pkgname}"

provides=("${pkgname}")

makedepends=('cargo')
depends=('glibc' 'libgcc')
optdepends=('yay: AUR search and per-source upgrades'
            'pacman-contrib: live update counts via checkupdates')

options=('!lto')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c0861a7937584e0d9bbb7186bf580203f6b3821ad30bdfa5d5c83d58eb4e0dbe')

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

	install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 "docs/theming.md" "${pkgdir}/usr/share/doc/${pkgname}/THEMING.md"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
