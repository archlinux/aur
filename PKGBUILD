# Maintainer: gryffyn <me@gryffyn.io>

pkgname=archiveweb.page-appimage
pkgver=0.15.1
pkgrel=1
pkgdesc="An Electron based application for interactive, high-fidelity web archiving"
arch=('x86_64')
url="https://github.com/webrecorder/archiveweb.page/"
license=('AGPL-3.0-only')
depends=('fuse2'
         'hicolor-icon-theme'
         'zlib')
source=("${url}/releases/download/v${pkgver}/ArchiveWeb.page-${pkgver}.AppImage"
        "ArchiveWeb.page.desktop")
sha256sums=('8e51580f0473d7524212280c77d22684ec5a1739d5512f6867a9f0fe68b629b5'
            '62b378eaad8f542f85c8c0a90b6ab6f9bec8f48d0924eb0cafb1521403573cb1')
options=(!strip !debug)

prepare() {
    sed -i "s/{pkgversion}/${pkgver}/" ${srcdir}/ArchiveWeb.page.desktop

    chmod +x ${srcdir}/ArchiveWeb.page-${pkgver}.AppImage
    ${srcdir}/ArchiveWeb.page-${pkgver}.AppImage --appimage-extract
}

package() {
    install -Dm755 ${srcdir}/ArchiveWeb.page-${pkgver}.AppImage ${pkgdir}/opt/ArchiveWeb.page/ArchiveWeb.page.AppImage

    install -dm755 ${pkgdir}/usr/bin
    ln -s /opt/ArchiveWeb.page/ArchiveWeb.page.AppImage ${pkgdir}/usr/bin/ArchiveWeb.page

    install -dm755 ${pkgdir}/usr/share/applications/
    cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
    cp --no-preserve=mode,ownership "${srcdir}/ArchiveWeb.page.desktop" "${pkgdir}/usr/share/applications/"
}
