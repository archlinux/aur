# Maintainer: sum01 <sum01@protonmail.com>
pkgname=vcash-electron
pkgver=0.33.1
pkgrel=5
pkgdesc="Multi-platform and multi-node GUI for Vcash."
arch=('i686' 'x86_64')
url="https://gitlab.com/openvcash/vcash-electron"
license=('GPL3')
depends=('libxss' 'gconf' 'nss' 'alsa-lib' 'gtk2' 'libxtst')
makedepends=('npm' 'sed')
optdepends=('vcash: the vcash daemon')
source=("https://gitlab.com/openvcash/vcash-electron/-/archive/v$pkgver/vcash-electron-v$pkgver.tar.gz"
	"vcash-electron.desktop")
sha512sums=('03feba587c5a81ce56548083d2f28a05298793f0233e1300fc3c8e0c1f23b5d072d57ba4daba09335686903efcf101a4034823f651d8e21d10eef60d2ad2be95'
            '9e8f90d330a8414d1b94dce1d0c533b10a1bda8a52d599a2f2890d654f28729ac5d7359f904ea684ad74d552faee5dd4fc97f97b0ceb9dbb89bdeafeef76bfe9')
prepare() {
	sed -i '/"deb",/d' "$srcdir/$pkgname-v$pkgver/package.json"
	sed -i 's/"zip"/"dir"/' "$srcdir/$pkgname-v$pkgver/package.json"
	if [[ $CARCH == "i686" ]]; then
		sed -i 's/build --linux --x64/build --linux --ia32/' "$srcdir/$pkgname-v$pkgver/package.json"
	fi
}
build() {
	cd "$srcdir/$pkgname-v$pkgver"
	npm install --cache "$srcdir/npm-cache"
	npm prune
	npm run dist-linux
}
package() {
	for _size in 16 32 48 96 128 256; do
		install -Dm644 "$srcdir/$pkgname-v$pkgver/build/icons/${_size}x${_size}.png" "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/vcash.png"
	done
	install -Dm644 vcash-electron.desktop "$pkgdir/usr/share/applications/vcash-electron.desktop"
	if [[ $CARCH == "i686" ]]; then
		_dist="linux-ia32-unpacked"
		_sys="ia32"
	else
		_dist="linux-unpacked"
		_sys="x64"
	fi
	mkdir -p "$pkgdir"/{usr/bin,opt}
	cp -rf "$srcdir/$pkgname-v$pkgver/dist/$_dist" "$pkgdir/opt/$pkgname"
	ln -sf /opt/$pkgname/$pkgname "$pkgdir/usr/bin/$pkgname"
	if [[ -e /usr/bin/vcashd ]]; then
		ln -sf /usr/bin/vcashd "$pkgdir/opt/$pkgname/resources/app.asar.unpacked/bin/vcashd-$_sys"
	fi
}
