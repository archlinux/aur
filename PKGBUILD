# Maintainer: Spike29 <leguen.yannick@gmail.com>
# Contributor: Lionel Hernou <lionel.hernou@gmail.com>

pkgname=netradiant-custom
pkgver=20240309
pkgrel=2
pkgdesc="The open-source, cross-platform level editor for id Tech based games (NetRadiant fork)"
url="https://garux.github.io/NRC/"
depends=('bash' 'gcc-libs' 'glib2' 'glibc' 'libjpeg-turbo' 'libpng' 'libxml2' 'qt5-base' 'zlib')
optdepends=('xorg-xwayland: required to use the application on a Wayland session')
makedepends=('git' 'svn' 'unzip' 'wget')
provides=('h2data_nrc' 'mbspc_nrc' 'q2map_nrc' 'q3map2_nrc' 'qdata3_nrc')
source=('git+https://github.com/Garux/netradiant-custom.git#commit=5daf2e265eb7b2218f9e433261f6e089c4ab65da'
'netradiant-custom.desktop')
sha256sums=('SKIP'
'ec1256d5eb657b1e17ebb4ce1280598077b9c350408f9d778f41d5a30b3924e4')
license=('GPL' 'BSD' 'LGPL')
arch=('i686' 'x86_64')

build () {
	# Work around a crash at startup or when displaying the textures browser:
	# https://github.com/Garux/netradiant-custom/issues/186
	export CXXFLAGS+=" -Wp,-U_GLIBCXX_ASSERTIONS"

	cd "${srcdir}/${pkgname}/"
	make
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

	# Install a desktop entry and a license file
	mkdir -p "${pkgdir}/usr/share/pixmaps"
	ln -s "/opt/${pkgname}/bitmaps/splash.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -D -m644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
