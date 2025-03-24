# Maintainer: Ruud van Asseldonk <aur@veniogames.com>
pkgname=rcl
pkgver=0.8.0
pkgrel=1
epoch=
pkgdesc='A reasonable configuration language'
arch=('x86_64' 'aarch64')
url='https://rcl-lang.org/'
license=('Apache-2.0')
groups=()
depends=()
makedepends=('git' 'python' 'rustup')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/ruuda/rcl.git#tag=v${pkgver}?signed")
noextract=()
sha256sums=('b6cc8aee1be6f9ae290f713bb551873df44b5586f62350d2104e1ad770b00cbb')
validpgpkeys=(28EEB492BE15FF2DC93BCE865F231E540599697D) # Ruud van Asseldonk <dev@veniogames.com>

prepare() {
	cd "${pkgname}"
}

build() {
	cd "${pkgname}"
	# We build both the debug and release versions, because the golden tests
	# need to run against a debug binary (which has stricter limits).
	cargo build
	cargo build --release
}

check() {
	cd "${pkgname}"
	cargo test
	golden/run.py
}

package() {
	cd "${pkgname}"
	install -Dm 755 target/release/rcl "${pkgdir}/usr/bin/rcl"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
