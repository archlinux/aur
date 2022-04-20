shopt -s globstar

_pkgname=lichobile
pkgname="$_pkgname-electron"
pkgver=7.15.2
pkgrel=4
pkgdesc="lichess.org mobile application, packaged with electron"
arch=(any)
url="https://lichess.org/mobile"
license=("GPL-3.0-or-later")
makedepends=(npm)
source=("https://github.com/veloce/lichobile/archive/refs/tags/v$pkgver.tar.gz" "appconfig.prod.json" "run.sh" "lichobile-electron.desktop" "lichesslogowhite.svg" "hide-scrollbar.patch" "native-stockfish.patch" "index.js" "preload.js")
sha256sums=('62d2922ee28d706e7a164629e41e516d203772fc69a3f7a30dc19239f2fb352b'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

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
