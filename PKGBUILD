# Maintainer: j.r <j.r@jugendhacker.de>
pkgname=sonixd
pkgver=0.11.0
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
	"$pkgname")
sha256sums=('7a6f05612d2459d07d49d885d7547fd62d44745f53b4073f1da4e7bdab36fb13'
            '89039f59dc58490cc5a2e05bb38b3645448df56b2e763d6170facb64e73241d0')

_ensure_local_nvm() {
	which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
	export NVM_DIR="$srcdir/.nvm"

	source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
	cd "$pkgname-$pkgver"

	_ensure_local_nvm
	nvm install --no-progress 15.14.0

	_ver="$(</usr/lib/electron13/version)"
	yarn upgrade --cache-folder="$srcdir/yarn-cache" "electron@$_ver"
}

build() {
	cd "$pkgname-$pkgver"

	_ver="$(</usr/lib/electron13/version)"
	local i686=ia32 x86_64=x64
	export NODE_ENV=production
	yarn build --cache-folder="$srcdir/yarn-cache"
	yarn run --cache-folder="$srcdir/yarn-cache" \
		electron-builder --linux --"${!CARCH}" --dir \
		-c.electronDist=/usr/lib/electron \
		-c.electronVersion="$_ver"
}

package() {
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

	cd "$pkgname-$pkgver"
	local i686=linux-ia32-unpacked x86_64=linux-unpacked

	install -d "$pkgdir/usr/lib/$pkgname/"

	cp -r "release/${!CARCH}/resources/assets" "$pkgdir/usr/lib/$pkgname"
	asar e "release/${!CARCH}/resources/app.asar" "$pkgdir/usr/lib/$pkgname/$pkgname/"
}
