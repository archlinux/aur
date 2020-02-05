# Maintainer: Nemo <archlinux at captnemo dot in>
# Based on upwork-appimage package on the AUR
# 
# There's no central repository for AppImages, and no convention on
# system-wide AppImage installations, so we're picking /opt/appimages.
# We grab koreader.png and koreader.desktop from the AppImage, patch the koreader.desktop,
# and install them as we would other apps, for convenience sake.
pkgname=koreader-appimage
pkgver=2020.01
pkgrel=1

pkgdesc="An ebook reader application supporting PDF, DjVu, EPUB, FB2 and many more formats"
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
sha256sums=('b770db78f68f3ebcb602a07746a25d010a87e47b0cd81b49ed65a91f6b19c5e4')

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