# Maintainer: j.r <j.r@jugendhacker.de>
pkgname=sonixd
pkgver=0.15.2
pkgrel=1
pkgdesc="A full-featured Subsonic/Jellyfin compatible desktop music player"
arch=('x86_64')
url="https://github.com/jeffvli/sonixd"
license=('GPL3')
depends=('electron13' 'nodejs')
makedepends=('yarn' 'nvm' 'asar')
conflicts=("$pkgname-appimage")
replaces=("$pkgname-appimage")
source=("$pkgname-$pkgver.tar.gz::https://github.com/jeffvli/sonixd/archive/refs/tags/v$pkgver.tar.gz"
	"$pkgname"
	"$pkgname.desktop")
sha256sums=('297d32e384f668e81308af8b112c35bb2a062264676caac0f9f06b22fa5d5629'
            '89039f59dc58490cc5a2e05bb38b3645448df56b2e763d6170facb64e73241d0'
            '9e2e1cce47b594b75b8df7a1cf3a5a6da340dda9d0cfdf2aa305d097fc0bbc7a')

_ensure_local_nvm() {
	which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
	export NVM_DIR="$srcdir/.nvm"

	source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
	mkdir -p "$srcdir/.nvm"
	cd "$pkgname-$pkgver"

	_ensure_local_nvm
	nvm install --no-progress 16

	_ver="$(</usr/lib/electron13/version)"
	yarn upgrade --cache-folder="$srcdir/yarn-cache" "electron@$_ver"
}

build() {
	cd "$pkgname-$pkgver"

	_ver="$(</usr/lib/electron13/version)"
	_ensure_local_nvm
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
