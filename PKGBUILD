# Maintainer: Chapman <touch65536@gmail.com>

pkgname=eusoft-dehelper
pkgver=13.5.2
pkgrel=1
pkgdesc="Dehelper (德语助手) - German dictionary software for Linux (Community Repackage)"
arch=('x86_64')
url="https://www.eudic.net/v4/de/app/dehelper"
license=('LicenseRef-Proprietary')
provides=('dehelper' 'eudic-de' 'eusoft-dehelper')
conflicts=('dehelper')
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
    "dehelper.sh"
    "eusoft-dehelper.desktop"
    "LICENSE"
)
source_x86_64=(
    "${pkgname}-${pkgver}.deb::https://static.eudic.net/pkg/dehelper.deb"
)
noextract=("${pkgname}-${pkgver}.deb")

sha256sums=(
    'f3f7d40617f96c3a20196d9a8b18b95df316cd15eee3006537e272d695a96875'
    '54ab59de3dc984a39143e8c2a4116d26af936121c6912e315e9b0d8a10e1f3ea'
    '377ddd4aecf677aa2b0fdd264f6285118f3e01f6463eb957db972d0b8404cf69'
)
sha256sums_x86_64=(
    'fc47e56b3907522a8d3dbd906a4e4117991e0aed772c08547b0214c8b08fcccc'
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
    install -Dm755 "${srcdir}/dehelper.sh" "${pkgdir}/usr/bin/dehelper"
    ln -sf dehelper "${pkgdir}/usr/bin/${pkgname}"

    # Install desktop entry
    install -Dm644 "${srcdir}/eusoft-dehelper.desktop" "${pkgdir}/usr/share/applications/eusoft-dehelper.desktop"
    ln -sf eusoft-dehelper.desktop "${pkgdir}/usr/share/applications/dehelper.desktop"

    # Install hicolor icons
    install -Dm644 "${pkgdir}/usr/share/pixmaps/com.eusoft.dehelper.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/com.eusoft.dehelper.png"
    ln -sf com.eusoft.dehelper.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/dehelper.png"
    ln -sf com.eusoft.dehelper.png "${pkgdir}/usr/share/pixmaps/dehelper.png"

    # Install license
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Normalize directory and file permissions
    find "${pkgdir}" -type d -exec chmod 755 {} +
    chmod 755 "${pkgdir}/usr/share/${pkgname}/dehelper"
}
