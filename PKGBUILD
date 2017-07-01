# Maintainer: sum01 <sum01@protonmail.com>
pkgname=('vcash-electron')
pkgver=0.33.1
pkgrel=3
pkgdesc="Multi-platform and multi-node GUI for Vcash."
arch=('i686' 'x86_64')
url="https://github.com/openvcash/vcash-electron"
license=('GPL3')
depends=('libxss' 'gconf' 'nss' 'alsa-lib' 'gtk2' 'libxtst')
makedepends=('npm' 'sed')
optdepends=('vcash: the vcash daemon')
source=("https://github.com/openvcash/vcash-electron/archive/v$pkgver.tar.gz"
"vcash-electron.desktop")
sha512sums=('52fb396ac0fc22b6c6ed3c3334b04c927a012df2bf6e9b40f30beaba44359a45081e036816d6c17afe34d6f1749cf81244ef7a766ed033e4220da72e626ad894'
'339a50892e4c4af228e58471d185a9ff014a23efc3a1f45ac4b6880b25d9f1937bd9aa406979d7f21396856637e79d70c46320220786d43ae84dfdf3e6292c1b')
prepare(){
	sed -i '/"deb",/d' "$srcdir/$pkgname-$pkgver/package.json"
	sed -i 's/"zip"/"dir"/' "$srcdir/$pkgname-$pkgver/package.json"
	if [[ $CARCH = "i686" ]]; then
		sed -i 's/build --linux --x64/build --linux --ia32/' "$srcdir/$pkgname-$pkgver/package.json"
	fi
}
build(){
	cd "$srcdir/$pkgname-$pkgver/"
	npm install && npm prune && npm run dist-linux
}
package(){
	mkdir -p "$pkgdir"/usr/{bin,lib,share/{applications,icons/hicolor/{16x16,32x32,48x48,96x96,128x128,256x256}/apps}}/
	install -m644 "$srcdir/$pkgname-$pkgver/build/icons/16x16.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/vcash.png"
	install -m644 "$srcdir/$pkgname-$pkgver/build/icons/32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/vcash.png"
	install -m644 "$srcdir/$pkgname-$pkgver/build/icons/48x48.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/vcash.png"
	install -m644 "$srcdir/$pkgname-$pkgver/build/icons/96x96.png" "$pkgdir/usr/share/icons/hicolor/96x96/apps/vcash.png"
	install -m644 "$srcdir/$pkgname-$pkgver/build/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/vcash.png"
	install -m644 "$srcdir/$pkgname-$pkgver/build/icons/256x256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/vcash.png"
	install -m644 vcash-electron.desktop "$pkgdir/usr/share/applications/"
	ln -s /usr/lib/$pkgname/vcash-electron "$pkgdir/usr/bin/$pkgname"
	if [[ $CARCH = "i686" ]]; then
		mv "$srcdir/$pkgname-$pkgver/dist/linux-ia32-unpacked" "$pkgdir/usr/lib/$pkgname"
		if [[ -e /usr/lib/vcash/vcashd ]]; then
			ln -s /usr/lib/vcash/vcashd "$pkgdir/usr/lib/$pkgname/resources/app.asar.unpacked/bin/vcashd-ia32"
		fi
	else
		mv "$srcdir/$pkgname-$pkgver/dist/linux-unpacked" "$pkgdir/usr/lib/$pkgname"
		if [[ -e /usr/lib/vcash/vcashd ]]; then
			ln -s /usr/lib/vcash/vcashd "$pkgdir/usr/lib/$pkgname/resources/app.asar.unpacked/bin/vcashd-x64"
		fi
	fi
}
