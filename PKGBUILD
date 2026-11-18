# Maintainer: Chapman <touch65536@gmail.com>

pkgname=eusoft-ting-de
pkgver=26.10.1
pkgrel=1
pkgdesc="Daily German Listening (每日德语听力) for Linux (Community Repackage)"
arch=('x86_64')
url="https://www.eudic.net/v4/de/app/ting"
license=('LicenseRef-Proprietary')
provides=('ting-de' 'eusoft-ting-de')
conflicts=('ting-de')
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
    "ting-de.sh"
    "eusoft-ting-de.desktop"
    "LICENSE"
)
source_x86_64=(
    "${pkgname}-${pkgver}.deb::https://static-asia.frdic.com/pkg/ting_de/ting_de.deb"
)
noextract=("${pkgname}-${pkgver}.deb")

sha256sums=(
    '4786630c0b65924a45fb7d5aebdcb6bf90dedd9f28a5f53aaa063123fb75c684'
    '4d809e11be94f592c45a858ca95340d39388826b8a0c0820e504688dc3220908'
    'cf9ba50ac9a100c03be7e11953e99443a5e8d26ed2f4453ecc454113778b668c'
)
sha256sums_x86_64=(
    '35344e422918ec504ac320f1d611e52df95cfe718ace191f06dc04d18dcd08e7'
)

prepare() {
    rm -f data.tar.*
    bsdtar -xf "${pkgname}-${pkgver}.deb" 'data.tar.*'
}

package() {
    # Extract opt and usr hierarchies from official deb data
    bsdtar -xf data.tar.* -C "${pkgdir}"

    # Install clean launcher script
    install -Dm755 "${srcdir}/ting-de.sh" "${pkgdir}/usr/bin/ting-de"
    ln -sf ting-de "${pkgdir}/usr/bin/${pkgname}"

    # Install desktop entry
    install -Dm644 "${srcdir}/eusoft-ting-de.desktop" "${pkgdir}/usr/share/applications/eusoft-ting-de.desktop"

    # Install license
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Ensure executable permissions for electron binary
    chmod 755 "${pkgdir}/opt/每日德语听力/ting_de"

    # Normalize directory permissions
    find "${pkgdir}" -type d -exec chmod 755 {} +
}
