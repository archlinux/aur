# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='flatpak-games-git'
pkgdesc='Converts various Linux game installers to Flatpak bundles'
pkgver=r51.1adcd13
pkgrel=2
url='https://github.com/hadess/flatpak-games'
arch=('any')
license=('GPL')
depends=('lua-posix>=33.4' 'lua-socket>=20160311' 'flatpak' 'unzip' 'lua-archive-git' 'lua-sec')
source=("${pkgname}::git+${url}" 'game-to-flatpak.sh')
sha512sums=('SKIP'
            '5db38ad5d912278d379207427c102ef14018113425a527a9e964798dc07a0b48808154006bca05dd461026e97d88737d0980c81e4a0d33c34e0397b36b55a5bc')

pkgver () {
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package () {
	cd "${pkgname}"
	install -Dm644 game-to-flatpak \
		"${pkgdir}/usr/share/flatpak-games/game-to-flatpak.lua"
	install -m755 -d "${pkgdir}/usr/share/flatpak-games/lib"
	install -m644 -t "${pkgdir}/usr/share/flatpak-games/lib" \
		lib/*.lua
	install -Dm755 "${srcdir}/game-to-flatpak.sh" \
		"${pkgdir}/usr/bin/game-to-flatpak"
}
