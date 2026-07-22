# Maintainer: willker <wz.willker@gmail.com>

pkgname=axolotl-launcher
pkgver=1.3.9
pkgrel=2
pkgdesc='A cross-platform Minecraft launcher'
arch=('x86_64' 'aarch64')
url='https://github.com/Mystic-Stars/Axolotl'
license=('GPL-3.0-only')
depends=(
	'libayatana-appindicator'
	'shared-mime-info'
	'webkit2gtk-4.1'
	'xdg-utils'
)
makedepends=('jdk17-openjdk' 'pnpm' 'cargo' 'librsvg' 'patchelf' 'clang')
source=(
	"$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
	'axolotl-launcher.desktop'
	'red.ghs.axolotl.xml'
)
sha256sums=('71459f6b8c3fd3f358adc262390a0ae8a36a1909e782c136ceaf2198529d53d2'
            '0e5e26336cadd2957745befaa5bfb982e85fa39a49aa3c9ae00608afc326011a'
            'a3c7ac4b8489dff5a8e558780765648dccc99c8a65b13e6dd11777de8352da7f')
options=('!strip')

prepare() {
	cd Axolotl-$pkgver
	export RUSTUP_TOOLCHAIN=stable
	pnpm install --frozen-lockfile
	cargo fetch --locked --target host-tuple
}

build() {
	cd "Axolotl-$pkgver"
	export CC=clang
	export CXX=clang++
	export ZSTD_SYS_USE_PKG_CONFIG=1
	export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	pnpm --dir apps/app tauri build --no-bundle
}

package() {
	install -Dm644 "axolotl-launcher.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "red.ghs.axolotl.xml" "$pkgdir/usr/share/mime/packages/red.ghs.axolotl.xml"

	cd "Axolotl-$pkgver"
	install -Dm755 "apps/app/target/release/Axolotl Launcher" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "apps/app/icons/32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/red.ghs.axolotl.png"
	install -Dm644 "apps/app/icons/64x64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/red.ghs.axolotl.png"
	install -Dm644 "apps/app/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/red.ghs.axolotl.png"
	install -Dm644 "COPYING.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
