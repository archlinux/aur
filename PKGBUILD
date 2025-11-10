# Maintainer: yobson <contact@yobson.xyz>
pkgname=deadlock-modmanager
pkgdesc='A mod manager for the Valve game Deadlock'
_pkgver=0.10.1
pkgver=${_pkgver//-/_}
pkgrel=1
arch=('x86_64')
url='https://github.com/deadlock-mod-manager/deadlock-mod-manager'
license=('GPL-3.0-or-later')
makedepends=('git' 'cargo' 'cargo-tauri' 'pnpm' 'lld' 'gcc')
depends=('webkit2gtk-4.1' 'cairo' 'desktop-file-utils' 'xdg-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'libsoup3' 'pango' 'openssl' 'bzip2' 'hicolor-icon-theme' 'mesa-utils')
source=("$pkgname::git+$url.git#tag=v$_pkgver"
	'deadlock-modmanager.desktop'
	'nvidia-webkit-wrapper.sh')
sha256sums=('9a440b997e76f5c483c21a31f998a01bb8e8de50c318f7416e74eafe7b4887c7'
            '2fdd1840a620ea0a22fec3c3dab5acea4e64f03a3518fe48e96b122dac5d6e01'
            'db8eb404d073aca83fb6a587989c67e062f3c29d03e966fbdc567fdc133440e9')
provides=("$pkgname")
conflicts=("$pkgname-git")
options=('!lto')

prepare() {
	export RUSTUP_TOOLCHAIN=stable

	cd "$srcdir/$pkgname/apps/desktop"
	pnpm install

	cd "src-tauri"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	export RUSTFLAGS="${RUSTFLAGS} -C link-arg=-fuse-ld=lld"
	export CC=gcc
	export CXX=g++
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export VITE_API_URL="https://api.deadlockmods.app"

	cd "$srcdir/$pkgname/apps/desktop"
	cargo tauri build --no-bundle -- --frozen
}

package() {
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm755 "$srcdir/nvidia-webkit-wrapper.sh" "$pkgdir/usr/bin/$pkgname"

	cd "$srcdir/$pkgname/apps/desktop/src-tauri"

	install -Dm755 "target/release/deadlock-mod-manager" "$pkgdir/usr/bin/$pkgname-bin"
	install -Dm644 "icons/32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
	install -Dm644 "icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
	install -Dm644 "icons/128x128@2x.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
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
