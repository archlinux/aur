# Maintainer: OmegaRogue <omegarogue@omegavoid.codes>
pkgname=opendeck
pkgver=v2.0.0_rc.0
pkgrel=1
pkgdesc="A cross-platform desktop application that provides functionality for stream controller devices."
arch=('x86_64')
url="https://github.com/ninjadev64/OpenDeck"
license=('BSD-3-Clause')
makedepends=(git deno tauri-cli dpkg hidapi webkit2gtk libappindicator-gtk3)
provides=("${pkgname}")
conflicts=("${pkgname}")
options=('!lto')
source=(
	"${pkgname}::git+https://github.com/ninjadev64/OpenDeck#tag=${pkgver//_/-}"
)

sha256sums=('fc695c5f19de84c4036056f1074bc8384fb4e5b5a26069e3b1fc4e153ba0399e')

prepare() {
	cd "$srcdir/${pkgname}/src-tauri"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
	cd ..
	export DENO_DIR="${srcdir}/deno-cache"
	deno cache npm:vite
}

build() {
	cd "$srcdir/${pkgname}/src-tauri"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export DENO_DIR="${srcdir}/deno-cache"
	cargo tauri build --ci -b deb -- --frozen
}

package() {
	install -Dm644 -t "$pkgdir/etc/udev/rules.d" 50-elgato.rules
	cd "$srcdir/${pkgname}"
	dpkg-deb -R $(find . -type f -name "*.deb") $pkgdir
	rm -rf $pkgdir/DEBIAN
}
