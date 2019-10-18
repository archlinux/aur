# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=ipfs-desktop
pkgver=0.9.5
pkgrel=3
pkgdesc="Desktop client for the InterPlanetary File System"
arch=(x86_64)
url="https://github.com/ipfs-shipyard/$pkgname"
license=(MIT)
depends=(c-ares ffmpeg gtk3 http-parser libevent libvpx libxslt libxss minizip nss re2 snappy libnotify libappindicator-gtk3 libappindicator-sharp)
makedepends=(nodejs npm node-gyp)
install=$pkgname.install
source=("https://github.com/ipfs-shipyard/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=(1c0e1ea67e22228c46f1738665e21339aa4c105109773107817913234b7291a2)

prepare() {
	cd "$pkgname-$pkgver"
	# For the "Launch on startup" feature to work, the program must be installed
	# to a path that does not contain spaces
	sed -i 's/"productName": "IPFS Desktop"/"productName": "IPFS-Desktop"/' package.json
}

build() {
	cd "$pkgname-$pkgver"
	npm install
	npm run-script build:babel
	npx electron-builder build --linux pacman -c.linux.icon=ipfs-desktop -c.linux.category='Network;FileTransfer;P2P' -c.linux.desktop.Name='IPFS Desktop'
}

package() {
	cd "$pkgname-$pkgver"
	tar -xf dist/$pkgname-$pkgver-linux-x64.pacman -C "$pkgdir"
	mv "$pkgdir/.INSTALL" "../$pkgname.install"
	rm "$pkgdir/.MTREE" "$pkgdir/.PKGINFO"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	mv "$pkgdir/opt/IPFS-Desktop/LICENSE.electron.txt" "$pkgdir/usr/share/licenses/$pkgname"
	mv "$pkgdir/opt/IPFS-Desktop/LICENSES.chromium.html" "$pkgdir/usr/share/licenses/$pkgname"
}
