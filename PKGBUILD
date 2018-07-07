# Maintainer: Jake <aur@ja-ke.tech>
pkgname=blackbox-explorer
_reponame=blackbox-log-viewer
pkgver=3.1.0
pkgrel=2
pkgdesc="Cleanflight and Betaflight Blackbox Explorer (NW.js build)"
arch=("x86_64")
url="https://github.com/betaflight/${_reponame}"
license=('GPL3')
depends=('nwjs-bin>=0.31.0' 'nwjs-ffmpeg-codecs-bin')
makedepends=('yarn' 'npm' 'git')
source=("git+https://github.com/betaflight/${_reponame}.git#commit=84f8abd7463e65773921635b57c7ac8fd4104ce9"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('SKIP'
            '95635caffae7a586612f10abbc8248764ddde4f7192d8ed65d7a3c1e2e689c1d'
            'bc9ba2824d722c0872d952ffe30b6fc88583eacd97e2c614a28e2847668a4554')
options=(!strip)

build() {
	cd "$_reponame"
	yarn install
	./node_modules/.bin/gulp dist --linux64
}

package() {
	cd "$_reponame"
        install -d "$pkgdir/usr/share/$pkgname/"
	cp -r dist/* "$pkgdir/usr/share/$pkgname/"
	install -D "assets/linux/icon/bf_icon_128.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -D "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	
        install -d "$pkgdir/usr/bin/"
	install -Dm 755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
