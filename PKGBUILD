# Maintainer: Chapman <touch65536@gmail.com>

pkgname=eusoft-ting-de
pkgver=26.9.0
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
    "${pkgname}-${pkgver}.deb::https://static.eudic.net/pkg/ting_de/ting_de.deb"
)
noextract=("${pkgname}-${pkgver}.deb")

sha256sums=(
    '4786630c0b65924a45fb7d5aebdcb6bf90dedd9f28a5f53aaa063123fb75c684'
    '4d809e11be94f592c45a858ca95340d39388826b8a0c0820e504688dc3220908'
    'cf9ba50ac9a100c03be7e11953e99443a5e8d26ed2f4453ecc454113778b668c'
)
sha256sums_x86_64=(
    '46ff02b3bd5d08289ce230530d2000f2b1b4a876328900d623ffca94f810b2bb'
)

prepare() {
    bsdtar -xf "${pkgname}-${pkgver}.deb" data.tar.xz
}

package() {
    # Extract opt and usr hierarchies from official deb data
    tar -xf data.tar.xz -C "${pkgdir}"

    # Install clean launcher script
    install -Dm755 "${srcdir}/ting-de.sh" "${pkgdir}/usr/bin/ting-de"
    ln -sf ting-de "${pkgdir}/usr/bin/${pkgname}"

    # Install desktop entry
    install -Dm644 "${srcdir}/eusoft-ting-de.desktop" "${pkgdir}/usr/share/applications/eusoft-ting-de.desktop"
    ln -sf eusoft-ting-de.desktop "${pkgdir}/usr/share/applications/ting_de.desktop"

    # Install license
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Ensure executable permissions for electron binary
    chmod 755 "${pkgdir}/opt/每日德语听力/ting_de"

    # Normalize directory permissions
    find "${pkgdir}" -type d -exec chmod 755 {} +
}
