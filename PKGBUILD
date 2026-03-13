# Maintainer: italoghost <eduprodive at posteo dot me>
pkgname=ppsspp-bin
_pkgname=ppsspp
pkgver=1.20.2
pkgrel=1
pkgdesc="A PSP emulator for Android, Windows, Mac and Linux, written in C++"
arch=('x86_64')
url="https://www.ppsspp.org/"
license=("GPL-2.0-or-later")
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('libgcc' 'dbus' 'glibc' 'pcre2' 'systemd-libs' 'libgomp' 'util-linux-libs'
		'zstd' 'libelf' 'libffi' 'zlib' 'bzip2' 'libusb' 'bash'
		'expat' 'libstdc++' 'brotli' 'glib2' 'libtool' 'xz')
options=('!strip' '!emptydirs')
_appimage=PPSSPP-v${pkgver}-anylinux-x86_64.AppImage
noextract=("${_appimage}")
source=("https://github.com/hrydgard/ppsspp/releases/download/v${pkgver}/${_appimage}")
sha256sums=('cdf9cd3484358034bdb8a3a1fdaee203c1c3be4268df7d1e8a27ce2201f09173')

prepare() {
	# Extract AppImage
    cd "${srcdir}"
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract

	cd "${srcdir}/squashfs-root/"
	mv "PPSSPPSDL.desktop" "$_pkgname.desktop"
	sed -i -e "s/Exec=PPSSPPSDL/Exec=ppsspp/" "$_pkgname.desktop"

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
	# Permissions
	chmod -R u+rwX,go+rX,go-w "${pkgdir}/opt/${_pkgname}"
}
