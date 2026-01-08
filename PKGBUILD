# Maintainer: Nemo <archlinux at captnemo dot in>
# Based on upwork-appimage package on the AUR
#
# There's no central repository for AppImages, and no convention on
# system-wide AppImage installations, so we're picking /opt/appimages.
# We grab koreader.png and koreader.desktop from the AppImage, patch the koreader.desktop,
# and install them as we would other apps, for convenience sake.
pkgname=koreader-appimage
pkgver=2025.10
pkgrel=1

pkgdesc="An ebook reader supporting PDF, DjVu, EPUB, FB2 and many more formats."
arch=('x86_64' 'aarch64')
depends=('zlib')
makedepends=('p7zip')
url="https://koreader.rocks/"
license=('AGPL3')
_filename="koreader-appimage-$arch-v$pkgver.AppImage"
noextract=("$_filename")
options=('!strip')
install=${pkgname}.install
source=("https://github.com/koreader/koreader/releases/download/v$pkgver/$_filename")
sha512sums=('1d8e9dd84e8d82ddd2dd3e23e90e4944c67741da3f08a436df70bbc8607ec27a1e1da1a4c2f8555ff0d7183bb613104878709807c562574d7dee3307323b57e9')

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
