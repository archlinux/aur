# Maintainer: Orhun Parmaksız <orhun@archlinux.org>

pkgname=spicy-launcher
pkgver=0.4.1
pkgrel=2
pkgdesc="The launcher for Spicy Lobster games"
arch=('x86_64')
url="https://github.com/spicylobstergames/SpicyLauncher"
license=('MIT' 'Apache-2.0')
depends=('pkg-config' 'mesa-libgl' 'alsa-lib' 'systemd-libs' 'libudev.so' 'gtk3' 'libsoup' 'webkit2gtk')
makedepends=('cargo' 'yarn' 'npm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('cdaa4ddf2184f77daa88a93217ffb5fff8c81bf55bd92fc9f7eeee2657cbd421dbf537f13828d56c70b68a978626d74845a60451a1382d6b8be60dc8cd02faec')
options=('!lto')

prepare() {
	cd "SpicyLauncher-$pkgver"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "SpicyLauncher-$pkgver/gui"
	yarn install --ignore-engines
	yarn tauri build --target "$(rustc -vV | sed -n 's/host: //p')" --bundles none
	cd ..
	cargo build --release --frozen
}

package() {
	cd "SpicyLauncher-$pkgver"
	install -Dm 755 "target/release/$pkgname-cli" -t "$pkgdir/usr/bin"
	install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
	install -Dm 644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
