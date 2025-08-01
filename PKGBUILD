# Maintainer: Ruud van Asseldonk <aur@veniogames.com>
pkgname=rcl
pkgver=0.9.0
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
sha256sums=('8e04b49f36525098e5e616d02d1e53d49360bd535f47c86c84b975ba9771ecf3')
# The key has been revoked, but the v0.9.0 tag is signed with it nonetheless.
# Build with --skippgpcheck for now.
# validpgpkeys=(28EEB492BE15FF2DC93BCE865F231E540599697D) # Ruud van Asseldonk <dev@veniogames.com>

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
