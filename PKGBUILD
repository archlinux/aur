# Maintainer: Marie Piontek <marie@kaifa.ch>
pkgname=an-anime-game-launcher
pkgver=210.8dca0bc
pkgrel=1
pkgdesc="An Launcher for a specific anime game written in Electron with auto-patching and playtime tracking function"
arch=("x86_64")
license=("GPL3")
depends=("electron")
makedepends=("git" "npm")
provides=("${pkgname}")
source=(
"git+https://notabug.org/nobody/an-anime-game-launcher.git"
"an-anime-game-launcher.desktop"
"an-anime-game-launcher.sh"
)
md5sums=(
'SKIP'
'SKIP'
'SKIP'
)

pkgver() {
    cd "$srcdir/an-anime-game-launcher"
    echo "$(git rev-list HEAD --count).$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/an-anime-game-launcher"

    electronDist=/usr/lib/electron
    electronVer=$(electron --version | tail -c +2)

    sed -i '/        "electron": /d' ./package.json
    HOME="$srcdir/.electron-gyp" npm install --cache "${srcdir}/npm-cache"
    npm run dev

    ./node_modules/.bin/electron-builder -l dir -c.electronDist=$electronDist -c.electronVersion=$electronVer
}

package() {
	cd "$srcdir/an-anime-game-launcher"

    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    cp -dr --no-preserve=ownership dist/linux-unpacked/resources/* "${pkgdir}/usr/lib/${pkgname}/"

    install -Dm644 public/images/icons/256x256.png "$pkgdir/usr/share/pixmaps/${pkgname}.png"

    install -dm755 "${pkgdir}/usr/bin" "an-anime-game-launcher"

    install -Dm755 "$srcdir/an-anime-game-launcher.sh" "$pkgdir/usr/bin/${pkgname}"
    install -Dm644 "$srcdir/an-anime-game-launcher.desktop" -t "$pkgdir/usr/share/applications"
}

