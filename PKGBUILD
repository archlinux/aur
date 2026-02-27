# Maintainer: Nathan Chere <aur@nathanchere.com.au>
pkgname=astro-editor-appimage
_appname=astro-editor
pkgver=1.0.10
pkgrel=1
pkgdesc="A beautiful markdown editor for Astro content collections"
arch=('x86_64')
url="https://github.com/dannysmith/astro-editor"
license=('AGPL-3.0-or-later')
depends=('fuse2' 'gtk3' 'webkit2gtk-4.1' 'zlib' 'hicolor-icon-theme')
provides=('astro-editor')
conflicts=('astro-editor')
options=('!strip' '!debug')
_filename="Astro.Editor_${pkgver}_amd64.AppImage"
source=("${_filename}::${url}/releases/download/v${pkgver}/${_filename}")
sha256sums=('84b2c3919e59c69897d3f80e07bf15fca78a8bb29a089fa4bc42cbceb94aa81c')

prepare() {
	chmod +x "${srcdir}/${_filename}"
	"${srcdir}/${_filename}" --appimage-extract
}

package() {
	install -Dm755 "${srcdir}/${_filename}" "${pkgdir}/opt/${_appname}/${_filename}"
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/${_appname}/${_filename}" "${pkgdir}/usr/bin/${_appname}"

	cd "${srcdir}/squashfs-root"

	install -Dm644 "usr/share/icons/hicolor/32x32/apps/${_appname}.png" \
		"${pkgdir}/usr/share/icons/hicolor/32x32/apps/${_appname}.png"
	install -Dm644 "usr/share/icons/hicolor/128x128/apps/${_appname}.png" \
		"${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_appname}.png"
	install -Dm644 "usr/share/icons/hicolor/256x256@2/apps/${_appname}.png" \
		"${pkgdir}/usr/share/icons/hicolor/256x256@2/apps/${_appname}.png"

	install -dm755 "${pkgdir}/usr/share/applications"
	cat > "${pkgdir}/usr/share/applications/${_appname}.desktop" << 'EOF'
[Desktop Entry]
Categories=Development;
Comment=A beautiful markdown editor for Astro content collections
Exec=astro-editor %U
StartupWMClass=astro-editor
Icon=astro-editor
Name=Astro Editor
Terminal=false
Type=Application
EOF
}
