# Maintainer: OmegaRogue <omegarogue@omegavoid.codes>
pkgname=opendeck
pkgver=v2.0.0_beta.10
pkgrel=1
pkgdesc="OpenDeck is a desktop application that provides Stream Deck-like functionality, implementing the Elgato Stream Deck SDK for cross-compatibility."
arch=('x86_64')
url="https://github.com/ninjadev64/OpenDeck"
license=('BSD-3-Clause')
makedepends=(git npm cargo-tauri dpkg hidapi webkit2gtk libappindicator-gtk3)
provides=("${pkgname}")
conflicts=("${pkgname}")
options=('!lto')
source=(
	"${pkgname}::git+https://github.com/ninjadev64/OpenDeck#tag=${pkgver//_/-}"
)

sha256sums=('77a6ec3286e5e67a67dcdfbf160fba64615f911b144c9bfd760064cf1f215a98')

prepare() {
	cd "$srcdir/${pkgname}/src-tauri"
	export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
	cd ..
	npm install --cache "${srcdir}/npm-cache"
}

build() {
	cd "$srcdir/${pkgname}/src-tauri"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo tauri build --ci -b deb -- --frozen
}

package() {
	install -Dm644 -t "$pkgdir/etc/udev/rules.d" 50-elgato.rules
	cd "$srcdir/${pkgname}"
	dpkg-deb -R $(find . -type f -name "*.deb") $pkgdir
	rm -rf $pkgdir/DEBIAN
}
