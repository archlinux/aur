# Maintainer: OmegaRogue <omegarogue@omegavoid.codes>
pkgname=opendeck-git
pkgver=r99.4bbd9f3
pkgrel=1
pkgdesc="A cross-platform desktop application that provides functionality for stream controller devices."
arch=('x86_64')
url="https://github.com/ninjadev64/OpenDeck"
license=('MIT')
makedepends=(git deno tauri-cli dpkg hidapi webkit2gtk libappindicator-gtk3)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!lto')
source=(
	"${pkgname%-git}::git+https://github.com/ninjadev64/OpenDeck"
)

sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
	cd "$srcdir/${pkgname%-git}/src-tauri"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
	cd ..
	export DENO_DIR="${srcdir}/deno-cache"
	deno cache npm:vite
}

build() {
	cd "$srcdir/${pkgname%-git}/src-tauri"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export DENO_DIR="${srcdir}/deno-cache"
	cargo tauri build --ci -b deb -- --frozen
}

package() {
	cd "$srcdir/${pkgname%-git}"
	dpkg-deb -R $(find . -type f -name "*.deb") $pkgdir
	rm -rf $pkgdir/DEBIAN
}
