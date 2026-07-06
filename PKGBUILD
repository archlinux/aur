# Maintainer: enotan <enotan@majou.xyz>

pkgname=kakera
pkgver=0.1.3
pkgrel=1
pkgdesc="Visual novel library, launcher, and playtime tracker"
arch=('x86_64')
url="https://github.com/enotan/kakera"
license=('MIT')

options=('!lto')

depends=('webkit2gtk-4.1')
makedepends=('cargo' 'dioxus-cli')
optdepends=(
    'wine: launch Windows visual novels using Wine'
    'umu-launcher: launch visual novels using Proton'
    'discord: Discord Rich Presence support'
)

conflicts=('kakera-bin')

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/enotan/kakera/archive/refs/tags/v${pkgver}.tar.gz"
    "kakera.desktop"
)

sha256sums=('f44c674ece9d5fa29655a8b8dc16aee4dbce5bacec542f4f9904dc2251d4a663'
            'af1c27b344257bb058f9dcd85eb01438b72d1e8603b37b32207b6948f57494c1')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    dx build --release --locked
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 target/dx/kakera/release/linux/app/kakera \
        "${pkgdir}/usr/bin/kakera"

    install -d "${pkgdir}/usr/lib/kakera"
    cp -a target/dx/kakera/release/linux/app/assets \
        "${pkgdir}/usr/lib/kakera/assets"

    install -Dm644 "${srcdir}/kakera.desktop" \
        "${pkgdir}/usr/share/applications/kakera.desktop"

    install -Dm644 assets/favicon.png \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/kakera.png"

    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
