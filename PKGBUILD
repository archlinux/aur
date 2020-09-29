# Maintainer: CrankySupertoon <crankysupertoon@gmail.com.com>

pkgname=mesen-s
_pkgname=Mesen-S
pkgver=0.4.0
pkgrel=1
pkgdesc='A cross-platform Super Nintendo emulator'
arch=('x86_64')
makedepends=('clang' 'gendesk' 'zip')
depends=('mono' 'sdl2')
url='https://github.com/SourMesen/Mesen-S'
conflicts=('mesen-s-bin' 'mesen-s-git')
license=('GPL3')
source=(
    "source.zip::https://github.com/SourMesen/Mesen-S/archive/${pkgver}.zip"
)
sha256sums=('SKIP')

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	# Prevent duplicate .desktop from getting created
	sed -i 's/CreateShortcutFile(desktopFile, mimeTypes);//' UI/Config/FileAssociationHelper.cs

	gendesk --pkgname "${_pkgname}" --pkgdesc "${pkgdesc}" --exec "/usr/bin/mesen-s" -n -f

	# Invoke using mono in a wrapper, since wine (if installed) would open it otherwise
	cat > "${pkgname}" <<-EOT
	#!/bin/sh
	/usr/bin/mono /opt/Mesen-S/Mesen-S "\$@"
	EOT
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	mkdir -p bin
	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname%%-git}"
	install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

	cd "${srcdir}/${_pkgname}-${pkgver}/UI/Resources"
	install -Dm644 "MesenSIcon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

	cd "${srcdir}/${_pkgname}-${pkgver}/bin/x64/Release"
	install -Dm755 "${_pkgname}.exe" "${pkgdir}/opt/${_pkgname}/${_pkgname}"

	cd "${srcdir}/${_pkgname}-${pkgver}/InteropDLL/obj.x64"
	install -Dm644 "libMesenSCore.x64.dll" "${pkgdir}/usr/lib/libMesenSCore.dll"
}
