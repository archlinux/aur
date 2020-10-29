# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=ipfs-desktop
pkgver=0.13.2
pkgrel=1
pkgdesc="Desktop client for the InterPlanetary File System"
arch=(x86_64)
url="https://github.com/ipfs-shipyard/$pkgname"
license=(MIT)
depends=(c-ares ffmpeg gtk3 http-parser libevent libvpx libxslt libxss minizip nss re2 snappy libnotify libappindicator-gtk3)
makedepends=(nodejs npm node-gyp)
install=$pkgname.install
source=("https://github.com/ipfs-shipyard/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=(d1ede6ac1850f37f9b2d5f6ec310aa4a86c5ec93a347939b0b8c327340282b23)

build() {
	cd "$pkgname-$pkgver"
	npm install --cache "$srcdir/npm-cache"
	npm run-script build
	npx electron-builder build --linux pacman
}

package() {
	cd "$pkgname-$pkgver"
	tar -xf dist/$pkgname-$pkgver-linux-x64.pacman -C "$pkgdir"
	mv "$pkgdir/.INSTALL" "../$pkgname.install"
	rm "$pkgdir/.MTREE" "$pkgdir/.PKGINFO"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	mv "$pkgdir/opt/IPFS Desktop/LICENSE.electron.txt" "$pkgdir/usr/share/licenses/$pkgname"
	mv "$pkgdir/opt/IPFS Desktop/LICENSES.chromium.html" "$pkgdir/usr/share/licenses/$pkgname"
}
