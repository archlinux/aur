# Maintainer: yobson <contact@yobson.xyz>
pkgname=deadlock-modmanager-git
pkgdesc='A mod manager for the Valve game Deadlock'
pkgver=0.4.0.r3.gcf375c7
pkgrel=1
arch=('x86_64')
url='https://github.com/Stormix/deadlock-modmanager'
license=('GPL-3.0-or-later')
makedepends=('git' 'cargo' 'cargo-tauri' 'pnpm' 'lld' 'clang')
depends=('webkit2gtk-4.1' 'cairo' 'gdk-pixbuf2' 'glib2' 'gtk3' 'libsoup3' 'pango' 'openssl' 'bzip2' 'hicolor-icon-theme')
source=('git+https://github.com/Stormix/deadlock-modmanager.git' 'deadlock-modmanager.desktop')
sha256sums=('SKIP' '0e5b83e284a6a02291a6c25c56c9d7568f95f3274c6a35b8ddde4783ff3edaf4')
provides=('deadlock-modmanager')

pkgver() {
	cd "$srcdir/deadlock-modmanager"
	git describe --tags --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	export RUSTUP_TOOLCHAIN=stable

	cd "$srcdir/deadlock-modmanager/apps/desktop"
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
	export VITE_API_URL="https://api.deadlockmods.app"

	cd "$srcdir/deadlock-modmanager/apps/desktop"
	cargo tauri build --no-bundle -- --frozen
}

package() {
	install -Dm644 "$srcdir/deadlock-modmanager.desktop" "$pkgdir/usr/share/applications/deadlock-modmanager.desktop"

	cd "$srcdir/deadlock-modmanager/apps/desktop"

	install -Dm755 "src-tauri/target/release/desktop" "$pkgdir/usr/bin/deadlock-modmanager"
	install -Dm644 "src-tauri/icons/32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/deadlock-modmanager.png"
	install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/deadlock-modmanager.png"
	install -Dm644 "src-tauri/icons/128x128@2x.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/deadlock-modmanager.png"
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
