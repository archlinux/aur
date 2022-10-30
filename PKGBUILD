# Maintainer: Ikosse <andrelofgren@hotmail.co.uk>

pkgname=polydock
pkgver=2.1.0
pkgrel=2
pkgdesc="A shiny and hackable application dock"
arch=('any')
url="https://github.com/folke/polydock"
provides=('polydock')
conflicts=('polydock')
license=('Apache-2.0')
makedepends=('pnpm' 'npm')
depends=('gtk3' 'gjs' 'libwnck3' 'gdk-pixbuf2')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('36b7f23908bba7cd99b13f76bb48bfcd33971845f5636fab6239839a69cd511e0804402e672b4e9ea17339ef3eec381e73f192412dff30dfdc2377e55c76b4b0')

build () {
	cd "$srcdir"/$pkgname-$pkgver
	echo "strict-peer-dependencies=false" > .npmrc
	pnpm install
	pnpm run build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	sed -i -e 's/me=.*//' -e 's/dist=.*/dist=\/usr\/share\/'"$pkgname"'\/bin/' bin/polydock.sh
	mv dist/bin/polydock dist/bin/polydock.js
	install -Dm644 dist/config/settings.ini "$pkgdir/usr/share/$pkgname/config/settings.ini"
	install -Dm644 dist/config/themes/default.css "$pkgdir/usr/share/$pkgname/config/themes/default.css"
	install -Dm755 dist/bin/polydock.js "$pkgdir/usr/share/$pkgname/bin/polydock.js"
	install -Dm755 bin/polydock.sh "$pkgdir/usr/share/$pkgname/bin/polydock.sh"
	install -Dm755 bin/polydock.sh "$pkgdir/usr/bin/$pkgname"
}
