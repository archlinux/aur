# Maintainer: OmegaRogue <omegarogue@omegavoid.codes>
pkgname=opendeck
pkgver=v2.0.0_beta.8
pkgrel=1
pkgdesc="OpenDeck is a desktop application that provides Stream Deck-like functionality, implementing the Elgato Stream Deck SDK for cross-compatibility."
arch=('x86_64')
url="https://github.com/ninjadev64/OpenDeck"
license=('BSD-3-Clause')
makedepends=(git npm cargo-tauri dpkg hidapi webkit2gtk)
provides=("${pkgname}")
conflicts=("${pkgname}")
options=('!lto')
source=(
	"${pkgname%-git}::git+https://github.com/ninjadev64/OpenDeck#tag=v2.0.0-beta.7"
	"50-elgato.rules"
)

sha256sums=('49eb9c271cbc761f4d9050bc8ab409f55fcef92a4bdf788914af4306f05cec90'
            '9e15b85f84cbe38444b47439670877f77f3a5b3908687b5169731eef730e258e')

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
