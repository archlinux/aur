# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=botgem-electron
pkgver=1.5.1
pkgrel=1
pkgdesc='Your Al-Powered Toolbox for Tomorrow'
arch=(x86_64)
url=https://botgem.com
license=(LicenseRef-UNLICENSED)
depends=(
	electron29
)
makedepends=(
	asar
)
install=.install

source=(
	"botgem-${pkgver}.appx::https://github.com/gaodeng/ama-discussions/releases/download/v${pkgver}/BotGem.${pkgver}.appx"
	"sqlite3-x86_64.tar.gz::https://github.com/TryGhost/node-sqlite3/releases/download/v5.1.7/sqlite3-v5.1.7-napi-v6-linux-x64.tar.gz"
	botgem
	botgem.desktop
)

sha256sums=('2c2caaeac6642f2c4cecaccb6915cce3174a47431605c05fd565a6acf764409c'
			'6d1f7a95e5aca90db1fd6a2839380a021d5ee23d46f2d7c520ded094da813fed'
            'a72f10d8e9b566a35934b3f66508acee75efa5f55ef0754c4d9e3757c450a899'
            '0ec4084e396a91623e88130ea19a104d05969d1d521b7d228898528b9e6c6942')

prepare() {
	asar e "$srcdir/app/resources/app.asar" "$srcdir/unpacked"
	tar xpf "$srcdir/sqlite3-x86_64.tar.gz" -C "$srcdir"
	cp "$srcdir/app/resources/assets/icon.png" "$srcdir/botgem.png"
	cp "$srcdir/build/Release/node_sqlite3.node" "$srcdir/unpacked/node_modules/sqlite3/build/Release/node_sqlite3.node"
	sed -i -e 's/"win32"/"linux"/g
				s/h.loadURL/h.setMenuBarVisibility(false),h.webContent,h.loadURL/g' "$srcdir/unpacked/dist/main/main.js"
	sed -i -e 's/AMA/BotGem/g' "$srcdir/unpacked/dist/renderer/index.html"
}

package() {
	local usr="$pkgdir/usr"
	local share="$usr/share"
	local lib="$usr/lib/botgem"

	install -d "$lib"
	cp -a "$srcdir/unpacked/"{package.json,dist,node_modules} "$lib"
    cp -a "$srcdir/app/resources/assets" "$lib"
	install -Dm755 botgem -t "$usr/bin"
	install -Dm644 "$srcdir/botgem.desktop" -t "$share/applications"
	install -Dm644 "$srcdir/botgem.png" -t "$share/icons"
	find "$pkgdir" -type d -empty -delete
}