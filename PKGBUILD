# Maintainer: Chapman <touch65536@gmail.com>

pkgname=eusoft-ting-fr
pkgver=26.1.1
pkgrel=2
pkgdesc="Daily French Listening (每日法语听力) for Linux (Community Repackage)"
arch=('x86_64')
url="https://www.eudic.net/v4/fr/app/ting"
license=('LicenseRef-Proprietary')
provides=('ting-fr' 'eusoft-ting-fr')
conflicts=('ting-fr')
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
    "ting-fr.sh"
    "eusoft-ting-fr.desktop"
    "LICENSE"
)
source_x86_64=(
    "${pkgname}-${pkgver}.deb::https://static.eudic.net/pkg/ting_fr/ting_fr.deb"
)
noextract=("${pkgname}-${pkgver}.deb")

sha256sums=(
    'f3e4f0ff7014a872e87eacb593eabd41d22837ac93bae8e9b1baa007512fe01d'
    '81abe961b58303f1e374e4c491fc2450d13a39383e9f9d328a82a83fa690f2db'
    'cf9ba50ac9a100c03be7e11953e99443a5e8d26ed2f4453ecc454113778b668c'
)
sha256sums_x86_64=(
    '0bbe5b4b317a1f885440548328cd35845dea971fff9ab2aa6c631b5152ed3bb1'
)

prepare() {
    bsdtar -xf "${pkgname}-${pkgver}.deb" data.tar.xz
}

package() {
    # Extract opt and usr hierarchies from official deb data
    tar -xf data.tar.xz -C "${pkgdir}"

    # Install clean launcher script
    install -Dm755 "${srcdir}/ting-fr.sh" "${pkgdir}/usr/bin/ting-fr"
    ln -sf ting-fr "${pkgdir}/usr/bin/${pkgname}"

    # Install desktop entry
    install -Dm644 "${srcdir}/eusoft-ting-fr.desktop" "${pkgdir}/usr/share/applications/eusoft-ting-fr.desktop"

    # Install license
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Ensure executable permissions for electron binary
    chmod 755 "${pkgdir}/opt/每日法语听力/ting_fr"

    # Normalize directory permissions
    find "${pkgdir}" -type d -exec chmod 755 {} +
}
