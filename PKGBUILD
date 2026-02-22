# Maintainer: italoghost <eduprodive at posteo dot me>
pkgname=leshade-bin
_pkgname=leshade
pkgver=2.2
pkgrel=1
pkgdesc="An unofficial Reshade Installer for Linux."
arch=('x86_64')
url="https://github.com/Ishidawg/LeShade"
license=("MIT")
provides=("$_pkgname")
depends=('libglvnd' 'libxkbcommon' 'libxcb' 'xcb-util-image' 'xcb-util-keysyms'
         'xcb-util-renderutil' 'xcb-util-wm' 'xcb-util-cursor' 'openssl'
         'libpng' 'libjpeg-turbo' 'fontconfig' 'fribidi' 'dbus' 'systemd-libs'
         'glib2' 'pcre2' 'gtk3' 'at-spi2-core' 'cairo' 'pango')
makedepends=('chrpath')
options=('!strip' '!emptydirs')
_appimage="LeShade-x86_64.AppImage"
noextract=("${_appimage}")
source=("https://github.com/Ishidawg/LeShade/releases/download/${pkgver}/${_appimage}"
		"LICENSE::https://raw.githubusercontent.com/Ishidawg/LeShade/main/LICENSE")
sha256sums=('634a1769bea1c13e87165a6e6e6cbe392716d57aa7eeb4eb63cfd89cc10a16af'
            'a7b8f406ed4e1a5311d51a1967f91e569a6c0ce815c2bf74956d926613dd61a3')

prepare() {
	# Extract AppImage
    cd "${srcdir}"
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract

	cd "${srcdir}/squashfs-root/"
	sed -i -e "s/Exec=LeShade/Exec=leshade/" "${_pkgname}.desktop"

	# Remove insecure RUNPATH
	find . -type f $$   -name '*.so*' -o -name 'LeShade'   $$ -exec chrpath -d {} \; 2>/dev/null || true
}

package() {
	# Create directory structure
    install -dm755 "${pkgdir}/opt/${_pkgname}"
    install -dm755 "${pkgdir}/usr/bin"

	# Move extracted content to /opt
	cp -ar "${srcdir}/squashfs-root/." "${pkgdir}/opt/${_pkgname}/"

	# Install the .desktop file and the icon
	install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.png" "$pkgdir/usr/share/pixmaps/${_pkgname}.png"
	install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"

	# Create a symbolic link for the AppRun
	ln -s "/opt/${_pkgname}/AppRun" "${pkgdir}/usr/bin/${_pkgname}"

	# License
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
