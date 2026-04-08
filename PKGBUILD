# Maintainer: devome <evinedeng@hotmail.com>

pkgname=mdcz
pkgver=0.6.0
pkgrel=1
pkgdesc="An Electron-based tool for scraping and managing JAV movie metadata."
arch=('x86_64' 'aarch64')
url="https://github.com/ShotHeadman/${pkgname}"
license=("GPL-3.0-only")
depends=("electron39")
makedepends=("pnpm")
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.sh")
sha256sums=('fd7027664d41926653f47b55bdcab16840130c9f8c1157f03e8f6e6eb25a7823'
            'cd05629c20de4406029004536b25694cf4b2e27997695d6aa2b8942258d43683'
            'ba4b54d04de0bbdb9fb9a30b8b9321833c25966f5cfe637e43c05090661e447f')

build() {
    cd "${pkgname}-${pkgver}"
    pnpm install
    pnpm build:linux
}

package() {
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm755 "${pkgname}.sh"      "${pkgdir}/usr/bin/${pkgname}"

    cd "${pkgname}-${pkgver}"
    install -Dm644 "build/icon.png"     "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    cd "release/${pkgver}/linux-unpacked/resources"
    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    cp --parents -r -t "${pkgdir}/usr/lib/${pkgname}" app.asar*
}
