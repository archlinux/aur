# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=ipfs-desktop
pkgver=0.10.4
pkgrel=2
pkgdesc="Desktop client for the InterPlanetary File System"
arch=(x86_64)
url="https://github.com/ipfs-shipyard/$pkgname"
license=(MIT)
depends=(c-ares ffmpeg gtk3 http-parser libevent libvpx libxslt libxss minizip nss re2 snappy libnotify libappindicator-gtk3)
makedepends=(nodejs npm node-gyp)
install=$pkgname.install
source=("https://github.com/ipfs-shipyard/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=(d4cc401f4cafaacb5a7f25518732fdc5c95f16d271794b605b24567c3cf07fa1)

build() {
	cd "$pkgname-$pkgver"
	npm install --cache "$srcdir/npm-cache"
	npm run-script build:babel
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
