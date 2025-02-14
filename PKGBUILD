# Maintainer: @RubenKelevra
# Contributor: Alex Henrie <alexhenrie24@gmail.com>

_archive_extension="tar.gz"
pkgname=ipfs-desktop
pkgver=0.41.2
pkgrel=1
pkgdesc="Desktop client for the InterPlanetary File System"
arch=(x86_64)
url="https://github.com/ipfs/$pkgname"
license=(MIT)
depends=(gtk3 alsa-lib)
makedepends=("nodejs>=16" npm node-gyp libxcrypt-compat libnotify snappy libappindicator-gtk3 re2 nss minizip libxss libxslt libvpx http-parser c-ares libevent)
install=$pkgname.install
source=("$pkgname-$pkgver.$_archive_extension::https://github.com/ipfs/ipfs-desktop/archive/refs/tags/v$pkgver.$_archive_extension")
b2sums=('37d6c70358b395d8b905a5c429d8be9227b463296ec212c1a8f860cad3df9eda966d58dcc33c25e70d1a34929965f1d26551869200f1fa351009e53fb1f454d6')

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
