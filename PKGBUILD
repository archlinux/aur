# Maintainer: pierspad <pierpaolospadafora@proton.me>
pkgname=textmerger-bin
_pkgname=textmerger
pkgver=2.8.2
pkgrel=1
pkgdesc="A Rust/Tauri GTK3 application for merging text files"
arch=('x86_64')
url="https://github.com/pierspad/textmerger"
license=('GPL3')

depends=('glibc' 'glib2' 'gtk3' 'webkit2gtk-4.1' 'libsoup3' 'cairo' 'gdk-pixbuf2' 'hicolor-icon-theme')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

options=('!debug') 

source=("textmerger-${pkgver}.deb::https://github.com/pierspad/textmerger/releases/download/v${pkgver}/textmerger_${pkgver}_amd64.deb"
        "LICENSE::https://raw.githubusercontent.com/pierspad/textmerger/main/docs/LICENSE")

sha256sums=('975e896f8c2d492cc0e104d5c395b0e2f3df09c1b600be4334bf35468b1c1a6c'
            'e0492c8870ed6ed7720ccdf98de84b894a5f778dd98ea916004af3e3623b70db')

package() {
    bsdtar -O -xf "${srcdir}/${_pkgname}-${pkgver}.deb" data.tar* | bsdtar -C "${pkgdir}" -xvf -

    if [ -d "${pkgdir}/usr/local" ]; then
        cp -r "${pkgdir}/usr/local/"* "${pkgdir}/usr/"
        rm -rf "${pkgdir}/usr/local"
    fi

    cat <<EOF > "${srcdir}/textmerger.desktop.custom"
[Desktop Entry]
Version=${pkgver}
Type=Application
Name=TextMerger
Comment=A Rust/Tauri GTK3 application for merging text files
Exec=textmerger
Icon=textmerger
Terminal=false
Categories=Office;Utility;TextEditor;
Keywords=text;merge;files;editor;
StartupNotify=true
EOF

    install -Dm644 "${srcdir}/textmerger.desktop.custom" "${pkgdir}/usr/share/applications/textmerger.desktop"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
