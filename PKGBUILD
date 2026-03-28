# Maintainer: Nemo <archlinux at captnemo dot in>
# Based on upwork-appimage package on the AUR
#
# There's no central repository for AppImages, and no convention on
# system-wide AppImage installations, so we're picking /opt/appimages.
# We grab koreader.png and koreader.desktop from the AppImage, patch the koreader.desktop,
# and install them as we would other apps, for convenience sake.
pkgname=koreader-appimage
pkgver=2026.03
pkgrel=1

pkgdesc="An ebook reader supporting PDF, DjVu, EPUB, FB2 and many more formats."
arch=('x86_64' 'aarch64' 'armhf')
depends=('zlib')
makedepends=()
url="https://koreader.rocks/"
license=('AGPL3')
_filename="koreader-v${pkgver}-${CARCH}.AppImage"
noextract=("$_filename")
options=('!strip')
source=("https://github.com/koreader/koreader/releases/download/v$pkgver/$_filename")
sha512sums=('7b915d66cb6f830c96f9c775c284b3b831ceab9a451c8b499d51744b3d674ae8ec73628d22b62d528b309af312dbc6d4e57445115bc91d67c48adf3b97cc68c7')

prepare() {
    cd "${srcdir}"
    mv "$_filename" "koreader.AppImage"
    chmod +x koreader.AppImage
    ./koreader.AppImage --appimage-extract usr/share/applications/rocks.koreader.koreader.desktop
    ./koreader.AppImage --appimage-extract usr/share/icons/hicolor/512x512/apps/koreader.png
    sed -i 's@Exec=.*@Exec=/opt/appimages/koreader.AppImage %u@' \
        squashfs-root/usr/share/applications/rocks.koreader.koreader.desktop
}

package() {
    cd "${srcdir}"
    install -Dm755 koreader.AppImage "${pkgdir}/opt/appimages/koreader.AppImage"
    install -Dm644 squashfs-root/usr/share/applications/rocks.koreader.koreader.desktop \
        "${pkgdir}/usr/share/applications/rocks.koreader.koreader.desktop"
    install -Dm644 squashfs-root/usr/share/icons/hicolor/512x512/apps/koreader.png \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/koreader.png"
}
