# Maintainer: taotieren <admin@taotieren.com>

_pkgname=Mark-Mind
_gitpkgname=Mark.Mind
pkgbase=mark-mind
pkgname=(mark-mind{,-appimage})
pkgver=1.3.1
pkgrel=2
pkgdesc="Mark Mind — Next generation mind map editor"
arch=('any')
url="https://github.com/MarkMindCkm/Mark-Mind"
license=('MIT')
makedepends=()
backup=()
options=('!strip')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${_pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver//_/-}/${_gitpkgname}-${pkgver}.AppImage"
    "io.github.markmindltd.mark_mind.desktop"
    "io.github.markmindltd.mark_mind.metainfo.xml")
sha256sums=('c51bc35ebcca1416fb3b41059abb33931db43a2efca070e931d5971d85f1921e'
            '88e27420e23395e03af6bbfde10777e6b31b1dcf974a2f0e3dab5fd95eac62b2'
            'bc8c6db34688ad87879871a9ea28c088a1f44fcdfb7f4e4aef52a425283dde9f'
            'c0050afe68a3c62cc8f15508b1209a41eae4cbd7e358a0bf0ae20bc37178f35f')

_install_path="/opt/appimages"

package_mark-mind() {
    pkgdesc+=" (electron)"
    provides=(${pkgname})
    conflicts=(${pkgname})

    depends=(electron
            coreutils
            npm)

    install -Dm 0644 "${srcdir}/io.github.markmindltd.mark_mind.desktop" "${pkgdir}/usr/share/applications/io.github.markmindltd.mark_mind.desktop"
    install -Dm 0644 "${srcdir}/io.github.markmindltd.mark_mind.metainfo.xml" "${pkgdir}/usr/share/metainfo/io.github.markmindltd.mark_mind.metainfo.xml"

    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tar.gz"
    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}

package_mark-mind-appimage() {
    pkgdesc+=" (AppImage)"
    provides=(${pkgname})
    conflicts=(${pkgname})

    chmod u+x "${srcdir}/${_pkgname}-${pkgver}.AppImage"
    "${srcdir}/${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/mark-mind-appimage.AppImage|g' -i "${srcdir}/squashfs-root/mind.desktop"

    install -Dm755 "${srcdir}"/${_pkgname}-${pkgver}.AppImage "${pkgdir}"/${_install_path}/${pkgname}.AppImage
    local _icon
    for _icon in 16 32 48 64 128 256 512; do
        install -Dm0644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icon}x${_icon}/apps/mind.png" \
                    -t  "${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps"
    done

    install -Dm644 "${srcdir}/squashfs-root/mind.desktop" -t "${pkgdir}/usr/share/applications"

}
