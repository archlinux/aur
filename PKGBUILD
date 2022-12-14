# Maintainer: MithicSpirit <rpc01234 at gmail dot com>

_pkgname=appflowy
pkgname=$_pkgname-git
pkgver=latest
pkgrel=7
pkgdesc='An open-source alternative to Notion.'
arch=(x86_64)
url='https://www.appflowy.io/'
license=('AGPL3')
depends=('glibc>=2.32' gtk3 libkeybinder3)
makedepends=(git clang cmake ninja unzip rust cargo dart sqlite)
provides=($_pkgname)
conflicts=($_pkgname $_pkgname-bin)
replaces=()
backup=()
options=()
install=
source=(
	"$_pkgname::git+https://github.com/AppFlowy-IO/AppFlowy.git"
	'flutter::git+https://github.com/flutter/flutter.git'
)
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
	flutter channel stable
	flutter config --enable-linux-desktop

	cd "$srcdir/$_pkgname/frontend"
	sed -i "/rustup/d" scripts/makefile/env.toml
}

build() {
	_setpath
	cargo install cargo-make
	cargo install duckscript_cli

	cd "$srcdir/$_pkgname/frontend"
	#cargo make --profile "production-linux-$CARCH" flowy-sdk-release
	cargo make --profile "production-linux-$CARCH" appflowy-linux
}

package() {
	_setpath
	cd "$srcdir/$_pkgname/frontend/app_flowy/product/"*/linux/Release/AppFlowy
	install -dm755 "$pkgdir"{/usr/bin,/usr/share/applications,"/opt/$pkgname"}

	cp -a * "$pkgdir/opt/$pkgname/"
	rm "$pkgdir/opt/$pkgname/appflowy.desktop.temp"
	ln -s "/opt/$pkgname/app_flowy" "$pkgdir/usr/bin/"

	_desktop_file="$pkgdir/usr/share/applications/AppFlowy.desktop"
	install -m644 appflowy.desktop.temp "$_desktop_file"
	sed -i '/Exec=/s|\[CHANGE_THIS\]/AppFlowy|/usr/bin|' "$_desktop_file"
	sed -i "/Icon=/s|\[CHANGE_THIS\]/AppFlowy|/opt/$pkgname|" "$_desktop_file"
}
