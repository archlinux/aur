# Maintainer: Marie Piontek <marie@kaifa.ch>

pkgname=an-anime-game-launcher
pkgver=1.8.0
pkgrel=2
pkgdesc="An Launcher for a specific anime game written in Electron with auto-patching and playtime tracking function"
url="https://gitlab.com/KRypt0n_/an-anime-game-launcher"
arch=("x86_64")
license=("GPL3")

depends=(
    "electron"
    "tar"
    "unzip"
    "xdelta3"
    "cabextract"
    "git"
)

makedepends=(
    "nodejs-lts-gallium"
    "npm"
)

optdepends=(
    "mangohud: FPS Hud/GUI"
    "gamemode: Game Optimizations"
    "switcheroo-control: Hybrid GPU Support"
    "vkbasalt: Required to use custom shaders (install this and reshade-shaders-git)"
    "reshade-shaders-git: Required by vkBasalt config files (install this and vkbasalt)"
)

source=(
    "git+${url}.git#tag=${pkgver}"
    "an-anime-game-launcher.desktop"
    "an-anime-game-launcher.sh"
)

md5sums=(
    'SKIP'
    '44b5730fe1a5cf22d7be6e3bf717ea0f'
    '8b875e8115a3b80f9964dc66ddf46a9a'
)

prepare () {
    electronDist=/usr/lib/electron
    electronVer=$(electron --version | tail -c +2)

    sed -i '/"electron": /d' "${pkgname}/package.json"
}

build() {
    cd "${pkgname}"
    HOME="${srcdir}/.electron-gyp" npm install --cache "${srcdir}/npm-cache"
    npm run dev
    ./node_modules/.bin/electron-builder -l dir \
        -c.electronDist=${electronDist} \
        -c.electronVersion=${electronVer}
}

package() {
    cd "${pkgname}"
    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    cp -dr --no-preserve=ownership dist/linux-unpacked/resources/* "${pkgdir}/usr/lib/${pkgname}/"

    install -Dm644 public/images/icons/256x256.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm755 "${srcdir}/an-anime-game-launcher.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/an-anime-game-launcher.desktop" -t "${pkgdir}/usr/share/applications"
}

