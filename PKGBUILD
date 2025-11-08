# SPDX-License-Identifier: 0BSD
# Maintainer: Luni <luni@luni.info>

pkgname=bolt-launcher-bin
_pkgname=bolt-launcher
pkgver=0.20.4
pkgrel=2
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
    "Bolt-Linux-${pkgver}.zip::https://github.com/Adamcake/Bolt/releases/download/${pkgver}/Bolt-Linux.zip"
    "Bolt-src-${pkgver}.tar.gz::https://github.com/Adamcake/Bolt/archive/refs/tags/${pkgver}.tar.gz"
    "bolt-launcher.sh"
    "bolt-launcher.desktop"
)
sha256sums=('0dc06306b21327605286fa64236e0c2c328ad5e6a83e15575750f5a3badd4d1b'
            '73c3cd6ab6fd99a89d27997b0280f9db6ac4dbcbea8e3a237bb3eb5ea6d37329'
            'bfa5b995dbde008139b470f6a242f14df0ad0bdece794df2af2a8f4fd74377f3'
            '6c56b53dd02cdbea3fc59ffdca60c1268b882b9b9ab84a66e540c171483fc079')

package() {
    install -d "${pkgdir}/opt/${_pkgname}"
    bsdtar -x --no-same-owner -f "${srcdir}/Bolt-Linux-${pkgver}.zip" -C "${pkgdir}/opt/${_pkgname}" --strip-components=1
    chmod +x "${pkgdir}/opt/${_pkgname}/bolt"

    bsdtar -x -f "${srcdir}/Bolt-src-${pkgver}.tar.gz" -C "${srcdir}"
    for size in 16 32 64 128 256; do
        install -Dm644 "${srcdir}/Bolt-${pkgver}/icon/${size}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/Bolt-${pkgver}/icon/bolt.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
    install -Dm644 "${srcdir}/Bolt-${pkgver}/LICENCE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    install -Dm755 "${srcdir}/bolt-launcher.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/bolt-launcher.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}