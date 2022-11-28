# Maintainer: Georgios Tsotsos <geoxor123@outlook.com>
appname=amethyst
pkgname=$appname-player
pkgver=1.8.15
pkgrel=0
pkgdesc="Audio Player"
arch=('x86_64')
url="https://github.com/Geoxor/$appname"
license=('MIT')
makedepends=('gcc-multilib' 'git' 'gendesk' 'yarn' 'libxcrypt-compat')
source=("git+https://github.com/Geoxor/$appname/#tag=v$pkgver")
md5sums=('SKIP')

logo() {
	echo "    ___                   __  __               __ "
	echo "   /   |  ____ ___  ___  / /_/ /_  __  _______/ /_"
	echo "  / /| | / __ \`__ \\/ _ \\/ __/ __ \\/ / / / ___/ __/"
	echo " / ___ |/ / / / / /  __/ /_/ / / / /_/ (__  ) /_  "
	echo "/_/  |_/_/ /_/ /_/\\___/\\__/_/ /_/\\__, /____/\\__/  "
	echo "                                /____/"
}

prepare(){
	logo
	cd "$appname"
	gendesk -n -f --pkgname "$appname" --pkgdesc "$pkgdesc" --exec="/opt/$appname/$appname"
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