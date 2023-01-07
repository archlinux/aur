shopt -s globstar

_pkgname=lichobile
pkgname="$_pkgname-electron"
pkgver=8.0.0
pkgrel=2
pkgdesc="lichess.org mobile application, packaged with electron"
arch=(any)
url="https://lichess.org/mobile"
license=("GPL-3.0-or-later")
makedepends=(npm)
source=("https://github.com/veloce/lichobile/archive/refs/tags/v$pkgver.tar.gz" "appconfig.prod.json" "run.sh" "lichobile-electron.desktop" "lichesslogowhite.svg" "hide-scrollbar.patch" "native-stockfish.patch" "index.js" "preload.js")
sha256sums=('7ab9bcb1900ff1ff07197cc871e1c0f3e4b4d0ed964f5757d98dd58e73e822d3'
            'a41fe45549f76234f1922a30289db674531a7fa4d11e355e57df2fbd2e5795aa'
            '759fd9dd1ee0423be68b0a0466bd059f71408fc8e1bff461c94b4378a23a2f49'
            'd2773b69330634060130af9af2e157bb571653752983fb9df792378e1a29c512'
            '3d9e0bb9a5d16df02483263810cfa461263cd320f83baaf5ec69ad5c2b8c01fa'
            '3168ad338a32361887f6592ebaf503e0594f8d4e5facb5ad71e5b6f84650b396'
            'd33f4ef5f0ad3fa0bee15c918199060f9e4148e96457285b1b6af7fdd1a741bd'
            '68af775157aba1028e10c8504e4e0ad06042f032913a0a6bc4a35fd29c3a6af7'
            '439a31acb844e7ca1afc670f8591c46f197c8ef65afea3df610704f19a8494c4')

prepare() {
	cd "$_pkgname-$pkgver"

	cp ../appconfig.prod.json ./

	patch -Np1 -i ../hide-scrollbar.patch
	patch -Np1 -i ../native-stockfish.patch

	npm install
}

build() {
	cd "$_pkgname-$pkgver"
	APP_MODE=release APP_CONFIG=prod npm run build
}

package() {
	depends=(electron fairy-stockfish)

	cd "$_pkgname-$pkgver"

	install -d "$pkgdir"/usr/share/webapps/$_pkgname
	
	cp -r www/* "$pkgdir"/usr/share/webapps/$_pkgname

	install -Dm755 ../run.sh "$pkgdir"/usr/bin/$pkgname

	install -Dm644 -t "$pkgdir"/usr/share/applications ../lichobile-electron.desktop
	install -Dm644 -t "$pkgdir"/usr/share/icons/hicolor/scalable/apps ../lichesslogowhite.svg

	install -Dm644 -t "$pkgdir"/usr/lib/$pkgname ../index.js ../preload.js
	ln -s /usr/share/webapps/$_pkgname "$pkgdir"/usr/lib/$pkgname/www
}
