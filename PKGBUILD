# Maintainer: Jake <aur@ja-ke.tech>
pkgname=blackbox-explorer
_reponame=blackbox-log-viewer
pkgver=3.5.0
pkgrel=3
pkgdesc="Cleanflight and Betaflight Blackbox Explorer (NW.js build)"
arch=("x86_64")
url="https://github.com/betaflight/${_reponame}"
license=('GPL3')
depends=('nwjs-bin>=0.31.0' 'opera-ffmpeg-codecs')
makedepends=('yarn' 'npm')
source=("https://github.com/betaflight/${_reponame}/archive/$pkgver.tar.gz"        
        "$pkgname.sh"
        "$pkgname.desktop")
sha512sums=('6b6afc88e2e4e2509d2895729a4f126eb54af978f5b27b3ec335df00e3f7f29ded9cc2f25a681dc6d94eca2540efaa2250d8638c6cb80d273a254a20a15787c2'
            '2edc208a2d3901b2908303a7eee4abb48fb87cdc283cb4f40ed69f92317c71b7fcc6aa992364cfe14eecbf37096897329b959893906688db00a6051e44e9ca44'
            'c06b498dfa438002ee9f5f4e90276b051762a936057b6b513e207106f727978fd301d8c131ab320cedc50eb86e46f1f8905b867caf1e6d550fda54985a2529ae')
options=(!strip)

build() {
	cd "$_reponame-$pkgver"
	yarn install
	./node_modules/.bin/gulp dist --linux64
}

package() {
	cd "$_reponame-$pkgver"
        install -d "$pkgdir/usr/share/$pkgname/"
	cp -r dist/* "$pkgdir/usr/share/$pkgname/"
	install -Dm644 "assets/linux/icon/bf_icon_128.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	
        install -d "$pkgdir/usr/bin/"
	install -Dm 755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
