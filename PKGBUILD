# Maintainer: MithicSpirit <rpc01234 at gmail dot com>

_pkgname=appflowy
pkgname=$_pkgname-git
pkgver=latest
pkgrel=2
pkgdesc='An open-source alternative to Notion.'
arch=(x86_64)
url='https://www.appflowy.io/'
license=('AGPL3')
depends=(gtk3 sqlite)
makedepends=(git clang cmake ninja unzip rust cargo cargo-make dart)
provides=($_pkgname)
conflicts=($_pkgname $_pkgname-bin)
replaces=()
backup=()
options=()
install=
source=("$_pkgname::git+https://github.com/AppFlowy-IO/AppFlowy.git"
        'flutter::git+https://github.com/flutter/flutter.git#tag=2.10.5')
sha256sums=('SKIP' 'SKIP')

_setpath() {
	PATH="$PATH:$srcdir/flutter/bin:$HOME/.pub-cache/bin:$HOME/.cargo/bin"
}

pkgver() {
	_setpath
	cd "$srcdir/$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	_setpath
	cd "$srcdir/$_pkgname/frontend"
	sed -i "/rustup/d" scripts/makefile/env.toml

	flutter config --enable-linux-desktop
}

build() {
	_setpath
	cd "$srcdir/$_pkgname/frontend"
	cargo install duckscript_cli
	cargo make flowy_dev
	# cargo make -p production-linux-x86 flowy-sdk-release
	cargo make -p production-linux-x86 appflowy-linux
}

package() {
	_setpath
	cd "$srcdir/$_pkgname"/frontend/app_flowy/product/*/linux/Release/AppFlowy
	install -dm755 "$pkgdir"{/usr/bin,/usr/share/applications,"/opt/$pkgname"}

	cp -a * "$pkgdir/opt/$pkgname/"
	rm "$pkgdir/opt/$pkgname/appflowy.desktop.temp"
	ln -s "/opt/$pkgname/app_flowy" "$pkgdir/usr/bin/"

	_desktop_file="$pkgdir/usr/share/applications/AppFlowy.desktop"
	install -m644 appflowy.desktop.temp "$_desktop_file"
	sed -i '/Exec=/s|\[CHANGE_THIS\]/AppFlowy|/usr/bin|' "$_desktop_file"
	sed -i "/Icon=/s|\[CHANGE_THIS\]/AppFlowy|/opt/$pkgname|" "$_desktop_file"
}
