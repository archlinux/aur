# Maintainer: Chapman <touch65536@gmail.com>

pkgname=eusoft-ting-es
pkgver=26.6.2
pkgrel=2
pkgdesc="Daily Spanish Listening (每日西语听力) for Linux (Community Repackage)"
arch=('x86_64')
url="https://www.eudic.net/v4/es/app/ting"
license=('LicenseRef-Proprietary')
provides=('ting-es' 'eusoft-ting-es')
conflicts=('ting-es')
depends=(
    'alsa-lib'
    'at-spi2-core'
    'gtk3'
    'hicolor-icon-theme'
    'libnotify'
    'libsecret'
    'libxss'
    'libxtst'
    'nss'
    'util-linux-libs'
    'xdg-utils'
)
optdepends=(
    'noto-fonts-cjk: Chinese font support'
)
options=(!strip !debug)

source=(
    "ting-es.sh"
    "eusoft-ting-es.desktop"
    "LICENSE"
)
source_x86_64=(
    "${pkgname}-${pkgver}.deb::https://static.eudic.net/pkg/ting_es/ting_es.deb"
)
noextract=("${pkgname}-${pkgver}.deb")

sha256sums=(
    '480e44a9481a8f553c27e1ccfbf60457871515c5a8fcd1b778378ef8796457c4'
    'aae129f7a07cceaedc8a7d6c4527b54a27a3b2f0aa3961a540a4d44b2a04f4a0'
    'cf9ba50ac9a100c03be7e11953e99443a5e8d26ed2f4453ecc454113778b668c'
)
sha256sums_x86_64=(
    'f60b760b359f1593aa3b143943af951003f5b042167af7b2fb3249aa5f4a7377'
)

prepare() {
    bsdtar -xf "${pkgname}-${pkgver}.deb" data.tar.xz
}

package() {
    # Extract opt and usr hierarchies from official deb data
    tar -xf data.tar.xz -C "${pkgdir}"

    # Install clean launcher script
    install -Dm755 "${srcdir}/ting-es.sh" "${pkgdir}/usr/bin/ting-es"
    ln -sf ting-es "${pkgdir}/usr/bin/${pkgname}"

    # Install desktop entry
    install -Dm644 "${srcdir}/eusoft-ting-es.desktop" "${pkgdir}/usr/share/applications/eusoft-ting-es.desktop"

    # Install license
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Ensure executable permissions for electron binary
    chmod 755 "${pkgdir}/opt/每日西语听力/ting_es"

    # Normalize directory permissions
    find "${pkgdir}" -type d -exec chmod 755 {} +
}
