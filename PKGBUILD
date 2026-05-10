# Maintainer: dmitrysvd

pkgname=yandex-music
pkgver=5.101.2
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
sha256sums=('a002b341f49031191b4a57fe566e936385b89932ca53e853d72417a6ec760eae')

package() {
    tar -xf data.tar.xz --directory "${pkgdir}"

    # Remove Cyrillic from the path
    mv "${pkgdir}/opt/Яндекс Музыка" "${pkgdir}/opt/yandex-music"
    sed -i 's|/opt/Яндекс Музыка|/opt/yandex-music|g' "${pkgdir}/usr/share/applications/yandexmusic.desktop"

    # Fix menu category
    sed -i 's|Categories=Audio;|Categories=AudioVideo;Audio;|g' "${pkgdir}/usr/share/applications/yandexmusic.desktop"

    # Fix GTK version error for Gnome users
    sed -i 's|Exec="/opt/yandex-music/yandexmusic"|Exec="/opt/yandex-music/yandexmusic" --gtk-version=3|' "${pkgdir}/usr/share/applications/yandexmusic.desktop"

    install -Dm644 "${pkgdir}/opt/yandex-music/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
    install -Dm644 "${pkgdir}/opt/yandex-music/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
