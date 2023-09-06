appname=amethyst
pkgname=$appname-player-git
pkgver=cc28d6ace13364c5fd73eef6769ddeb47e1ded37
pkgrel=3
pkgdesc="Audio Player"
arch=('x86_64' 'aarch64')
url="https://github.com/Geoxor/$appname"
license=('MIT')
makedepends=('gcc-multilib' 'git' 'gendesk' 'yarn' 'libxcrypt-compat')
source=("git+https://github.com/Geoxor/$appname/")
md5sums=('SKIP')

prepare(){
	cd "$appname"
	git checkout $pkgver
	gendesk -n -f --pkgname "$appname" --pkgdesc "$pkgdesc" --exec="/opt/$appname/$appname"
	git submodule update --init --recursive
	yarn
}

build() {
	cd "$appname"
	yarn build && yarn electron-builder --linux dir --publish never
}

package() {
	cd "$appname"
	install -Dm644 "$appname.desktop" "$pkgdir/usr/share/applications/$appname.desktop"
	install -d "$pkgdir/opt/$appname" && cp -r release/build/linux-unpacked/* "$pkgdir/opt/$appname"
	install -Dm644 assets/icon.svg "$pkgdir/usr/share/pixmaps/$appname.svg"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$appname"
}
