# Maintainer: Eugene Hwang <hwang dot eug at gmail dot com>

_pkgname=lepton
pkgname=${_pkgname}-appimage
pkgver=1.8.1
pkgrel=1
pkgdesc="Lepton is a lean code snippet manager based on GitHub Gist"
arch=('x86_64')
url="https://hackjutsu.com/Lepton/"
license=('MIT')
provides=('lepton')
source=("https://github.com/hackjutsu/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${arch}.appimage"
        "lepton.sh")
sha256sums=('caf9f1dc381f919826c683159b5d7662e4955cb587a4e50949dbdc2f5265ef39'
            '2d1135bf4ffccd9328445d6f20a2418d8b1af3e06591743c93a73378d2314b26')
options=(!strip)
_filename=./${_pkgname}-${pkgver}-${arch}.appimage

prepare() {
    cd "${srcdir}"
    chmod u+x ${_filename}
    ./${_filename} --appimage-extract
}

build() {
    sed -i "s|Exec=.*|Exec=${_pkgname}|g" "${srcdir}/squashfs-root/lepton.desktop"
}

package() {
    install -dm755 "${pkgdir}/opt/appimages"
    install -Dm755 "${srcdir}/${_filename}" "${pkgdir}/opt/appimages/${_pkgname}.appimage"
    install -Dm755 "${srcdir}/lepton.sh" "${pkgdir}/usr/bin/lepton"

    install -dm755 "${pkgdir}/usr/share/icons/hicolor/0x0/apps"
    install -Dm644 "${srcdir}/squashfs-root/lepton.png" "${pkgdir}/usr/share/icons/hicolor/0x0/apps/lepton.png"

    install -Dm644 "${srcdir}/squashfs-root/lepton.desktop" "${pkgdir}/usr/share/applications/appimagekit-lepton.desktop"

    rm -rf "${srcdir}/squashfs-root"
}
