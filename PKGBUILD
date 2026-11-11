# Maintainer: Vniverse77
# Builds MIGA desktop from source. The name "miga" on the AUR belongs to an unrelated tool
# (a Go database migration CLI), so both the package and the command are called miga-messenger.
pkgname=miga-messenger
pkgver=0.3.0
pkgrel=1
pkgdesc="End-to-end encrypted messenger with no account"
arch=('x86_64')
url="https://miga.vniverse77.com"
license=('AGPL-3.0-or-later')
depends=('webkit2gtk-4.1' 'gtk3' 'libsoup3')
makedepends=('cargo' 'nodejs' 'npm' 'git')
source=("miga::git+https://github.com/Vniverse77/MIGA.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
	cd "$srcdir/miga/web"
	npm install --no-audit --no-fund
	npm run build:desktop
	cd "$srcdir/miga/desktop"
	npm install --no-audit --no-fund
	npx tauri build --no-bundle
}

package() {
	cd "$srcdir/miga"
	install -Dm755 desktop/src-tauri/target/release/miga-messenger "$pkgdir/usr/bin/miga-messenger"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 packaging/linux/com.vniverse77.miga.desktop "$pkgdir/usr/share/applications/com.vniverse77.miga.desktop"
	install -Dm644 desktop/src-tauri/icons/128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/com.vniverse77.miga.png"
	install -Dm644 desktop/src-tauri/icons/128x128@2x.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/com.vniverse77.miga.png"
	install -Dm644 desktop/src-tauri/icons/32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/com.vniverse77.miga.png"
}
