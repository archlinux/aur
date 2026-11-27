# Maintainer: Jaeho Cho <jaeho2025@gmail.com>
pkgname=cel-git
_pkgname=cel
pkgver=0.1.0.r16.g6560313
pkgrel=1
pkgdesc="Play a storyboard one keyframe per key press, and comment on it (Tauri desktop app)"
arch=('x86_64')
url="https://github.com/jaehho/cel"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'gst-libav' 'gst-plugins-good')
makedepends=('git' 'rustup')
provides=('cel')
conflicts=('cel')
options=('!lto' '!debug')
source=("git+https://github.com/jaehho/cel.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	local desc
	if desc=$(git describe --long --tags --abbrev=7 2>/dev/null); then
		printf '%s' "$desc" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
	else
		printf '0.1.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	fi
}

build() {
	cd "$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/"
	# The frontend is static and embedded at compile time: no tauri-cli or npm.
	cargo build --release --locked -p cel-tauri
}

package() {
	cd "$_pkgname"
	install -Dm755 target/release/cel "$pkgdir/usr/bin/cel"
	install -Dm644 packaging/dev.jaeho.Cel.desktop "$pkgdir/usr/share/applications/dev.jaeho.Cel.desktop"
	install -Dm644 packaging/icons/dev.jaeho.Cel.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/dev.jaeho.Cel.svg"
	install -Dm644 src-tauri/icons/128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/dev.jaeho.Cel.png"
	install -Dm644 src-tauri/icons/32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/dev.jaeho.Cel.png"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
