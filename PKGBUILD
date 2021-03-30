# Maintainer: taotieren <admin@taotieren.com>

_pkgname=Mark-Mind
_gitpkgname=Mark.Mind
_oldpkgname=mind
pkgname=mark-mind
pkgver=1.2.0
pkgrel=1
pkgdesc="Mark Mind — Next generation mind map editor"
arch=('any')
url="https://github.com/MarkMindLtd/Mark-Mind"
license=('MIT')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=(${pkgname})
depends=()
makedepends=('coreutils')
backup=()
options=('!strip')
source=("${_pkgname}-${pkgver}.AppImage::https://github.com/MarkMindLtd/${_pkgname}/releases/download/v${pkgver//_/-}/${_gitpkgname}-${pkgver}.AppImage"
    "io.github.markmindltd.mark_mind.desktop"
    "io.github.markmindltd.mark_mind.metainfo.xml")
sha256sums=('bad6e300c8eec056df1682a42e4f37c7b2c7053ee5e9ce8e76635599ed631f05'
            'bc8c6db34688ad87879871a9ea28c088a1f44fcdfb7f4e4aef52a425283dde9f'
            'c0050afe68a3c62cc8f15508b1209a41eae4cbd7e358a0bf0ae20bc37178f35f')

prepare() {
    chmod u+x ${srcdir}/${_pkgname}-${pkgver}.AppImage

    ${srcdir}/${_pkgname}-${pkgver}.AppImage --appimage-extract
}

package() {
    find ${srcdir}/squashfs-root/locales/ -type d -exec chmod 755 {} +
    find ${srcdir}/squashfs-root/resources/ -type d -exec chmod 755 {} +

    install -d ${pkgdir}/opt/${pkgname}
    cp -r ${srcdir}/squashfs-root/* ${pkgdir}/opt/${pkgname}

    # remove broken or unused files and directories
    rm -r ${pkgdir}/opt/${pkgname}/usr/
    rm ${pkgdir}/opt/${pkgname}/AppRun
    rm ${pkgdir}/opt/${pkgname}/${_oldpkgname}.desktop
    rm ${pkgdir}/opt/${pkgname}/${_oldpkgname}.png

    find ${srcdir}/squashfs-root/usr/share/icons/ -type d -exec chmod 755 {} +

    install -d ${pkgdir}/usr/share/icons
    cp -r ${srcdir}/squashfs-root/usr/share/icons/hicolor ${pkgdir}/usr/share/icons/hicolor

    install -d ${pkgdir}/usr/bin
    ln -s ../../opt/${pkgname}/${_oldpkgname} ${pkgdir}/usr/bin/${pkgname}

    install -Dm644 "${srcdir}/io.github.markmindltd.mark_mind.desktop" "${pkgdir}/usr/share/applications/io.github.markmindltd.mark_mind.desktop"
    install -Dm644 "${srcdir}/io.github.markmindltd.mark_mind.metainfo.xml" "${pkgdir}/usr/share/metainfo/io.github.markmindltd.mark_mind.metainfo.xml"
}
