# Maintainer: Jake <aur@ja-ke.tech>
pkgname=blackbox-explorer
_reponame=blackbox-log-viewer
pkgver=3.6.0
pkgrel=1
pkgdesc="Cleanflight and Betaflight Blackbox Explorer (NW.js build)"
arch=("x86_64")
url="https://github.com/betaflight/${_reponame}"
license=('GPL3')
depends=('nwjs-bin>=0.31.0' 'opera-ffmpeg-codecs')
makedepends=('yarn' 'npm')
source=("https://github.com/betaflight/${_reponame}/archive/$pkgver.tar.gz"        
        "$pkgname.sh"
        "$pkgname.desktop")
sha512sums=('a26d0c7ead2883565c61b417bf9b264ff14edfda002ea9a7b62d351cb327d5072218fca36ac9ccfa1dbbde9b586d458c4d67edc6c64d15e430fb63721723ad87'
            '2edc208a2d3901b2908303a7eee4abb48fb87cdc283cb4f40ed69f92317c71b7fcc6aa992364cfe14eecbf37096897329b959893906688db00a6051e44e9ca44'
            'c06b498dfa438002ee9f5f4e90276b051762a936057b6b513e207106f727978fd301d8c131ab320cedc50eb86e46f1f8905b867caf1e6d550fda54985a2529ae')
options=(!strip)

prepare() {
	cd "$_reponame-$pkgver"

	# Allow higher node version
	sed 's#"node": "#&>=#' -i package.json
}

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
