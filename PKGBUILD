# Maintainer: yobson <contact@yobson.xyz>
pkgname=gale-git
pkgdesc='A lightweight mod manager for Thunderstore'
pkgver=1.10.0.r12.g1b831e6
pkgrel=2
arch=('x86_64')
url='https://github.com/Kesomannen/gale'
license=('GPL-3.0-or-later')
makedepends=('git' 'cargo' 'cargo-tauri' 'pnpm' 'lld' 'clang')
depends=('webkit2gtk-4.1' 'cairo' 'desktop-file-utils' 'xdg-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'libsoup3' 'openssl' 'pango' 'sqlite' 'hicolor-icon-theme')
source=('git+https://github.com/Kesomannen/gale.git' 'Gale.desktop')
sha256sums=('SKIP'
            '169161f9ccc27cd7c0c6ce1ce75d63c15169f91706bd8b8b52d0fe4499ce4f70')
conflicts=('gale-bin')
provides=('gale')
options=('!lto')

pkgver() {
	cd "$srcdir/gale"
	git describe --tags --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	export RUSTUP_TOOLCHAIN=stable

	cd "$srcdir/gale"
	pnpm install

	cd "src-tauri"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	export RUSTFLAGS="${RUSTFLAGS} -C link-arg=-fuse-ld=lld"
	export CC=clang
	export CXX=clang++
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target

	cd "$srcdir/gale"
	cargo tauri build --no-bundle -- --frozen
}

package() {
	install -Dm644 "$srcdir/Gale.desktop" "$pkgdir/usr/share/applications/Gale.desktop"

	cd "$srcdir/gale"

	install -Dm755 "src-tauri/target/release/gale" "$pkgdir/usr/bin/gale"
	install -Dm644 "src-tauri/icons/32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/gale.png"
	install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/gale.png"
	install -Dm644 "src-tauri/icons/128x128@2x.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/gale.png"
}

post_install() {
	gtk-update-icon-cache -q -t -f /usr/share/icons/hicolor
	update-desktop-database -q
}

post_upgrade() {
	post_install
}

post_remove() {
	post_install
}
