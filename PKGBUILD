# Maintainer: MithicSpirit <rpc01234 at gmail dot com>

_pkgname=appflowy
pkgname=$_pkgname-git
pkgver=latest
pkgrel=18
pkgdesc='An open-source alternative to Notion.'
arch=(x86_64)
url='https://www.appflowy.io/'
license=('AGPL3')
depends=('glibc>=2.32' gtk3 libkeybinder3 xdg-user-dirs libnotify)
makedepends=(git clang cmake ninja unzip rustup sqlite rsync cargo-make duckscript)
provides=($_pkgname)
conflicts=($_pkgname $_pkgname-bin)
replaces=()
backup=()
options=(!lto)
install=
source=("$_pkgname::git+https://github.com/AppFlowy-IO/AppFlowy.git"
        'flutter::git+https://github.com/flutter/flutter.git#tag=3.19.2')
sha256sums=('SKIP'
            'SKIP')

_setenv() {
	export RUSTUP_HOME="$srcdir/rustup"
	export CARGO_HOME="$srcdir/cargo"
	export PUB_CACHE="$srcdir/pub-cache"

	export PATH="$srcdir/flutter/bin:$PUB_CACHE/bin:$CARGO_HOME/bin:$PATH"
}

pkgver() {
	_setenv
	cd "$srcdir/$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	_setenv

	mkdir "$RUSTUP_HOME" "$CARGO_HOME" "$PUB_CACHE"

	flutter config --enable-linux-desktop

	rustup toolchain install stable
	rustup default stable
}

build() {
	_setenv
	cd "$srcdir/$_pkgname/frontend"

	cargo make appflowy-flutter-deps-tools

	cargo make --profile "production-linux-$CARCH" appflowy
}

package() {
	_setenv
	cd "$srcdir/$_pkgname/frontend"

	install -dm755 "$pkgdir"{/usr/bin,/usr/share/applications,"/opt/$pkgname"}
	cp -a ./appflowy_flutter/product/*/linux/Release/AppFlowy/* "$pkgdir/opt/$pkgname/"
	ln -s "/opt/$pkgname/AppFlowy" "$pkgdir/usr/bin/"

	install -m644 "scripts/linux_distribution/deb/AppFlowy.desktop" \
		"$pkgdir/usr/share/applications/"
}
