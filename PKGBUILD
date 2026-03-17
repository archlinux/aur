# Maintainer: AkitaOnRails <fabio.akita@gmail.com>
pkgname=frank-sherlock-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Local-only, AI-powered image cataloging and search system"
arch=('x86_64')
url="https://github.com/akitaonrails/FrankSherlock"
license=('GPL-3.0-only')
depends=('webkit2gtk-4.1' 'hicolor-icon-theme' 'fuse2')
optdepends=('ollama: required for AI image classification'
  'ffmpeg: required for video thumbnail extraction and metadata')
provides=('frank-sherlock')
conflicts=('frank-sherlock')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/frank_sherlock_${pkgver}_amd64.AppImage")
sha256sums=('4b666e3bdc490088f0e282d1681461d61622ae411cd9a96d60357641dab04d98')
noextract=("${pkgname}-${pkgver}.AppImage")

prepare() {
    chmod +x "${srcdir}/${pkgname}-${pkgver}.AppImage"
    "${srcdir}/${pkgname}-${pkgver}.AppImage" --appimage-extract
}

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" \
        "${pkgdir}/opt/frank-sherlock/frank-sherlock.AppImage"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s /opt/frank-sherlock/frank-sherlock.AppImage "${pkgdir}/usr/bin/frank-sherlock"

    install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/frank_sherlock.desktop" \
        "${pkgdir}/usr/share/applications/frank-sherlock.desktop"

    sed -i 's|Exec=sherlock_app|Exec=frank-sherlock|g' \
        "${pkgdir}/usr/share/applications/frank-sherlock.desktop"
    sed -i 's|Icon=sherlock_app|Icon=frank-sherlock|g' \
        "${pkgdir}/usr/share/applications/frank-sherlock.desktop"
    sed -i 's|Name=frank_sherlock|Name=Frank Sherlock|g' \
        "${pkgdir}/usr/share/applications/frank-sherlock.desktop"

    for size in 32x32 128x128; do
        icon="${srcdir}/squashfs-root/usr/share/icons/hicolor/${size}/apps/sherlock_app.png"
        if [[ -f "${icon}" ]]; then
  install -Dm644 "${icon}" \
      "${pkgdir}/usr/share/icons/hicolor/${size}/apps/frank-sherlock.png"
        fi
    done

    icon_hidpi="${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256@2/apps/sherlock_app.png"
    if [[ -f "${icon_hidpi}" ]]; then
        install -Dm644 "${icon_hidpi}" \
  "${pkgdir}/usr/share/icons/hicolor/512x512/apps/frank-sherlock.png"
    fi
}
