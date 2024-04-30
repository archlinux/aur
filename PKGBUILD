# Maintainer: Nemo <archlinux at captnemo dot in>
# Based on upwork-appimage package on the AUR
#
# There's no central repository for AppImages, and no convention on
# system-wide AppImage installations, so we're picking /opt/appimages.
# We grab koreader.png and koreader.desktop from the AppImage, patch the koreader.desktop,
# and install them as we would other apps, for convenience sake.
pkgname=koreader-appimage
pkgver=2024.04
pkgrel=1

pkgdesc="An ebook reader supporting PDF, DjVu, EPUB, FB2 and many more formats."
arch=('x86_64')
depends=('zlib')
makedepends=('p7zip')
url="https://koreader.rocks/"
license=('AGPL3')
_filename="koreader-appimage-x86_64-linux-gnu-v$pkgver.AppImage"
noextract=("$_filename")
options=('!strip')
install=${pkgname}.install
source=("https://github.com/koreader/koreader/releases/download/v$pkgver/koreader-appimage-x86_64-linux-gnu-v$pkgver.AppImage")
sha512sums=('703e06244886ab398cfceda470479938cf7d83be51a9b3be018b6c125ba9ea173c1134f0e15bf20a7c978e61c64acce6ddcf60e01ee100d73cadeddd6f124ce7')

prepare() {
    cd "${srcdir}"
    mv "$_filename" "koreader.AppImage"
    7z x "${srcdir}/koreader.AppImage" koreader.png
    7z x "${srcdir}/koreader.AppImage" koreader.desktop
    mkdir -p usr/share/pixmaps usr/share/applications opt/appimages
    mv koreader.png usr/share/pixmaps
    sed -i 's@Exec=.*@Exec=/opt/appimages/koreader.AppImage %u@' koreader.desktop
    mv koreader.desktop usr/share/applications
    cp koreader.AppImage opt/appimages/
}

package() {
    cd "${srcdir}"
    cp -rp usr "${pkgdir}/usr"
    cp -rp opt "${pkgdir}/opt"
    chmod +x "${pkgdir}/opt/appimages/koreader.AppImage"
}
