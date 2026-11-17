# Maintainer: TurboRigby from Rigby Foundation <levdmytriev@gmail.com>
# SPDX-License-Identifier: MPL-2.0

pkgname=kage-bin
pkgver=3.0.0
pkgrel=1
pkgdesc='VPN and proxy client powered by Xray (binary release)'
arch=('x86_64')
url='https://github.com/Rigby-Foundation/Kage'
license=('MPL-2.0')
depends=('glib2' 'glibc' 'gtk4' 'librsvg' 'libsoup3' 'libx11' 'polkit' 'systemd' 'webkitgtk-6.0')
provides=("kage=${pkgver}")
conflicts=('kage' 'nuggetvpn-bin')
options=('!strip' '!debug')

_release="Kage-v${pkgver}-linux-amd64.deb"
_icon="kage-icon-v${pkgver}.svg"
source=("${_icon}::https://raw.githubusercontent.com/Rigby-Foundation/Kage/v${pkgver}/build/appicon.svg"
        'kage.desktop'
        'LICENSE')
source_x86_64=("${url}/releases/download/v${pkgver}/${_release}")
noextract=("${_release}")
sha256sums=('18d1d37f7e6426bd742c9ae47b4e768048e7190c7ce61472cf68863b685f5362'
            'e57f3bb2a2f9b3c3eade34260dfed3d6f5c2298ed4950a6fec9af03de2b29692'
            '3f3d9e0024b1921b067d6f7f88deb4a60cbe7a78e76c64e3f1d7fc3b779b9d04')
sha256sums_x86_64=('9362832c462eb2315b4fc2e884ea67e48b85eb16e72e21cc78cda00c27a9d5d2')

package() {
    install -d "${pkgdir}/usr/bin" \
        "${pkgdir}/usr/share/applications" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps" \
        "${pkgdir}/usr/share/licenses/${pkgname}" || return 1

    # The upstream deb only ships the executable. Extract just that payload.
    (
        set -o pipefail
        bsdtar -xOf "${srcdir}/${_release}" 'data.tar*' |
            bsdtar -xOf - ./usr/bin/Kage
    ) > "${pkgdir}/usr/bin/kage" || return 1
    chmod 755 "${pkgdir}/usr/bin/kage" || return 1

    install -m644 "${srcdir}/kage.desktop" "${pkgdir}/usr/share/applications/kage.desktop" || return 1
    install -m644 "${srcdir}/${_icon}" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/kage.svg" || return 1
    install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
