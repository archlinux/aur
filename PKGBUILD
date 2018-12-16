# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=mesen-git
_pkgname=Mesen
pkgver=0.9.7
pkgrel=1
pkgdesc='A cross-platform NES/Famicom emulator'
arch=('x86_64')
makedepends=('clang' 'gendesk' 'zip')
depends=('mono' 'sdl2')
conflicts=('mesen')
provides=('mesen')
license=('GPL3')
source=("${_pkgname}::git+https://github.com/SourMesen/Mesen.git")
sha256sums=('SKIP')

prepare() {
	cd "${srcdir}/${_pkgname}"

	# Prevent duplicate .desktop from getting created
	sed -i 's/CreateShortcutFile(desktopFile, mimeTypes);//' GUI.NET/Config/FileAssociationHelper.cs

	gendesk --pkgname "${_pkgname}" --pkgdesc "${pkgdesc}" --exec "/usr/bin/mesen" -n

	# Invoke using mono in a wrapper, since wine (if installed) would open it otherwise
	cat > "${pkgname}" <<-EOT
	#!/bin/sh
	/usr/bin/mono /opt/Mesen/Mesen "\$@"
	EOT
}

build() {
	cd "${srcdir}/${_pkgname}"

	make
}

package() {
	cd "${srcdir}/${_pkgname}"

	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname%%-git}"
	install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

	cd "${srcdir}/${_pkgname}/GUI.NET/Resources"
	install -Dm644 "${_pkgname}Icon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

	cd "${srcdir}/${_pkgname}/bin/x64/Release"
	install -Dm755 "${_pkgname}.exe" "${pkgdir}/opt/${_pkgname}/${_pkgname}"

	cd "${srcdir}/${_pkgname}/InteropDLL/obj.x64"
	install -Dm644 "lib${_pkgname}Core.x64.dll" "${pkgdir}/usr/lib/lib${_pkgname}Core.dll"
}
