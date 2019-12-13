# Maintainer: Eugene Hwang <hwang dot eug at gmail dot com>

_pkgname=lepton-snippet-manager
pkgname=${_pkgname}-appimage
pkgver=1.8.1
pkgrel=2
pkgdesc="Lepton is a lean code snippet manager based on GitHub Gist"
arch=('x86_64')
url="https://hackjutsu.com/Lepton/"
license=('MIT')
provides=('lepton-snippet-manager')
conflicts=('lepton-snippet-manager')
makedepends=('fuse2')
source=("https://github.com/hackjutsu/Lepton/releases/download/v${pkgver}/Lepton-${pkgver}-${arch}.AppImage"
        "lepton-snippet-manager.sh")
sha256sums=('caf9f1dc381f919826c683159b5d7662e4955cb587a4e50949dbdc2f5265ef39'
            '3a6fd5430844ac76e793f17c5019be9f701f8702813e354f87530cbb36bb3965')
options=(!strip)
_filename=./Lepton-${pkgver}-${arch}.AppImage

prepare() {
    cd "${srcdir}"
    chmod u+x ${_filename}
    ./${_filename} --appimage-extract 2> /dev/null
}

build() {
    sed -i "s|Exec=.*|Exec=${_pkgname}|g" "${srcdir}/squashfs-root/lepton.desktop"
    sed -i "s|Icon=.*|Icon=${_pkgname}|g" "${srcdir}/squashfs-root/lepton.desktop"
}

package() {
    install -dm755 "${pkgdir}/opt/appimages"
    install -Dm755 "${srcdir}/${_filename}" "${pkgdir}/opt/appimages/${_pkgname}.appimage"
    install -Dm755 "${srcdir}/lepton-snippet-manager.sh" "${pkgdir}/usr/bin/${_pkgname}"

    install -dm755 "${pkgdir}/usr/share/icons/hicolor/0x0/apps"
    install -Dm644 "${srcdir}/squashfs-root/lepton.png" "${pkgdir}/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png"

    for icon_res in $(ls "${srcdir}/squashfs-root/usr/share/icons/hicolor"); do
        install -dm755 "${pkgdir}/usr/share/icons/hicolor/$icon_res/apps"
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/$icon_res/apps/lepton.png" \
            "${pkgdir}/usr/share/icons/hicolor/$icon_res/apps/${_pkgname}.png";
    done

    install -Dm644 "${srcdir}/squashfs-root/lepton.desktop" "${pkgdir}/usr/share/applications/appimagekit-${_pkgname}.desktop"

    rm -rf "${srcdir}/squashfs-root"
}
