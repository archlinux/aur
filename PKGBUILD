# Maintainer: Ramazan Muslu <ramazanmuslu@yorastudioplus.com>
# Version 1.3.1
pkgname=animecix-desktop-bin
pkgver=1.3.1
pkgrel=2
pkgdesc="AnimeciX Desktop App"
arch=('x86_64')
url="https://github.com/RamazanMuslu/animecix-linux"
license=('GPL3')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libxtst')
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
    # AppImage içeriği squashfs-root içine çıkar
    cd "${srcdir}/squashfs-root"

    # Uygulama dosyalarını opt altına kopyala
    install -d "${pkgdir}/opt/${pkgname}"
    cp -av . "${pkgdir}/opt/${pkgname}/"

    # DOSYAYA ÇALIŞTIRMA İZNİ VER (Bu en önemlisiydi aq)
    chmod +x "${pkgdir}/opt/${pkgname}/AppRun"

    # Binary için symlink oluştur
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/AppRun" "${pkgdir}/usr/bin/animecix-desktop"

    # Desktop dosyasını düzelt ve kur
    sed -i "s|Exec=AppRun|Exec=/usr/bin/animecix-desktop|g" "animecix.desktop"
    # Desktop dosyasındaki Icon ismini de paket adıyla eşitleyelim ki garanti olsun
    sed -i "s|Icon=animecix|Icon=${pkgname}|g" "animecix.desktop"
    
    install -Dm644 "animecix.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # İkonu gerçek yolundan çekip kuruyoruz
    if [ -f "usr/share/icons/hicolor/256x256/apps/animecix.png" ]; then
        install -Dm644 "usr/share/icons/hicolor/256x256/apps/animecix.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
    fi
}