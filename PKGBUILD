# Maintainer: pierspad <pierpaolospadafora@proton.me>
pkgname=textmerger-bin
_pkgname=textmerger
pkgver=2.10.8
pkgrel=1
pkgdesc="Merge text from multiple files into a single output"
arch=('x86_64')
url="https://github.com/pierspad/textmerger"
license=('GPL3')

depends=('glibc' 'glib2' 'gtk3' 'webkit2gtk-4.1' 'libsoup3' 'cairo' 'gdk-pixbuf2' 'hicolor-icon-theme')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

options=('!debug') 

source=("textmerger-${pkgver}.deb::https://github.com/pierspad/textmerger/releases/download/v${pkgver}/textmerger_${pkgver}_amd64.deb"
        "LICENSE::https://raw.githubusercontent.com/pierspad/textmerger/main/LICENSE")

sha256sums=('5586d84ca3487c7ef44c53a35e3c95dd7620186defbc9bdc17ebd324632468f6'
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
Comment=Merge text from multiple files into a single output
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
