# Maintainer: Pierpaolo Spadafora <pierpaolospadafora@proton.me>
pkgname=vesta-bin
_pkgname=vesta
_srcname=vesta 
_appid=com.vesta.desktop
pkgver=0.19.0
pkgrel=1
pkgdesc="Video Extraction, Sync & Translation for Anki"
arch=('x86_64')
url="https://github.com/pierspad/vesta"
license=('GPL-3.0-only')

depends=(
    'glibc'
    'glib2'
    'gtk3'
    'webkit2gtk-4.1'
    'libsoup3'
    'cairo'
    'gdk-pixbuf2'
    'pango'
    'hicolor-icon-theme'
    'libappindicator-gtk3'
    'gst-plugins-good'
    'gst-plugins-bad'
    'gst-plugins-ugly'
    'gst-libav'
    'vulkan-icd-loader'
)

provides=("${_pkgname}" "vesta" "Vesta" "vesta")
conflicts=("${_pkgname}" "vesta" "Vesta" "vesta")
options=('!debug')

source=("${_pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_srcname}_${pkgver}_amd64.deb"
        "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")

sha256sums=('5484dc6a32251846cc5123c4aa3cbf42684768e0ab0cf1aac2e235db597b8c6d'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
    bsdtar -O -xf "${srcdir}/${_pkgname}-${pkgver}.deb" data.tar* | bsdtar -C "${pkgdir}" -xvf -

    # Se Tauri installa in /usr/local, sposta in /usr
    if [ -d "${pkgdir}/usr/local" ]; then
        cp -r "${pkgdir}/usr/local/"* "${pkgdir}/usr/"
        rm -rf "${pkgdir}/usr/local"
    fi

    # Installa .desktop
    cat <<EOF > "${srcdir}/${_appid}.desktop"
[Desktop Entry]
Version=${pkgver}
Type=Application
Name=vesta
Comment=${pkgdesc}
Exec=${_pkgname}
Icon=${_pkgname}
Terminal=false
Categories=AudioVideo;Education;Utility;
Keywords=subtitles;anki;flashcards;translation;sync;video;
StartupNotify=true
StartupWMClass=${_pkgname}
EOF
    install -Dm644 "${srcdir}/${_appid}.desktop" "${pkgdir}/usr/share/applications/${_appid}.desktop"

    # Licenza
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
