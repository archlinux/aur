# Maintainer: j.r <j.r@jugendhacker.de>
pkgname=sonixd
pkgver=0.15.3
pkgrel=1
pkgdesc="A full-featured Subsonic/Jellyfin compatible desktop music player"
arch=('x86_64')
url="https://github.com/jeffvli/sonixd"
license=('GPL3')
depends=('electron13')
makedepends=('yarn' 'asar' 'python3' 'nodejs-lts-gallium' 'git' 'node-gyp')
conflicts=("$pkgname-appimage")
replaces=("$pkgname-appimage")
source=("$pkgname-$pkgver.tar.gz::https://github.com/jeffvli/sonixd/archive/refs/tags/v$pkgver.tar.gz"
	"$pkgname"
	"$pkgname.desktop")
sha256sums=('f6954415491400d802fe098a2fcb94ac451c3c5d535a89f85825c8a1ef0963ee'
            '89039f59dc58490cc5a2e05bb38b3645448df56b2e763d6170facb64e73241d0'
            '9e2e1cce47b594b75b8df7a1cf3a5a6da340dda9d0cfdf2aa305d097fc0bbc7a')

prepare() {
	cd "$pkgname-$pkgver"

	_ver="$(</usr/lib/electron13/version)"
	HOME="$srcdir/.electron-gyp" yarn upgrade --cache-folder="$srcdir/yarn-cache" "electron@$_ver"
	HOME="$srcdir/.electron-gyp" yarn install --cache-folder="$srcdir/yarn-cache"
}

build() {
	cd "$pkgname-$pkgver"

	_ver="$(</usr/lib/electron13/version)"
	local i686=ia32 x86_64=x64
	export NODE_ENV=production
	yarn build --cache-folder="$srcdir/yarn-cache"
	yarn run --cache-folder="$srcdir/yarn-cache" \
		electron-builder --linux --"${!CARCH}" --dir \
		-c.electronDist=/usr/lib/electron13 \
		-c.electronVersion="$_ver"
}

package() {
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm755 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

	cd "$pkgname-$pkgver"
	local i686=linux-ia32-unpacked x86_64=linux-unpacked

	install -d "$pkgdir/usr/lib/$pkgname/"

	install -Dm644 "release/${!CARCH}/resources/assets/icons/512x512.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	cp -r "release/${!CARCH}/resources/assets" "$pkgdir/usr/lib/$pkgname"
	asar e "release/${!CARCH}/resources/app.asar" "$pkgdir/usr/lib/$pkgname/$pkgname/"
}
