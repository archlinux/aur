# Maintainer: Ramazan Muslu <ramazanmuslu@yorastudioplus.com>
pkgname=animecix-desktop-bin
pkgver=1.3.1
pkgrel=5
pkgdesc="AnimeciX Desktop App (Official Bin)"
arch=('x86_64')
url="https://github.com/RamazanMuslu/animecix-linux"
license=('GPL3')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libxtst' 'libdbusmenu-glib')
provides=('animecix-desktop')
conflicts=('animecix-desktop')
options=('!strip')

_filename="animecix-${pkgver}.AppImage"
source=("${_filename}::https://github.com/RamazanMuslu/animecix-linux/releases/download/v${pkgver}/${_filename}")
sha256sums=('3535a66e251524b36a16bcaa9169770134990dc422993c1e16a44f5d240fa415')

prepare() {
    cd "${srcdir}"
    chmod +x "${_filename}"
    ./"${_filename}" --appimage-extract
}

package() {
    cd "${srcdir}/squashfs-root"

    # 1. Klasörleri ve Dosyaları opt altına kur
    install -d "${pkgdir}/opt/${pkgname}"
    cp -av . "${pkgdir}/opt/${pkgname}/"
    
    # 2. İzinleri garantiye al
    chmod -R 755 "${pkgdir}/opt/${pkgname}"
    chmod +x "${pkgdir}/opt/${pkgname}/AppRun"

    # 3. LANUCHER SCRIPT (Linkle uğraşmıyoruz, direkt script yazıyoruz aq)
    install -d "${pkgdir}/usr/bin"
    echo -e '#!/bin/sh\nexec /opt/animecix-desktop-bin/AppRun "$@"' > "${pkgdir}/usr/bin/animecix-desktop"
    chmod 755 "${pkgdir}/usr/bin/animecix-desktop"

    # 4. Desktop Dosyasını Düzenle ve Kur
    sed -i "s|Exec=AppRun|Exec=/usr/bin/animecix-desktop|g" "animecix.desktop"
    sed -i "s|Icon=animecix|Icon=${pkgname}|g" "animecix.desktop"
    install -Dm644 "animecix.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # 5. İkonu Kur
    if [ -f "usr/share/icons/hicolor/256x256/apps/animecix.png" ]; then
        install -Dm644 "usr/share/icons/hicolor/256x256/apps/animecix.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
    fi
}