# Maintainer: @RubenKelevra
# Contributor: Alex Henrie <alexhenrie24@gmail.com>

_archive_extension="tar.gz"
pkgname=ipfs-desktop
pkgver=0.43.0
pkgrel=1
pkgdesc="Desktop client for the InterPlanetary File System"
arch=(x86_64)
url="https://github.com/ipfs/$pkgname"
license=(MIT)
depends=(gtk3 alsa-lib)
makedepends=("nodejs>=16" npm node-gyp libxcrypt-compat libnotify snappy libappindicator-gtk3 re2 nss minizip libxss libxslt libvpx http-parser c-ares libevent)
install=$pkgname.install
source=("$pkgname-$pkgver.$_archive_extension::https://github.com/ipfs/ipfs-desktop/archive/refs/tags/v$pkgver.$_archive_extension")
b2sums=('df97aabcd4df4a8decca54ee6680453ebec9a9dd56cec3ba2ede63d0a59478874fe503b6a3cb0258570f20e9287bc050a6d4ef56260f9511e67534d36f506b7f')

prepare() {
	cd "$pkgname-$pkgver"
	npm ci --no-audit --progress=false --cache "$srcdir/npm-cache"
}

build() {
	cd "$pkgname-$pkgver"
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
