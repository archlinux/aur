# Maintainer: Jake <aur@ja-ke.tech>
# Contributor Jordan Day < jordanday444 at gmail dot com >

pkgname=betaflight-configurator
pkgver=10.10.0
pkgrel=1
pkgdesc="Crossplatform configuration tool for the Betaflight flight control system"
arch=('x86_64')
url="https://github.com/betaflight/betaflight-configurator"
license=('GPL3')
makedepends=('yarn' 'npm' 'git')
source=("git+https://github.com/betaflight/betaflight-configurator.git#tag=$pkgver"
        "$pkgname.desktop"
        "remove_android_build_deps.patch")
sha512sums=('a1d29f60df7d5b507c0ac68253014a3161b5a78eae6b66922d66a5c5a77a592ceca094dbf00b2217aa395097f17140602dc0f6c1aed7c9aea8ea53688d38302f'
            '79e5ab59cf8520ce7e20fb2bd89ee99ce3debba69e7da892bf219912cc32c7056a7c8fd6dae19eebfe4956c948d0bc75ece40911b203fcc2f34e43f2d8329532'
            'faa4c8a6edf932068e97bc4435d5237379daf12f3c8c21ab1facf1c9db186261d23270c48f1601565c1af1d742f4ac3469c156f3535d5176a427c5ba13ac1b5d')
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
	yarn release --linux64
}

package() {
	cd $pkgname

	install -d "$pkgdir/opt/$pkgname/"
	cp -r apps/$pkgname/linux64/* "$pkgdir/opt/$pkgname/"
	chmod -R a=u,g-w,o-w "$pkgdir/opt/$pkgname/"

	install -Dm644 "assets/linux/icon/bf_icon_128.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	
	install -d "$pkgdir/usr/bin/"
	ln -s /opt/$pkgname/$pkgname "$pkgdir/usr/bin/$pkgname"
}
