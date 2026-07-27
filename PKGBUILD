# Maintainer: Nemo <archlinux at captnemo dot in>
# Based on upwork-appimage package on the AUR
#
# There's no central repository for AppImages, and no convention on
# system-wide AppImage installations, so we're picking /opt/appimages.
# We grab koreader.png and koreader.desktop from the AppImage, patch the koreader.desktop,
# and install them as we would other apps, for convenience sake.
pkgname=koreader-appimage
pkgver=2026.07
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
sha512sums=('aa30a0129753f3fead16abfc5da38467d47458e82791e2fff0cd8592c5b3acdf2b0201e18e6b975b93eaf74299f0258866cb1f1fd5e2c1f608632196b96b48cc')

prepare() {
    cd "${srcdir}"
    mv "$_filename" "koreader.AppImage"
    chmod +x koreader.AppImage
    ./koreader.AppImage --appimage-extract
    sed -i 's@Exec=.*@Exec=/opt/appimages/koreader.AppImage %u@' \
        squashfs-root/usr/share/applications/rocks.koreader.KOReader.desktop
}

package() {
    cd "${srcdir}"
    install -Dm755 koreader.AppImage "${pkgdir}/opt/appimages/koreader.AppImage"
    install -Dm644 squashfs-root/usr/share/applications/rocks.koreader.KOReader.desktop \
        "${pkgdir}/usr/share/applications/rocks.koreader.koreader.desktop"
    install -Dm644 squashfs-root/usr/share/icons/hicolor/512x512/apps/rocks.koreader.KOReader.png \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/rocks.koreader.KOReader.png"
}
