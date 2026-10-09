# Maintainer: Chapman <touch65536@gmail.com>

pkgname=eusoft-eshelper
pkgver=13.5.2
pkgrel=2
pkgdesc="Eshelper (西语助手) - Spanish dictionary software for Linux (Community Repackage)"
arch=('x86_64')
url="https://www.eudic.net/v4/es/app/eshelper"
license=('LicenseRef-Proprietary')
provides=('eshelper' 'eudic-es' 'eusoft-eshelper')
conflicts=('eshelper')
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
    "eshelper.sh"
    "eusoft-eshelper.desktop"
    "LICENSE"
)
source_x86_64=(
    "${pkgname}-${pkgver}.deb::https://static.eudic.net/pkg/eshelper.deb"
)
noextract=("${pkgname}-${pkgver}.deb")

sha256sums=(
    '066ec47a8580088b66d37912b35a84c84719d4fd9dc94134a689a93928308280'
    '91a47841b3b5572d6e8f3e3ff9dde1d36bc6ce6a3486578790117471cb2f83c7'
    'cf9ba50ac9a100c03be7e11953e99443a5e8d26ed2f4453ecc454113778b668c'
)
sha256sums_x86_64=(
    '59af3b48c1cda58220e303c479d8244257fb2d7c7be7d229b83f3e8dc23ee358'
)

prepare() {
    bsdtar -xf "${pkgname}-${pkgver}.deb" data.tar.xz
}

package() {
    # Extract data hierarchy from official deb
    tar -xf data.tar.xz -C "${pkgdir}"

    # Remove upstream obsolete Ubuntu system libraries dumped in root dir
    rm -f "${pkgdir}/usr/share/${pkgname}"/lib*.so* 2>/dev/null || true

    # Remove bundled outdated libxkbcommon-x11 to avoid segfault with Arch libxkbcommon
    rm -f "${pkgdir}/usr/share/${pkgname}/lib/libxkbcommon-x11.so.0" 2>/dev/null || true

    # Remove upstream AppRun (replaced by our launcher)
    rm -f "${pkgdir}/usr/share/${pkgname}/AppRun" 2>/dev/null || true

    # Clean up empty apprun-hooks from deb if present
    rm -rf "${pkgdir}/apprun-hooks" 2>/dev/null || true

    # Install clean launcher script
    install -Dm755 "${srcdir}/eshelper.sh" "${pkgdir}/usr/bin/eshelper"
    ln -sf eshelper "${pkgdir}/usr/bin/${pkgname}"

    # Install desktop entry
    install -Dm644 "${srcdir}/eusoft-eshelper.desktop" "${pkgdir}/usr/share/applications/eusoft-eshelper.desktop"

    # Install hicolor icons
    install -Dm644 "${pkgdir}/usr/share/pixmaps/com.eusoft.eshelper.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/com.eusoft.eshelper.png"
    ln -sf com.eusoft.eshelper.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/eshelper.png"
    ln -sf com.eusoft.eshelper.png "${pkgdir}/usr/share/pixmaps/eshelper.png"

    # Install license
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Normalize directory and file permissions
    find "${pkgdir}" -type d -exec chmod 755 {} +
    chmod 755 "${pkgdir}/usr/share/${pkgname}/eshelper"
}
