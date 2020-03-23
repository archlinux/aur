# Maintainer: Nemo <archlinux at captnemo dot in>
# Based on upwork-appimage package on the AUR
# 
# There's no central repository for AppImages, and no convention on
# system-wide AppImage installations, so we're picking /opt/appimages.
# We grab koreader.png and koreader.desktop from the AppImage, patch the koreader.desktop,
# and install them as we would other apps, for convenience sake.
pkgname=koreader-appimage
pkgver=2020.03.2
pkgrel=1

pkgdesc="An ebook reader supporting PDF, DjVu, EPUB, FB2 and many more formats"
arch=('x86_64')
depends=('zlib')
makedepends=('p7zip')
url="http://koreader.rocks/"
license=('AGPL3')
_filename="koreader-appimage-x86_64-linux-gnu-v$pkgver.AppImage"
noextract=("$_filename")
options=('!strip')
install=${pkgname}.install
source=("http://ota.koreader.rocks/koreader-appimage-x86_64-linux-gnu-v$pkgver.AppImage")
sha256sums=('4f4b75a0edf6570a8cd034546472174273b6ac1c1f5c732358866fda3b679f34')

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