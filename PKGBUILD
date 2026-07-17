# Maintainer: enotan <enotan@majou.xyz>

pkgname=kakera
pkgver=0.1.4
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

sha256sums=('cd2145fc65a06af5052f13cc4d68556cbb20bf7efb8778c8bfd9a251902dc2a9'
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
