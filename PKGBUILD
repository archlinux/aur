# Maintainer: devome <evinedeng@hotmail.com>

_reponame=ChatLab
pkgname="${_reponame,,}"
pkgver=0.20.0
pkgrel=1
pkgdesc="Rediscover your social memories with local, AI-powered analysis"
arch=('x86_64' 'aarch64')
url="https://github.com/hellodigua/${_reponame}"
license=("GPL-3.0-only")
_electron="electron35"
depends=("bash" "curl" "${_electron}" "hicolor-icon-theme")
makedepends=("npm" "pnpm" "python")
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.sh")
sha256sums=('b2d306e957e9d5d8dd4b0a7f2f9fa055ad764441bd805ff2fb2db01c2607e5be'
            '349a64162923e2fcea32cde43af8e5da44d864b31e3050f3c4031c75744e60b0'
            'fb6c27bd33a4ffaabdec337528a097db6b623d7d0b3f94ebf79144574244bb94')

prepare() {
    sed -i "s|_ELECTRON_VERSION_|$_electron|" "${pkgname}.sh"

    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export ELECTRON_OVERRIDE_DIST_PATH="/usr/lib/$_electron"

    cd "${_reponame}-${pkgver}"
    NODE_ENV="development" pnpm install
    find node_modules -type f -name "*.js.map" -o -name "*.css.map" -delete
}

build() {
    cd "${_reponame}-${pkgver}/apps/desktop"
    pnpm run build
    pnpm exec electron-builder --linux dir --config electron-builder.yml --publish never
    rm -rf "dist/linux-unpacked/resources/app-update.yml"
}

package() {
    install -Dm644 "${pkgname}.desktop"   "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm755 "${pkgname}.sh"        "${pkgdir}/usr/bin/${pkgname}-desktop"

    cd "${_reponame}-${pkgver}"
    install -Dm644 "README.md"            "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    cd apps/desktop
    install -Dm644 "build/icon.png"       "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -dm755                        "${pkgdir}/usr/lib"
    cp -r "dist/linux-unpacked/resources" "${pkgdir}/usr/lib/${pkgname}"

    cd ../../docs
    find . -type f -name "*.md" -exec install -Dm644 {} "${pkgdir}/usr/share/doc/${pkgname}/{}" \;
}
