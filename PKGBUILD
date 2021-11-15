# Maintainer: Marie Piontek <marie@kaifa.ch>
pkgname=an-anime-game-launcher
pkgver=222.8463025
pkgrel=1
pkgdesc="An Launcher for a specific anime game written in Electron with auto-patching and playtime tracking function"
arch=("x86_64")
license=("GPL3")
depends=(
"electron"
"tar"
"unzip"
"wine"
"winetricks"
"git"
)
makedepends=("npm")
optdepends=(
"vkbasalt: Required to use custom shaders (install this and reshade-shaders-git)"
"reshade-shaders-git: Required by vkBasalt config files (install this and vkbasalt)"
"mangohud: Required if you want to check FPS"
)
provides=("${pkgname}")
source=(
"git+https://notabug.org/nobody/an-anime-game-launcher.git"
"an-anime-game-launcher.desktop"
"an-anime-game-launcher.sh"
)
md5sums=(
'SKIP'
'44b5730fe1a5cf22d7be6e3bf717ea0f'
'8b875e8115a3b80f9964dc66ddf46a9a'
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

