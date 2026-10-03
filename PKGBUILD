# Maintainer: bemxio <bemxiov at protonmail dot com>

_pkgname="mupen64-rr-lua"
pkgname="${_pkgname}-bin"

pkgdesc="Advanced N64 TASing emulator"

pkgver=1.5.0_3
pkgrel=1

arch=(any)

url="https://mupen64.com"
license=(GPL-2.0-or-later)

depends=(wine)
makedepends=(gendesk)

provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

source=(
	"Mupen64-${pkgver}-windows-x64.zip::https://github.com/mupen64/mupen64-rr-lua/releases/download/${pkgver/_/-}/mupen-windows-x64.zip"
	mupen64.svg
	"${_pkgname}"
)
md5sums=(29179ddfa3eab61a6942c3f1fc70ba3e ac784fbdf320838192bccab95f1c912c d382dc9368c4d4d236b5c516fd6b57ff)

install="${_pkgname}.install"

prepare() {
	# generate desktop entry
	gendesk -f -n \
		--pkgname Mupen64-rr-lua \
		--pkgdesc "${pkgdesc}" \
		--exec "${_pkgname}" \
		--icon "${_pkgname}.svg" \
		--categories "Game;Emulator"
}

package() {
	# copy all files to package directory
	find . -type f -name '*.dll' -exec install -Dm644 "{}" "${pkgdir}/usr/share/${_pkgname}/{}" \;
	install -Dm755 mupen64.exe "${pkgdir}/usr/share/${_pkgname}/mupen64.exe"

	# copy executable script
	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	# copy icon and desktop entry file
	install -Dm644 mupen64.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
	install -Dm644 Mupen64-rr-lua.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}