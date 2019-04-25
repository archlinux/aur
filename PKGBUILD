# Maintainer: Jake <aur@ja-ke.tech>
# Contributor Jordan Day < jordanday444 at gmail dot com >

pkgname=betaflight-configurator
pkgver=10.5.1
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
sha512sums=('a8d162a2716e54fa4f6d81a4ea26e10014ac29cd842872cdfdfb7ecfe0690e0e773a3b143e43313ea1551c28f4ba5b19e8983871505d33a61a53121e478b3835'
            '1f9113fce812355d1f8cc614d4905845c601622b87aad2b6e74b62913582018a87059727a333db0673a4b767a10564389eece1f588658d171dc4d8446055a0e9'
            '79e5ab59cf8520ce7e20fb2bd89ee99ce3debba69e7da892bf219912cc32c7056a7c8fd6dae19eebfe4956c948d0bc75ece40911b203fcc2f34e43f2d8329532')
options=(!strip)
install=$pkgname.install

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
