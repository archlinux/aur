# Maintainer: Nathan Chere <aur@nathanchere.com.au>
pkgname=neo-writing-bin
_appname=neo-writing
pkgver=0.8.1
pkgrel=1
pkgdesc="A distraction-free word processor for authors"
arch=('x86_64')
url="https://github.com/hughhowey/neo"
license=('MIT')
depends=('fuse2' 'gtk3' 'nss' 'alsa-lib' 'hicolor-icon-theme')
provides=('neo-writing')
conflicts=('neo-writing')
options=('!strip' '!debug')
_filename="NEO-${pkgver}.AppImage"
source=("${_filename}::${url}/releases/download/v${pkgver}/${_filename}"
        "LICENSE::https://raw.githubusercontent.com/hughhowey/neo/v${pkgver}/LICENSE")
sha256sums=('f6c0f529594a4b9f4a7d8d3ed2369b6fb162bf81c56e0c22efa7cccf35297bcc'
            '2ca9751b685b12507fc5ce8e9cb172458d86c0e4db4baf95f950a911e29a975a')

prepare() {
	chmod +x "${srcdir}/${_filename}"
	"${srcdir}/${_filename}" --appimage-extract 'usr/share/icons/hicolor/1024x1024/apps/neo.png'
}

package() {
	install -Dm755 "${srcdir}/${_filename}" "${pkgdir}/usr/lib/${_appname}/${_filename}"
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/usr/lib/${_appname}/${_filename}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/1024x1024/apps/neo.png" \
		"${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${_appname}.png"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${_appname}.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=NEO
Comment=A distraction-free word processor for authors
Exec=neo-writing
Icon=neo-writing
Terminal=false
Categories=Office;WordProcessor;
EOF
}
