# Maintainer: sum01 <sum01@protonmail.com>
# Contributor: j1simon
pkgname=buttercup-desktop
pkgver=1.14.0
pkgrel=1
pkgdesc='Javascript Password Vault - Multi-Platform Desktop Application'
arch=('i686' 'x86_64')
url="https://github.com/buttercup/buttercup-desktop"
license=('GPL3')
depends=('gtk3' 'libxss' 'nss')
makedepends=('npm' 'sed')
source=("$pkgname-$pkgver.tar.gz::https://github.com/buttercup/buttercup-desktop/archive/v$pkgver.tar.gz")
sha512sums=('77022ea29b953a560ae6dcd5dec945b302f95f084fd4edec4a0ece853d056e24424808916f7c5554bd2705694b5b8d850385724b079fc7d660123f4d32b09b9d')
prepare() {
	sed -i '/"rpm",/d' "$srcdir/$pkgname-$pkgver/package.json"
	sed -i '/"AppImage",/d' "$srcdir/$pkgname-$pkgver/package.json"
	sed -i '/"snap",/d' "$srcdir/$pkgname-$pkgver/package.json"
	sed -i 's/"deb"/"dir"/' "$srcdir/$pkgname-$pkgver/package.json"
	if [[ $CARCH == "i686" ]]; then
		sed -i 's/build --linux --x64/build --linux --ia32/' "$srcdir/$pkgname-$pkgver/package.json"
	fi
}
build() {
	cd "$srcdir/$pkgname-$pkgver"
	npm install --cache "$srcdir/npm-cache"
	npm run build
	npm run package:linux
}
package() {
	install -Dm644 "$srcdir/$pkgname-$pkgver/build/badge.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/buttercup.svg"
	install -Dm644 "$srcdir/$pkgname-$pkgver/build/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	if [[ $CARCH == "i686" ]]; then
		_distname="linux-ia32-unpacked"
	else
		_distname="linux-unpacked"
	fi
	mkdir -p "$pkgdir"/{usr/bin,opt}
	cp -rf "$srcdir/$pkgname-$pkgver/release/$_distname" "$pkgdir/opt/$pkgname"
	ln -sf /opt/$pkgname/$pkgname "$pkgdir/usr/bin/buttercup"
}
