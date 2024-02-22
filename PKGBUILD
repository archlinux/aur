# Maintainer: OmegaRogue <omegarogue@omegavoid.codes>
pkgname=opendeck-git
pkgver=r33.c318407
pkgrel=1
pkgdesc="OpenDeck is a desktop application that provides Stream Deck-like functionality, implementing the Elgato Stream Deck SDK for cross-compatibility."
arch=('x86_64')
url="https://github.com/ninjadev64/OpenDeck"
license=('BSD-3-Clause')
makedepends=(git cargo npm cargo-tauri dpkg)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
	"${pkgname%-git}::git+https://github.com/ninjadev64/OpenDeck#branch=tauri-rewrite"
	"50-elgato.rules"
)

sha256sums=('SKIP'
            '9e15b85f84cbe38444b47439670877f77f3a5b3908687b5169731eef730e258e')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
	cd "$srcdir/${pkgname%-git}/src-tauri"
	export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
	cd ..
	npm install --cache "${srcdir}/npm-cache"
}

build() {
	cd "$srcdir/${pkgname%-git}/src-tauri"
	export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
	cargo tauri build --ci -b deb -- --frozen
}

package() {
	install -Dm644 -t "$pkgdir/etc/udev/rules.d" 50-elgato.rules
	cd "$srcdir/${pkgname%-git}"
	dpkg-deb -R $(find . -type f -name "*.deb") $pkgdir
	rm -rf $pkgdir/DEBIAN
}
