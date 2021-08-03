_pkgname=lichobile
pkgname="$_pkgname-electron"
pkgver=7.11.3
pkgrel=3
pkgdesc="lichess.org mobile application, packaged with electron"
arch=(any)
url="https://lichess.org/mobile"
license=("GPL-3.0-or-later")
depends=(electron)
makedepends=(npm)
source=("https://github.com/veloce/lichobile/archive/refs/tags/v$pkgver.tar.gz" "appconfig.prod.json" "run.sh" "lichobile-electron.desktop" "lichesslogowhite.svg" "hide-scrollbar.patch" "index.js")
sha256sums=("27719c7be577931e8b2020d6e27760a00982b55efd1d6a507128e0f2168224a6" "SKIP" "SKIP" "SKIP" "SKIP" "SKIP" "SKIP")

prepare() {
	cd "$_pkgname-$pkgver"
	npm install

	cp ../appconfig.prod.json ./

	patch -Np1 -i ../hide-scrollbar.patch
}

build() {
	cd "$_pkgname-$pkgver"
	APP_MODE=release APP_CONFIG=prod npm run build
}

package() {
	cd "$_pkgname-$pkgver"

	install -d "$pkgdir"/usr/share/webapps/$_pkgname
	
	cp -r www/* "$pkgdir"/usr/share/webapps/$_pkgname

	install -Dm755 ../run.sh "$pkgdir"/usr/bin/$pkgname

	install -Dm644 -t "$pkgdir"/usr/share/applications ../lichobile-electron.desktop
	install -Dm644 -t "$pkgdir"/usr/share/icons/hicolor/scalable/apps ../lichesslogowhite.svg

	install -Dm644 -t "$pkgdir"/usr/lib/$pkgname ../index.js
	ln -s /usr/share/webapps/$_pkgname "$pkgdir"/usr/lib/$pkgname/www
}
