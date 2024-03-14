# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=botgem-electron
pkgver=1.4.1.0
pkgrel=1
pkgdesc='Your Al-Powered Toolbox for Tomorrow'
arch=(x86_64)
url=https://botgem.com
license=(LicenseRef-UNLICENSED)
depends=(
	hicolor-icon-theme
	electron29
)
makedepends=(
	asar
	nodejs
	npm
)
install=.install

source=(
	"botgem-${pkgver}.appx::https://github.com/Pylogmon/botgem-package-archive/releases/download/${pkgver}/botgem-${pkgver}.appx"
	botgem
	botgem.desktop
)
sha256sums=('fef3ba66dc8c573aaeb01c323c55bebe0e65437b63968ed83e05dbea227d36ce'
            'a72f10d8e9b566a35934b3f66508acee75efa5f55ef0754c4d9e3757c450a899'
            '0ec4084e396a91623e88130ea19a104d05969d1d521b7d228898528b9e6c6942')

prepare() {
	asar e "$srcdir/app/resources/app.asar" "$srcdir/unpacked"
	cp "$srcdir/app/resources/assets/icon.png" "$srcdir/botgem.png"
    cd $srcdir/unpacked/dist
    npm install
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