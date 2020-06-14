# Maintainer: Jake <aur@ja-ke.tech>
# Contributor Jordan Day < jordanday444 at gmail dot com >

pkgname=betaflight-configurator
pkgver=10.7.0
pkgrel=1
pkgdesc="Crossplatform configuration tool for the Betaflight flight control system"
arch=('x86_64')
url="https://github.com/betaflight/betaflight-configurator"
license=('GPL3')
depends=('nwjs-bin')
makedepends=('yarn' 'npm' 'git')
source=("https://github.com/betaflight/betaflight-configurator/archive/$pkgver.zip"
        "$pkgname.sh"
        "$pkgname.desktop")
sha512sums=('1e57309c6da41b6b00fb1790aca6211e4e69af3ec721b15a27c808af9a4cf43ae88fcf92b7deaedcd9db194e9fb0aaefaee848d4cc01ae364dfe2aae8b7875ed'
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
	install -Dm644 "assets/linux/icon/bf_icon_128.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	
	install -d "$pkgdir/usr/bin/"
	install -Dm 755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
