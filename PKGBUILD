# SPDX-License-Identifier: 0BSD
# Maintainer: Luni <luni@luni.info>

pkgname=bolt-launcher-bin
_pkgname=bolt-launcher
pkgver=0.20.6
pkgrel=1
pkgdesc="Free open-source third-party implementation of the Jagex Launcher"
arch=('x86_64')
url="https://bolt.adamcake.com/"
license=('AGPL-3.0-or-later')
provides=("bolt-launcher=$pkgver")
conflicts=("bolt-launcher")
options=(!debug)
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gcc-libs' 'gdk-pixbuf2'
         'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme' 'libarchive' 'libdrm' 'libx11' 'libxcb'
         'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'mesa'
         'nspr' 'nss' 'pango')
optdepends=('jre17-openjdk: runelite/hdos' 'gtk2: rs3' 'openssl-1.1: rs3' 'umu-launcher: osrs official client')
source=(
    "Bolt-Linux-${pkgver}.zip::https://codeberg.org/Adamcake/Bolt/releases/download/0.20.6/Bolt-Linux.zip"
    "Bolt-src-${pkgver}.tar.gz::https://codeberg.org/Adamcake/Bolt/archive/0.20.6.tar.gz"
    "bolt-launcher.sh"
    "bolt-launcher.desktop"
)
sha256sums=('f5a6c709290d73fb306858ac0526fb00afb02c804f1d92159dbd8459cd3318eb'
            'fe5a7aba2d50a4943e6da940b8612b2a1bdce32435ea6cd842ffbe8f2744a10c'
            'bfa5b995dbde008139b470f6a242f14df0ad0bdece794df2af2a8f4fd74377f3'
            '6c56b53dd02cdbea3fc59ffdca60c1268b882b9b9ab84a66e540c171483fc079')

package() {
    install -d "${pkgdir}/opt/${_pkgname}"
    bsdtar -x --no-same-owner -f "${srcdir}/Bolt-Linux-${pkgver}.zip" -C "${pkgdir}/opt/${_pkgname}" --strip-components=1
    chmod +x "${pkgdir}/opt/${_pkgname}/bolt"

    bsdtar -x -f "${srcdir}/Bolt-src-${pkgver}.tar.gz" -C "${srcdir}"
    for size in 16 32 64 128 256; do
        install -Dm644 "${srcdir}/bolt/icon/${size}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/bolt/icon/bolt.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
    install -Dm644 "${srcdir}/bolt/LICENCE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    install -Dm755 "${srcdir}/bolt-launcher.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/bolt-launcher.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}