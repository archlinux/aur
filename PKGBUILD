# Maintainer: Chapman <touch65536@gmail.com>

pkgname=eusoft-eudic
pkgver=26.9.1
pkgrel=1
pkgdesc="Eudic (欧路词典) - English dictionary software for Linux (Community Repackage)"
arch=('x86_64')
url="https://www.eudic.net/v4/en/app/eudic"
license=('LicenseRef-Proprietary')
provides=('eudic' 'eusoft-eudic')
conflicts=('eudic')
depends=(
    'at-spi2-core'
    'gtk3'
    'hicolor-icon-theme'
    'libnotify'
    'libsecret'
    'libxkbcommon-x11'
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
    "eudic.sh"
    "eusoft-eudic.desktop"
    "LICENSE"
)
source_x86_64=(
    "${pkgname}-${pkgver}.deb::https://static.eudic.net/pkg/eudic.deb?v=${pkgver}"
)
noextract=("${pkgname}-${pkgver}.deb")

sha256sums=(
    '3e25eab799ce856d306afc89427cb3aed2a97b5671f90847d9dccb4c408e4bf4'
    'af51836b59312a8e52c41516ec2931303e76baf2c8f67a4e088b4f1d69c14fb3'
    '377ddd4aecf677aa2b0fdd264f6285118f3e01f6463eb957db972d0b8404cf69'
)
sha256sums_x86_64=(
    'dd1faab01940cbf8a019a6d813e2ef1f0b50df65ebacdc96939a4d9f0b4d2892'
)

prepare() {
    bsdtar -xf "${pkgname}-${pkgver}.deb" data.tar.zst
}

package() {
    # Extract data hierarchy from official deb
    bsdtar -xf data.tar.zst -C "${pkgdir}"

    # Remove upstream obsolete Ubuntu system libraries dumped in root dir
    rm -f "${pkgdir}/usr/share/${pkgname}"/lib*.so* 2>/dev/null || true

    # Remove bundled outdated libxkbcommon-x11 to avoid segfault with Arch libxkbcommon
    rm -f "${pkgdir}/usr/share/${pkgname}/lib/libxkbcommon-x11.so.0" 2>/dev/null || true

    # Remove upstream AppRun (replaced by our launcher)
    rm -f "${pkgdir}/usr/share/${pkgname}/AppRun" 2>/dev/null || true

    # Clean up empty apprun-hooks from deb if present
    rm -rf "${pkgdir}/apprun-hooks" 2>/dev/null || true

    # Install clean launcher script
    install -Dm755 "${srcdir}/eudic.sh" "${pkgdir}/usr/bin/eudic"
    ln -sf eudic "${pkgdir}/usr/bin/${pkgname}"

    # Install desktop entry
    install -Dm644 "${srcdir}/eusoft-eudic.desktop" "${pkgdir}/usr/share/applications/eusoft-eudic.desktop"
    ln -sf eusoft-eudic.desktop "${pkgdir}/usr/share/applications/eudic.desktop"

    # Install hicolor icons
    install -Dm644 "${pkgdir}/usr/share/pixmaps/com.eusoft.eudic.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/com.eusoft.eudic.png"
    ln -sf com.eusoft.eudic.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/eudic.png"
    ln -sf com.eusoft.eudic.png "${pkgdir}/usr/share/pixmaps/eudic.png"

    # Install license
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Normalize directory and file permissions
    find "${pkgdir}" -type d -exec chmod 755 {} +
    chmod 755 "${pkgdir}/usr/share/${pkgname}/eudic"
}
