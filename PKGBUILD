# Maintainer: Jake <aur@ja-ke.tech>
pkgname=blackbox-explorer
_reponame=blackbox-log-viewer
pkgver=3.1.0
pkgrel=1
pkgdesc="Cleanflight and Betaflight Blackbox Explorer (NW.js build)"
arch=("x86_64")
url="https://github.com/betaflight/${_reponame}"
license=('GPL3')
makedepends=('yarn' 'git')
source=("git+https://github.com/betaflight/${_reponame}.git#commit=84f8abd7463e65773921635b57c7ac8fd4104ce9"
        "$pkgname.desktop")
sha256sums=('SKIP'
            '749c3e9ffe22f6248774e4fd40c3b94d1d05b3935e74a555ff4ca3ca67e6e937')
options=(!strip)

build() {
	cd "$_reponame"
	yarn install
	./node_modules/.bin/gulp apps --linux64
}

package() {
	cd "$_reponame"
	install -D "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -d "$pkgdir/opt/$pkgname/"
	cp -r apps/betaflight-$pkgname/linux64/* "$pkgdir/opt/$pkgname/"
	install -d "$pkgdir/usr/bin/"
	ln -s /opt/$pkgname/betaflight-$pkgname "$pkgdir/usr/bin/$pkgname"
}
