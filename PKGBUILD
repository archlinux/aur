# Maintainer: taotieren <admin@taotieren.com>

_pkgname=Mark-Mind
_gitpkgname=Mark.Mind
pkgname=mark-mind
pkgver=1.2.9
pkgrel=1
pkgdesc="Mark Mind — Next generation mind map editor"
arch=('any')
url="https://github.com/MarkMindLtd/Mark-Mind"
license=('MIT')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=(${pkgname})
depends=('electron9')
makedepends=('coreutils')
backup=()
options=('!strip')
source=("${_pkgname}-${pkgver}.AppImage::https://github.com/MarkMindLtd/${_pkgname}/releases/download/v${pkgver//_/-}/${_gitpkgname}-${pkgver}.AppImage"
    "io.github.markmindltd.mark_mind.desktop"
    "io.github.markmindltd.mark_mind.metainfo.xml")
sha256sums=('643134298b54b7e7433415f1f4924a1aa07700f3abe822cc07a479075132d7d4'
            'bc8c6db34688ad87879871a9ea28c088a1f44fcdfb7f4e4aef52a425283dde9f'
            'c0050afe68a3c62cc8f15508b1209a41eae4cbd7e358a0bf0ae20bc37178f35f')

prepare() {
    chmod u+x "${srcdir}/${_pkgname}-${pkgver}.AppImage"

    "${srcdir}/${_pkgname}-${pkgver}.AppImage" --appimage-extract
}

package() {
#     find ${srcdir}/squashfs-root/locales/ -type d -exec chmod 755 {} +
     find ${srcdir}/squashfs-root/resources/ -type d -exec chmod 755 {} +

    install -Dm 0755 "${srcdir}/squashfs-root/resources/app.asar"  "${pkgdir}/opt/${pkgname}/${pkgname}.asar"
    cp -r "${srcdir}/squashfs-root/resources/app.asar.unpacked"  "${pkgdir}/opt/${pkgname}"

    install -Dm 0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" << EOF
#!/usr/bin/env bash
electron9 /opt/${pkgname}/${pkgname}.asar
EOF

    find "${srcdir}/squashfs-root/usr/share/icons/" -type d -exec chmod 755 {} +
    install -dm 0755 "${pkgdir}/usr/share/icons"
    cp -r "${srcdir}/squashfs-root/usr/share/icons/hicolor" "${pkgdir}/usr/share/icons/hicolor"

    install -Dm 0644 "${srcdir}/io.github.markmindltd.mark_mind.desktop" "${pkgdir}/usr/share/applications/io.github.markmindltd.mark_mind.desktop"
    install -Dm 0644 "${srcdir}/io.github.markmindltd.mark_mind.metainfo.xml" "${pkgdir}/usr/share/metainfo/io.github.markmindltd.mark_mind.metainfo.xml"
}
