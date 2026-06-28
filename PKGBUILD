# Maintainer: devome <evinedeng@hotmail.com>

pkgbase=mdcz
pkgname=("${pkgbase}-desktop")
pkgver=0.10.0
pkgrel=1
pkgdesc="Media metadata scraper built on Electron"
arch=('x86_64' 'aarch64')
url="https://github.com/ShotHeadman/${pkgbase}"
license=("GPL-3.0-or-later")
_electron="electron39"
conflicts=("${pkgbase}")
replaces=("${pkgbase}")
depends=("bash" "$_electron" "hicolor-icon-theme")
makedepends=("pnpm")
install="${pkgbase}.install"
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgbase}.desktop"
        "${pkgbase}.sh")
sha256sums=('b6a1c9f14e39cf94621e0b0f1eb64ea7e4644bf7e4b7427741c9aeb40e4c39bc'
            '045c3410b0ecb1aa6eb4e1a9c5d72f70d49146135f7f631decbc40bbb0bbde40'
            'cbfd7e103b2cd99572348601e4e9d809d7dca993b1c7d664ddeeb7a24f84549a')

prepare() {
    sed -i "s|_ELECTRON_VERSION_|$_electron|" "${pkgbase}.sh"

    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export ELECTRON_OVERRIDE_DIST_PATH="/usr/lib/$_electron"

    cd "${pkgbase}-${pkgver}"
    grep -rl 'process.resourcesPath' apps/desktop | xargs -I {} sed -i "s|process.resourcesPath|'/usr/lib/${pkgbase}/desktop'|g" {}
    pnpm install
    find . -type f -name "*.map" -delete
}

build() {
    cd "${pkgbase}-${pkgver}/apps/desktop"
    pnpm build
    pnpm exec electron-builder --linux dir --config electron-builder.yml --publish never
    rm -rf "../../release/${pkgver}/linux-unpacked/resources/app-update.yml"
}

package_mdcz-desktop() {
    install -Dm644 "${pkgbase}.desktop" "${pkgdir}/usr/share/applications/${pkgbase}.desktop"
    install -Dm755 "${pkgbase}.sh"      "${pkgdir}/usr/bin/${pkgbase}"

    cd "${pkgbase}-${pkgver}"
    install -dm755 "${pkgdir}/usr/lib/${pkgbase}"
    cp -r "release/${pkgver}/linux-unpacked/resources" "${pkgdir}/usr/lib/${pkgbase}/desktop"

    cd apps/desktop
    install -Dm644 "build/icon.png"     "${pkgdir}/usr/share/pixmaps/${pkgbase}.png"
}
