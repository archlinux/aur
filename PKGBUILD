# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=ipfs-desktop
pkgver=0.9.5
pkgrel=1
pkgdesc="Desktop client for the InterPlanetary File System"
arch=(x86_64)
url="https://github.com/ipfs-shipyard/$pkgname"
license=(MIT)
depends=(electron)
makedepends=(nodejs npm node-gyp)
source=("https://github.com/ipfs-shipyard/$pkgname/archive/v$pkgver.tar.gz"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=(1c0e1ea67e22228c46f1738665e21339aa4c105109773107817913234b7291a2
            SKIP
            SKIP)

prepare() {
	cd "$pkgname-$pkgver"
	sed -i '/setupAutoUpdater/d' src/index.js #disable automatic updates
}

build() {
	cd "$pkgname-$pkgver"
	npm install
	npm run-script build:babel
}

package() {
	install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	cd "$pkgname-$pkgver"
	install -Dm644 package.json "$pkgdir/usr/lib/$pkgname/package.json"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cp -r node_modules assets out "$pkgdir/usr/lib/$pkgname"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/scalable/apps"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/22x22/apps"
	ln -s "/usr/lib/$pkgname/assets/icons/ipfs-logo-on.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/ipfs.svg"
	ln -s "/usr/lib/$pkgname/assets/icons/tray/ice.png" "$pkgdir/usr/share/icons/hicolor/22x22/apps/ipfs.png"
}
