# Maintainer: yobson <contact@yobson.xyz>
pkgname=gale-git
pkgdesc='A lightweight mod manager for Thunderstore'
pkgver=1.9.1.r835.07568df
pkgrel=1
arch=('x86_64')
url='https://github.com/Kesomannen/gale'
license=('GPL-3.0-or-later')
makedepends=('git' 'base-devel' 'cargo' 'cargo-tauri' 'pnpm' 'lld' 'clang')
depends=('webkit2gtk-4.1' 'cairo' 'desktop-file-utils' 'xdg-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'libsoup3' 'openssl' 'pango' 'sqlite' 'hicolor-icon-theme')
source=('git+https://github.com/Kesomannen/gale.git' 'Gale.desktop')
sha256sums=('SKIP' '014a3c5a5a773fc0846e0c08df29e327dee4f05c3a9977dbf853fb7a2910d4f4')
conflicts=('gale-bin')

pkgver() {
	cd "$srcdir/gale"

	local tag rev commit
	tag=$(git describe --tags --abbrev=0)
	rev=$(git rev-list --count HEAD)
	commit=$(git rev-parse --short HEAD)

	echo "${tag}.r${rev}.${commit}"
}

prepare() {
	cd "$srcdir/gale"

	if command -v rustup >/dev/null 2>&1; then
		echo "Detected rustup, setting stable as default toolchain..."
		rustup default stable
	fi
}

build() {
	cd "$srcdir/gale"

	export RUSTFLAGS="${RUSTFLAGS} -C link-arg=-fuse-ld=lld"
	export CC=clang
	export CXX=clang++

	pnpm install
	cargo tauri build --no-bundle
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
