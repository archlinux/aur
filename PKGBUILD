# Maintainer: Jake <aur@ja-ke.tech>
# Contributor Jordan Day < jordanday444 at gmail dot com >

pkgname=betaflight-configurator
pkgver=10.6.0
pkgrel=2
pkgdesc="Crossplatform configuration tool for the Betaflight flight control system"
arch=('x86_64')
url="https://github.com/betaflight/betaflight-configurator"
license=('GPL3')
depends=('nwjs-bin')
makedepends=('yarn' 'npm' 'git')
source=("https://github.com/betaflight/betaflight-configurator/archive/$pkgver.zip"
        "$pkgname.sh"
        "$pkgname.desktop")
sha512sums=('af868c03a74f0d5da26094e73abbf2d046816c6d64dd674783cc89e0a2bdfc564a457ffd566538311c1c59cc76de45492651e0e42c5eb2e9ec7a419a2b0d8620'
            '36fdaf3dde69f64b9af35e1eac0c623c004a9ddcdbdb62848b6add763aab4c69027afd4ade0af7ed3e06e09ede826f41b23eaa9a15f4c603e2e17193423cde57'
            '79e5ab59cf8520ce7e20fb2bd89ee99ce3debba69e7da892bf219912cc32c7056a7c8fd6dae19eebfe4956c948d0bc75ece40911b203fcc2f34e43f2d8329532')
options=(!strip)
install=$pkgname.install

prepare() {
	cd $pkgname-$pkgver
	
	# Allow higher node version
	sed 's#"node": "#&>=#' -i package.json
}

build() {
	cd $pkgname-$pkgver
	#The build process saves the git commit hash for analytics
        git init && git add -A && git commit -m 'Gitinfo workaround'

	yarn install
	./node_modules/.bin/gulp dist --linux64
}

package() {
	cd $pkgname-$pkgver
	install -d "$pkgdir/usr/share/$pkgname/"
	cp -r dist/* "$pkgdir/usr/share/$pkgname/"
	install -D "assets/linux/icon/bf_icon_128.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -D "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	
	install -d "$pkgdir/usr/bin/"
	install -Dm 755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
