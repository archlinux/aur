# Maintainer: pierspad <pierpaolospadafora@proton.me>
pkgname=textmerger-bin
_pkgname=textmerger
pkgver=2.11.1
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

sha256sums=('b117836c25d1abc1a32a6962e4ed338b6b2b3e4d67a165d78d34c1b5b4c49962'
            'e0492c8870ed6ed7720ccdf98de84b894a5f778dd98ea916004af3e3623b70db')

package() {
    bsdtar -O -xf "${srcdir}/${_pkgname}-${pkgver}.deb" data.tar* | bsdtar -C "${pkgdir}" -xvf -

    if [ -d "${pkgdir}/usr/local" ]; then
        cp -r "${pkgdir}/usr/local/"* "${pkgdir}/usr/"
        rm -rf "${pkgdir}/usr/local"
    fi

    cat <<EOF > "${srcdir}/textmerger.desktop.custom"
[Desktop Entry]
Version=1.0
X-AppVersion=${pkgver}
Type=Application
Name=TextMerger
Comment=Merge text from multiple files into a single output
Exec=textmerger
Icon=textmerger
Terminal=false
Categories=Utility;TextEditor;
Keywords=text;merge;files;editor;
StartupNotify=true
EOF

    install -Dm644 "${srcdir}/textmerger.desktop.custom" "${pkgdir}/usr/share/applications/textmerger.desktop"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
