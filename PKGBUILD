appname=amethyst
pkgname=$appname-player-git
pkgver=063b08bf68220f1705abf8643051ba6c1ca0e26b
pkgrel=1
pkgdesc="Audio Player"
arch=('x86_64' 'aarch64')
url="https://github.com/Geoxor/$appname"
license=('MIT')
makedepends=('gcc-multilib' 'git' 'gendesk' 'yarn' 'libxcrypt-compat')
source=("git+https://github.com/Geoxor/$appname/")
md5sums=('SKIP')

prepare(){
	cd "$appname"
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
