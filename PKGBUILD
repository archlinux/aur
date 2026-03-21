# Maintainer: Pierpaolo Spadafora <pierpaolospadafora@proton.me>
pkgname=vesta-bin
_pkgname=vesta
_srcname=VESTA 
_appid=com.vesta.desktop
pkgver=0.4.0
pkgrel=1
pkgdesc="Video Extraction, Sync & Translation for Anki"
arch=('x86_64')
url="https://github.com/pierspad/VESTA"
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
)

provides=("${_pkgname}" "VESTA" "Vesta" "vesta")
conflicts=("${_pkgname}" "VESTA" "Vesta" "vesta")
options=('!debug')

source=("${_pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_srcname}_${pkgver}_amd64.deb"
        "LICENSE::https://raw.githubusercontent.com/pierspad/VESTA/main/LICENSE")

sha256sums=('e14845d2a0668b491077ae23279ff290477722fc6770c153538f6c21aac09cfd'
            '144ee8f9fbaee3025c001b0b0e854eb6a80c1025a6548ead97ab5fb90df7aca6')

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
Name=VESTA
Comment=${pkgdesc}
Exec=${_pkgname}
Icon=${_appid}
Terminal=false
Categories=AudioVideo;Education;Utility;
Keywords=subtitles;anki;flashcards;translation;sync;video;
StartupNotify=true
StartupWMClass=${_appid}
EOF
    install -Dm644 "${srcdir}/${_appid}.desktop" "${pkgdir}/usr/share/applications/${_appid}.desktop"

    # Licenza
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
