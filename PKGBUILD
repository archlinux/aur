# Maintainer: italoghost <eduprodive at posteo dot me>
pkgname=ppsspp-bin
_pkgname=ppsspp
pkgver=1.19.2
pkgrel=1
pkgdesc="A PSP emulator for Android, Windows, Mac and Linux, written in C++"
arch=('x86_64')
url="https://www.ppsspp.org/"
license=("GPL 2.0 or later")
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
_appimage=PPSSPP-v${pkgver}-anylinux-x86_64.AppImage
noextract=("${_appimage}")
source=("https://github.com/hrydgard/ppsspp/releases/download/v${pkgver}/${_appimage}")
sha256sums=('b1b8203aacc15c070480dd9fa4501c6c8ffc6aa3524b6256181c2d9796ddde98')

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
	#Icon
	install -Dm644 "squashfs-root/$_pkgname.png" -t "$pkgdir/usr/share/pixmaps"
	
	# Desktop file
	install -Dm644 "squashfs-root/$_pkgname.desktop" -t "$pkgdir/usr/share/applications"
	
	# Main files
	install -d "$pkgdir/opt"
	cp -avR squashfs-root/ "$pkgdir/opt/$_pkgname"
	
	# Linking the script to the executable
	install -dm755 "$pkgdir/usr/bin"
	ln -sf "/opt/$_pkgname/AppRun" "$pkgdir/usr/bin/$_pkgname"
	
	# Permissions
	find "$pkgdir/opt/$_pkgname" -type d -exec chmod 755 {} +
}
