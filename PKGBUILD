# Maintainer: My Name <andrea.venturini@tiscali.it>
pkgname=igdesk
igdeskver=1.4
igdeskrel=620
pkgver=${igdeskver}_${igdeskrel}
pkgrel=2
pkgdesc="IG DESK is a free signature tool developed by Intesi Group for all users who need to digitally sign documents from their desktop quickly and easily."
arch=('x86_64')
url="https://www.intesigroup.com/it/software-firma-digitale/ig-desk/"
options=(!strip)
source_x86_64=("https://github.com/intesi-group/ig-desk/releases/download/v${igdeskver}-${igdeskrel}/IGDesk-${igdeskver}_${igdeskrel}-x86_64.AppImage")

noextract=("${pkgname}-${pkgver}-${arch}.AppImage")
sha256sums_x86_64=('696eb9e258e8566ad22f7f240e60b79df469cd249856d5e008b6f5b0478f5f31')

package() {
	install -Dm755 "${srcdir}/IGDesk-${pkgver}-${arch}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}"

	# Symlink executable
	mkdir -p "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	mkdir -p "${pkgdir}/usr/share/applications"
	"${pkgdir}/opt/${pkgname}/${pkgname}" --appimage-extract IGDesk.desktop
	sed -i "s/Exec=IGDesk/Exec=\/bin\/${pkgname}/g" squashfs-root/IGDesk.desktop

	mkdir -p "${pkgdir}/usr/share/pixmaps"
	"${pkgdir}/opt/${pkgname}/${pkgname}" --appimage-extract IGDesk.png
	
	install "squashfs-root/IGDesk.desktop" "${pkgdir}/usr/share/applications/IGDesk.desktop"
	install "squashfs-root/IGDesk.png" "${pkgdir}/usr/share/pixmaps/IGDesk.png"
}
