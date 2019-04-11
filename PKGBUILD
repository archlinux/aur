# Maintainer: Jake <aur@ja-ke.tech>
# Contributor Jordan Day < jordanday444 at gmail dot com >

pkgname=betaflight-configurator
pkgver=10.5.0
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
sha512sums=('43e17a1288a8be7b16af1bed8cfc533c42a76b36f894c40842de615e5f655663efbcd2b0863ca5060d5314b96e22bd3fd6a87f50f6c426a9643ffcc6b5274b84'
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
