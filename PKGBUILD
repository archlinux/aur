# Maintainer: Jake <aur@ja-ke.tech>
# Contributor Jordan Day < jordanday444 at gmail dot com >

pkgname=betaflight-configurator
pkgver=10.8.0
pkgrel=1
pkgdesc="Crossplatform configuration tool for the Betaflight flight control system"
arch=('x86_64')
url="https://github.com/betaflight/betaflight-configurator"
license=('GPL3')
depends=('nwjs-bin')
makedepends=('yarn' 'npm' 'git')
source=("git+https://github.com/betaflight/betaflight-configurator.git#tag=$pkgver"
        "$pkgname.sh"
        "$pkgname.desktop"
        "remove_android_build_deps.patch")
sha512sums=('SKIP'
            '1f9113fce812355d1f8cc614d4905845c601622b87aad2b6e74b62913582018a87059727a333db0673a4b767a10564389eece1f588658d171dc4d8446055a0e9'
            '79e5ab59cf8520ce7e20fb2bd89ee99ce3debba69e7da892bf219912cc32c7056a7c8fd6dae19eebfe4956c948d0bc75ece40911b203fcc2f34e43f2d8329532'
            'baa70c87a0fa85251ffd3d2fdf09e108e460283ef8132947cd75a33232217b2ff3fb84672d8138df8ad5be058b45309f020515c7750e81b4689756dca35660b2')
options=(!strip)
install=$pkgname.install

prepare() {
	cd $pkgname
	
	# Allow higher node version
	sed 's#"node": "#&>=#' -i package.json

	# Remove unecessary Andoid/Cordova XML build dependcy
	patch -Np1 < "$srcdir/remove_android_build_deps.patch"
}

build() {
	cd $pkgname

	yarn install
	./node_modules/.bin/gulp dist --linux64
}

package() {
	cd $pkgname
	install -d "$pkgdir/usr/share/$pkgname/"
	cp -r dist/* "$pkgdir/usr/share/$pkgname/"
	install -Dm644 "assets/linux/icon/bf_icon_128.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	
	install -d "$pkgdir/usr/bin/"
	install -Dm 755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
