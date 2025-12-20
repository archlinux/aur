# Maintainer: Stormix <support@deadlockmods.com>
pkgname=deadlock-modmanager-git
_pkgname=${pkgname%-git}
pkgdesc='A mod manager for the Valve game Deadlock (latest git build)'
pkgver=0.12.0.r7.g609c499
pkgrel=1
arch=('x86_64')
url="https://github.com/deadlock-mod-manager/deadlock-mod-manager"
license=('GPL-3.0-or-later')
makedepends=('git' 'cargo' 'cargo-tauri' 'pnpm' 'lld' 'gcc')
depends=('webkit2gtk-4.1' 'cairo' 'desktop-file-utils' 'xdg-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'libsoup3' 'pango' 'openssl' 'bzip2' 'hicolor-icon-theme' 'mesa-utils')
source=("$_pkgname::git+$url.git"
	'deadlock-modmanager.desktop'
	'nvidia-webkit-wrapper.sh')
sha256sums=('SKIP'
            '2fdd1840a620ea0a22fec3c3dab5acea4e64f03a3518fe48e96b122dac5d6e01'
            'db8eb404d073aca83fb6a587989c67e062f3c29d03e966fbdc567fdc133440e9')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!lto')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --tags --long --abbrev=7 --match 'v[0-9]*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	export RUSTUP_TOOLCHAIN=stable

	cd "$srcdir/$_pkgname/apps/desktop"
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

	cd "$srcdir/$_pkgname/apps/desktop"
	cargo tauri build --no-bundle -- --frozen
}

package() {
	install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	install -Dm755 "$srcdir/nvidia-webkit-wrapper.sh" "$pkgdir/usr/bin/$_pkgname"

	cd "$srcdir/$_pkgname/apps/desktop/src-tauri"

	install -Dm755 "target/release/deadlock-mod-manager" "$pkgdir/usr/bin/$_pkgname-bin"
	install -Dm644 "icons/32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/$_pkgname.png"
	install -Dm644 "icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$_pkgname.png"
	install -Dm644 "icons/128x128@2x.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"
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
