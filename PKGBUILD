# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=rquickshare-git
pkgver=0.11.5.r4.g378d8ae
pkgrel=1
pkgdesc=" Rust implementation of NearbyShare/QuickShare from Android for Linux and macOS."
arch=(x86_64)
url="https://github.com/Martichou/rquickshare"
license=('GPL-3.0-or-later')
provides=(${pkgname::-4})
conflicts=(${pkgname::-4})
depends=('glibc' 'glib2' 'gdk-pixbuf2' 'hicolor-icon-theme' 'gtk3' 'webkit2gtk-4.1' 'dbus' 'gcc-libs' 'libsoup3' 'cairo')
makedepends=('cargo' 'pnpm' 'git' 'protobuf')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname::-4}"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}

prepare() {
	cd "$srcdir/${pkgname::-4}"
	export RUSTUP_TOOLCHAIN=stable
	pushd "$srcdir/${pkgname::-4}/core_lib"
	pnpm i
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
	pushd "$srcdir/${pkgname::-4}/app/main/src-tauri"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
	pnpm i

}

build() {
	cd "$srcdir/${pkgname::-4}/core_lib"
	export RUSTUP_TOOLCHAIN=stable
	export CFLAGS="$CFLAGS -ffat-lto-objects"
	cargo build --frozen --release --all-features
	cd "$srcdir/${pkgname::-4}/app/main"
	pnpm tauri build -b deb -t "$(rustc -vV | sed -n 's/host: //p')"

}

package() {
	cd "${pkgname::-4}"
	install -Dm755 app/main/src-tauri/target/$(rustc -vV | sed -n 's/host: //p')/release/${pkgname::-4} "$pkgdir/usr/bin/${pkgname::-4}"
	pushd app/main/src-tauri/target/$(rustc -vV | sed -n 's/host: //p')/release/bundle/deb/${pkgname::-4}_*_amd64/data/
	install -Dm644 usr/share/applications/${pkgname::-4}.desktop "$pkgdir/usr/share/applications/${pkgname::-4}.desktop"
	for size in 32 128
	do
		install -Dm644 usr/share/icons/hicolor/${size}x${size}/apps/${pkgname::-4}.png "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname::-4}.png"
	done
	install -Dm644 usr/share/icons/hicolor/256x256@2/apps/${pkgname::-4}.png "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/${pkgname::-4}.png"
	sed -i 's/Name=rquickshare/Name=RQuickShare/g' "$pkgdir/usr/share/applications/${pkgname::-4}.desktop"
}
