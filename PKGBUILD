# Maintainer: devome <evinedeng@hotmail.com>

pkgname=mdcz
pkgver=0.9.1
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
sha256sums=('94f9935d56be114653e2fc566356b41ecb527e044f3a4ddc40c3f015bdd0e89c'
            'cd05629c20de4406029004536b25694cf4b2e27997695d6aa2b8942258d43683'
            'bd506812280590fa11c51feeb3e5286ed4dcd6603f1bd796f8cd567a7dfded16')

prepare() {
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export ELECTRON_OVERRIDE_DIST_PATH="/usr/lib/electron"

    cd "${pkgname}-${pkgver}"
    grep -rl 'process.resourcesPath' . | xargs -I {} sed -i "s|process.resourcesPath|'/usr/lib/${pkgname}'|g" {}
    local _elver=$(cat /usr/lib/electron/version)
    echo -n Replacing $(cat package.json | grep '"electron":')
    npm pkg set devDependencies.electron=${_elver}
    echo with $(cat package.json | grep '"electron":')
    pnpm install
    find node_modules -type f -name "*.map" -delete
}

build() {
    cd "${pkgname}-${pkgver}"
    pnpm run build
    pnpm exec electron-builder --linux dir --config electron-builder.yml --publish never
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
