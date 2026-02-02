# Maintainer: pierspad <pierpaolospadafora@proton.me>
pkgname=textmerger-bin
_pkgname=textmerger
pkgver=2.2.3
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

sha256sums=('085bc5e78e097f03fbb37fc74279045d8fe2682d5d20bc77ff611e24d97048e8'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
    bsdtar -O -xf "${srcdir}/${_pkgname}-${pkgver}.deb" data.tar* | bsdtar -C "${pkgdir}" -xvf -

    if [ -d "${pkgdir}/usr/local" ]; then
        cp -r "${pkgdir}/usr/local/"* "${pkgdir}/usr/"
        rm -rf "${pkgdir}/usr/local"
    fi

    cat <<EOF > "${srcdir}/textmerger.desktop.custom"
[Desktop Entry]
Version=2.2.3
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
