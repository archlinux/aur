# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=ipfs-desktop
pkgver=0.12.3
pkgrel=1
pkgdesc="Desktop client for the InterPlanetary File System"
arch=(x86_64)
url="https://github.com/ipfs-shipyard/$pkgname"
license=(MIT)
depends=(c-ares ffmpeg gtk3 http-parser libevent libvpx libxslt libxss minizip nss re2 snappy libnotify libappindicator-gtk3)
makedepends=(nodejs npm node-gyp)
install=$pkgname.install
source=("https://github.com/ipfs-shipyard/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=(ac3653833469724160664b58b0b15602a9f6dc273665c50f1a7ebd2c3143e08b)

build() {
	cd "$pkgname-$pkgver"
	npm install --cache "$srcdir/npm-cache"
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
