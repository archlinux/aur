# Maintainer: dmitrysvd

pkgname=yandex-music
pkgver=5.102.0
pkgrel=1
pkgdesc="Official Yandex Music App for Linux"
arch=('x86_64')
url="https://music.yandex.ru/download/"
license=('LicenseRef-unknown')
depends=(
    alsa-lib
    gtk3
    libnotify
    nss
    libxss
    libxtst
    xdg-utils
    at-spi2-core
    util-linux-libs
    libsecret
)
optdepends=(
    libappindicator-gtk3
)
options=('!strip' '!debug')
source=("https://music-desktop-application.s3.yandex.net/stable/Yandex_Music_amd64_${pkgver}.deb")
sha256sums=('9e751a3589e2042456061c4cb942cd9942b4891095f5dbae49d24b3d8c2f8253')

package() {
    tar -xf data.tar.xz --directory "${pkgdir}"

    # Remove Cyrillic from the path
    mv "${pkgdir}/opt/Яндекс Музыка" "${pkgdir}/opt/yandex-music"
    sed -i 's|/opt/Яндекс Музыка|/opt/yandex-music|g' "${pkgdir}/usr/share/applications/yandexmusic.desktop"

    # Localize Cyrillic name
    sed -i 's|Name=Яндекс Музыка|Name=Yandex Music\nName[ru]=Яндекс Музыка|g' "${pkgdir}/usr/share/applications/yandexmusic.desktop"

    # Change StartupWMClass to package name from package.json in app.asar
    sed -i 's|StartupWMClass=Яндекс Музыка|StartupWMClass=YandexMusic|g' "${pkgdir}/usr/share/applications/yandexmusic.desktop"

    # Fix menu category
    sed -i 's|Categories=Audio;|Categories=AudioVideo;Audio;|g' "${pkgdir}/usr/share/applications/yandexmusic.desktop"

    # Fix GTK version error for Gnome users
    sed -i 's|Exec="/opt/yandex-music/yandexmusic"|Exec="/opt/yandex-music/yandexmusic" --gtk-version=3|' "${pkgdir}/usr/share/applications/yandexmusic.desktop"

    install -Dm644 "${pkgdir}/opt/yandex-music/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
    install -Dm644 "${pkgdir}/opt/yandex-music/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
