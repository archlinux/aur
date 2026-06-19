# Maintainer: Spike29 <leguen.yannick@gmail.com>
# Contributor: Lionel Hernou <lionel.hernou@gmail.com>

pkgname=netradiant-custom
pkgver=20260114
pkgrel=4
pkgdesc="The open-source, cross-platform level editor for id Tech based games (NetRadiant fork)"
arch=('x86_64')
url="https://garux.github.io/NRC/"
license=('Apache-2.0' 'BSD-3-Clause' 'GPL-2.0-or-later' 'LGPL-2.1-or-later' 'Zlib' 'LicenseRef-custom')
depends=('assimp' 'glib2' 'glibc' 'libjpeg-turbo' 'libpng' 'libstdc++' 'libxml2' 'qt5-base' 'qt5-svg' 'zlib')
makedepends=('git' 'unzip' 'wget')
optdepends=('xorg-xwayland: required to use the application on a Wayland session'
            'subversion: optional makedepend to fetch some gamepacks when using alternative DOWNLOAD_GAMEPACKS values')
provides=('h2data' 'mbspc' 'q2map' 'q3map2' 'qdata3')
source=("git+https://github.com/Garux/${pkgname}.git#tag=${pkgver}"
        "${pkgname}.desktop")
sha256sums=('ed49f6ca545be3859f0ea8ab6d7b45fb2d31bf5051f09f859f5c3aad333513d1'
            'c9f21fbacdd2024e417234e986790fca67daeb391a91b590abb68b440e0df648')

prepare() {
	cd "${srcdir}/${pkgname}/"

	# Fix build with GCC 16, see https://github.com/Garux/netradiant-custom/issues/298
	git cherry-pick --no-commit cd048695fb5118b885f3992f521d1c5ff21d7d24
}

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
