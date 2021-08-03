# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=ipfs-desktop
pkgver=0.16.2
pkgrel=1
pkgdesc="Desktop client for the InterPlanetary File System"
arch=(x86_64)
url="https://github.com/ipfs/$pkgname"
license=(MIT)
depends=(c-ares ffmpeg gtk3 http-parser libevent libvpx libxslt libxss minizip nss re2 snappy libnotify libappindicator-gtk3)
makedepends=(nodejs npm node-gyp)
install=$pkgname.install
source=("https://github.com/ipfs/ipfs-desktop/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('0b64a04222606641f46a8b9ea336cd0be753888f76d8737812d37a39479276b8ba1d1061bbb64f5dcde84928f37e93eaec72cf1eb4ce3169ac16d94e91d12ba2')

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
	mkdir -p "$pkgdir/usr/bin"
	ln -s '/opt/IPFS Desktop/ipfs-desktop' "$pkgdir/usr/bin/ipfs-desktop"
}
