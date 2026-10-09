# Maintainer: Chapman <touch65536@gmail.com>

pkgname=eusoft-frhelper
pkgver=13.5.2
pkgrel=1
pkgdesc="Frhelper (法语助手) - French dictionary software for Linux (Community Repackage)"
arch=('x86_64')
url="https://www.eudic.net/v4/fr/app/frhelper"
license=('LicenseRef-Proprietary')
provides=('frhelper' 'eudic-fr' 'eusoft-frhelper')
conflicts=('frhelper')
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
    "frhelper.sh"
    "eusoft-frhelper.desktop"
    "LICENSE"
)
source_x86_64=(
    "${pkgname}-${pkgver}.deb::https://static.eudic.net/pkg/frhelper.deb"
)
noextract=("${pkgname}-${pkgver}.deb")

sha256sums=(
    '257c950831da8c32d5fdd843e08ca3b7b74e4867e63d58ce0ab143ddf11e9e14'
    '3f2fd84ce1916c9d69fe5415ee335f366cf7fd54d77689bae17374373b1c517d'
    '377ddd4aecf677aa2b0fdd264f6285118f3e01f6463eb957db972d0b8404cf69'
)
sha256sums_x86_64=(
    'ce5fcba8f0a2ffd0bff6b62e63f658883e795577caca130698de799a8647530c'
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
    install -Dm755 "${srcdir}/frhelper.sh" "${pkgdir}/usr/bin/frhelper"
    ln -sf frhelper "${pkgdir}/usr/bin/${pkgname}"

    # Install desktop entry
    install -Dm644 "${srcdir}/eusoft-frhelper.desktop" "${pkgdir}/usr/share/applications/eusoft-frhelper.desktop"
    ln -sf eusoft-frhelper.desktop "${pkgdir}/usr/share/applications/frhelper.desktop"

    # Install hicolor icons
    install -Dm644 "${pkgdir}/usr/share/pixmaps/com.eusoft.frhelper.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/com.eusoft.frhelper.png"
    ln -sf com.eusoft.frhelper.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/frhelper.png"
    ln -sf com.eusoft.frhelper.png "${pkgdir}/usr/share/pixmaps/frhelper.png"

    # Install license
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Normalize directory and file permissions
    find "${pkgdir}" -type d -exec chmod 755 {} +
    chmod 755 "${pkgdir}/usr/share/${pkgname}/frhelper"
}
