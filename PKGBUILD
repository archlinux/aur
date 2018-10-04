# Maintainer: sum01 <sum01@protonmail.com>
# Contributor: j1simon
pkgname=buttercup-desktop
pkgver=1.10.2
pkgrel=1
pkgdesc='Javascript Password Vault - Multi-Platform Desktop Application'
arch=('i686' 'x86_64')
url="https://github.com/buttercup/buttercup-desktop"
license=('GPL3')
depends=('gtk3' 'libxss' 'nss')
makedepends=('npm' 'sed')
source=("$pkgname-$pkgver.tar.gz::https://github.com/buttercup/buttercup-desktop/archive/v$pkgver.tar.gz")
sha512sums=('7fa0f089caa468e1770f2c1a890cff6fe6be94216fa6d1718c52e5bd22fc7f8947b50197bc88e0b0734b9b43b169ef4be0f3cb173ae72c2110c999c0346eb227')
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
