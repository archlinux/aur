# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
pkgname=beryl
pkgver=0.0.5
pkgrel=1
pkgdesc="Extendable timer using electron."
arch=(any)
url="https://github.com/BrenekH/beryl"
license=('MIT')
depends=('electron')
makedepends=('nodejs' 'npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/BrenekH/beryl/archive/refs/tags/v$pkgver.tar.gz" "beryl" "beryl.desktop" "bipa.xml" "berylprof.xml")
sha256sums=('479af31f1113434116f3cecc69faf9caeeebc90111fec4d8dc456d3ac579aa2d'
            '64ba0a65ff8fe1bfb2ae2eea4f821e245c00a694fa080956c243d3ab81bd1edb'
            '715683464f03fa7d52860eb969c993402d777b9487595f3eb8169b269c17acbe'
            '7bfcda7056e131630771152f2c51d48e24ae94f4eb30795ef35d9120dfb10853'
            'c7fb876af2aee7e85f43a022fe0931d879c190ee585f9c9df22188514c6db584')

build() {
	cd "$pkgname-$pkgver"
	mkdir fake_home
	HOME="fake_home" npm ci

	rm -rf fake_home

	npm run package
}

package() {
	install -Dm755 -t "$pkgdir/usr/bin" beryl
	install -Dm644 -t "$pkgdir/usr/share/applications" beryl.desktop
	install -Dm644 -t "$pkgdir/usr/share/mime/packages" bipa.xml
	install -Dm644 -t "$pkgdir/usr/share/mime/packages" berylprof.xml

	cd "$pkgname-$pkgver"

	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
	install -Dm644 "src/icons/1024x1024.png" "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/$pkgname.png"

	mkdir -p "$pkgdir/usr/lib/$pkgname"
	cp -dr --no-preserve=ownership out/beryl-linux-x64/resources/app/. "$pkgdir/usr/lib/$pkgname/"
}
