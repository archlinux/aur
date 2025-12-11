# Contributor: gryffyn <me@gryffyn.io>
# Maintainer: tee < teeaur at duck dot com >

pkgname=archiveweb.page-appimage
pkgver=0.16.0
pkgrel=1
pkgdesc="An Electron based application for interactive, high-fidelity web archiving"
arch=('x86_64')
url="https://github.com/webrecorder/archiveweb.page"
license=('AGPL-3.0-or-later')
depends=('fuse2'
         'hicolor-icon-theme'
         'zlib')
options=(!strip)
source=("${url}/releases/download/v${pkgver}/ArchiveWeb.page-${pkgver}.AppImage"
        "ArchiveWeb.page.desktop")
sha256sums=('a4fc880fa7b8580b7781c672194d9e09927d69e47d5cc8f6c05c9b89b71e123a'
            '62b378eaad8f542f85c8c0a90b6ab6f9bec8f48d0924eb0cafb1521403573cb1')

prepare() {
    sed -i "s/{pkgversion}/${pkgver}/" ${srcdir}/ArchiveWeb.page.desktop

    chmod +x "${srcdir}/ArchiveWeb.page-${pkgver}.AppImage"
    "${srcdir}/ArchiveWeb.page-${pkgver}.AppImage" --appimage-extract
}

package() {
    install -Dm755 "${srcdir}/ArchiveWeb.page-${pkgver}.AppImage" "${pkgdir}/opt/ArchiveWeb.page/ArchiveWeb.page.AppImage"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s /opt/ArchiveWeb.page/ArchiveWeb.page.AppImage "${pkgdir}/usr/bin/ArchiveWeb.page"

    install -dm755 "${pkgdir}/usr/share/applications/"
    cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
    cp --no-preserve=mode,ownership "${srcdir}/ArchiveWeb.page.desktop" "${pkgdir}/usr/share/applications/"
}
