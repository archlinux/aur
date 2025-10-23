# Maintainer: Spike29 <leguen.yannick@gmail.com>
# Contributor: Lionel Hernou <lionel.hernou@gmail.com>

pkgname=netradiant-custom
pkgver=20251023
pkgrel=2
pkgdesc="The open-source, cross-platform level editor for id Tech based games (NetRadiant fork)"
arch=('x86_64')
url="https://garux.github.io/NRC/"
license=('Apache-2.0' 'BSD-3-Clause' 'GPL-2.0-or-later' 'LGPL-2.1-or-later' 'Zlib' 'LicenseRef-custom')
depends=('assimp' 'gcc-libs' 'glib2' 'glibc' 'libjpeg-turbo' 'libpng' 'libxml2' 'qt5-base' 'qt5-svg' 'zlib')
makedepends=('git' 'unzip' 'wget')
optdepends=('xorg-xwayland: required to use the application on a Wayland session'
            'subversion: optional makedepend to fetch some gamepacks when using alternative DOWNLOAD_GAMEPACKS values')
provides=('h2data' 'mbspc' 'q2map' 'q3map2' 'qdata3')
source=("git+https://github.com/Garux/${pkgname}.git#tag=${pkgver}"
        "${pkgname}.desktop")
sha256sums=('7dd86599f3a3a4d8219e69d0c2cd4bcff21d7cd93e34f31c819173674b4beba0'
            'c9f21fbacdd2024e417234e986790fca67daeb391a91b590abb68b440e0df648')

build () {
	cd "${srcdir}/${pkgname}/"

	# Possible values for DOWNLOAD_GAMEPACKS are:
	# "yes" (free gamepacks only, downloaded from their respective sources)
	# "all" (free & proprietary gamepacks, downloaded from their respective sources)
	# "allinone" (free & proprietary gamepacks downloaded from a single archive, provided by the NRC maintainer)
	# "no"
 	# The "subversion" optdepend is needed when using the first 2 values
	make \
	 RADIANT_ABOUTMSG="NetRadiant-custom ${pkgver}" \
	 DOWNLOAD_GAMEPACKS=allinone
}

package () {
	mkdir -p "${pkgdir}/opt/${pkgname}"
	cp -r "${srcdir}/${pkgname}/install/"* "${pkgdir}/opt/${pkgname}/"

	# Add symlinks to /usr/bin and rename them so that this package can coexist with netradiant or gtkradiant
	mkdir -p "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/radiant" "${pkgdir}/usr/bin/${pkgname}"
	ln -s "/opt/${pkgname}/h2data" "${pkgdir}/usr/bin/h2data_nrc"
	ln -s "/opt/${pkgname}/mbspc" "${pkgdir}/usr/bin/mbspc_nrc"
	ln -s "/opt/${pkgname}/q2map" "${pkgdir}/usr/bin/q2map_nrc"
	ln -s "/opt/${pkgname}/q3map2" "${pkgdir}/usr/bin/q3map2_nrc"
	ln -s "/opt/${pkgname}/qdata3" "${pkgdir}/usr/bin/qdata3_nrc"

	# Install a desktop entry and the license file
	mkdir -p "${pkgdir}/usr/share/pixmaps"
	ln -s "/opt/${pkgname}/bitmaps/logo.svg" "${pkgdir}/usr/share/pixmaps/${pkgname}.svg"
	install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -D -m644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
