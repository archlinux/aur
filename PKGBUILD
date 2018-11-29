# Maintainer: sum01 <sum01@protonmail.com>
# Contributor: j1simon
pkgname=buttercup-desktop
pkgver=1.12.2
pkgrel=1
pkgdesc='Javascript Password Vault - Multi-Platform Desktop Application'
arch=('i686' 'x86_64')
url="https://github.com/buttercup/buttercup-desktop"
license=('GPL3')
depends=('gtk3' 'libxss' 'nss')
makedepends=('npm' 'sed')
source=("$pkgname-$pkgver.tar.gz::https://github.com/buttercup/buttercup-desktop/archive/v$pkgver.tar.gz")
sha512sums=('3ef157d683c8f233bd4044b4ad84ebc42d8d04833aebab47bc3ac7d4000a510e3a2bf26cedef123ff48e13802c351b74cb51f2974e633c7a62a3182745864b04')
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
