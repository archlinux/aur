# Maintainer: Jake <aur@ja-ke.tech>
pkgname=blackbox-explorer
_reponame=blackbox-log-viewer
pkgver=3.3.0
pkgrel=1
pkgdesc="Cleanflight and Betaflight Blackbox Explorer (NW.js build)"
arch=("x86_64")
url="https://github.com/betaflight/${_reponame}"
license=('GPL3')
depends=('nwjs-bin>=0.31.0' 'nwjs-ffmpeg-codecs-bin')
makedepends=('yarn' 'npm')
source=("https://github.com/betaflight/${_reponame}/archive/$pkgver.tar.gz"        
        "$pkgname.sh"
        "$pkgname.desktop")
sha512sums=('0b915e971798c7548730111f3510aae424571920789030bce9b2b0ca7f47b378fcc0a08e385ec040093c9f9b1dbd2e2d9b739242b6ddae4a523db03efc0b547e'
            'd5e10ddba597043b75e7a5e02bf23d4bf1c6c64907c9b187e2e48bed045e001abaaec062b39bd9040222d1693758a54112d56d92538cb8b717d2b60d41175fa4'
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
	install -D "assets/linux/icon/bf_icon_128.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -D "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	
        install -d "$pkgdir/usr/bin/"
	install -Dm 755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
