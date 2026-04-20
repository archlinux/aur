# Maintainer: devome <evinedeng@hotmail.com>

_reponame=ChatLab
pkgname="${_reponame,,}"
pkgver=0.17.5
pkgrel=1
pkgdesc="Rediscover your social memories with local, AI-powered analysis"
arch=('x86_64' 'aarch64')
url="https://github.com/hellodigua/${_reponame}"
license=("GPL-3.0-only")
depends=("bash" "curl" "electron" "hicolor-icon-theme")
makedepends=("npm" "pnpm")
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.sh")
sha256sums=('d5ffe8bb1f48f435f2791a208ee49af54e09dbe5969ec5b915e83fdcd6ef15be'
            '7623be40b49f98301c1b5685f4e911aff107cd20354433214266cd892abea4f5'
            'bbe4c7765ec70b967474e751b1700a4540c5746d032d89f437aadd09e3a33b6b')

prepare() {
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export ELECTRON_OVERRIDE_DIST_PATH="/usr/lib/electron"

    cd "${_reponame}-${pkgver}"
    local _elver=$(cat /usr/lib/electron/version)
    echo -n Replacing $(cat package.json | grep '"electron":')
    npm pkg set devDependencies.electron=${_elver}
    echo with $(cat package.json | grep '"electron":')

    pnpm install
}

build() {
    cd "${_reponame}-${pkgver}"
    pnpm run build
    pnpm exec electron-builder --linux dir --config electron-builder.yml --publish never
    rm -rf "dist/linux-unpacked/resources/app-update.yml"
}

package() {
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm755 "${pkgname}.sh"      "${pkgdir}/usr/bin/${pkgname}"

    cd "${_reponame}-${pkgver}"
    install -Dm644 "build/icon.png"     "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -dm755 "${pkgdir}/usr/lib"
    cp -r "dist/linux-unpacked/resources" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    cd docs
    find . -type f -name "*.md" -exec install -Dm644 {} "${pkgdir}/usr/share/doc/${pkgname}/{}" \;
}
