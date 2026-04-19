# Maintainer: devome <evinedeng@hotmail.com>

pkgname=mdcz
pkgver=0.8.0
pkgrel=1
pkgdesc="Media metadata scraper built on Electron"
arch=('x86_64' 'aarch64')
url="https://github.com/ShotHeadman/${pkgname}"
license=("GPL-3.0-only")
depends=("bash" "electron" "hicolor-icon-theme")
makedepends=("npm" "pnpm")
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.sh")
sha256sums=('79e87a723383cd063953b1ca0d75a3908f5f70b6a3881177cd55e49c43ebb7d3'
            'cd05629c20de4406029004536b25694cf4b2e27997695d6aa2b8942258d43683'
            'a1818ad81d8ca68b369e1b392ea35c87822d15da7347b031f91b477af4a557a1')

prepare() {
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export ELECTRON_OVERRIDE_DIST_PATH="/usr/lib/electron"

    cd "${pkgname}-${pkgver}"
    sed -i 's|- AppImage|- dir|g' electron-builder.yml
    local _elver=$(cat /usr/lib/electron/version)
    echo -n Replacing $(cat package.json | grep '"electron":')
    npm pkg set devDependencies.electron=${_elver}
    echo with $(cat package.json | grep '"electron":')

    pnpm install --ignore-scripts --no-frozen-lockfile
}

build() {
    cd "${pkgname}-${pkgver}"
    pnpm install
    pnpm build:linux
    rm -rf "release/${pkgver}/linux-unpacked/resources/app-update.yml"
}

package() {
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm755 "${pkgname}.sh"      "${pkgdir}/usr/bin/${pkgname}"

    cd "${pkgname}-${pkgver}"
    install -Dm644 "build/icon.png"     "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -dm755 "${pkgdir}/usr/lib"
    cp -r "release/${pkgver}/linux-unpacked/resources" "${pkgdir}/usr/lib/${pkgname}"
}
