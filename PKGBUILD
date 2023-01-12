# Maintainer: j45 <j45minetest at gee mael dot comercial>
# Contributor:  ROllerozxa <temporaryemail4meh [gee mail]>
# Contributor: Martin C. Doege <mdoege at compuserve dot com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Konsta Kokkinen <kray@tsundere.fi>
# This is a modified version of https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=minetest-git-leveldb
pkgname=dragonfireclient-git
_pkgname=dragonfireclient
pkgver=2022.05.r66.g296cce39d
pkgrel=1
pkgdesc='An utility client for the Voxelengine minetest [https://minetest.net/] (Git version)'
url='https://github.com/dragonfireclient'
license=('GPL')
arch=('i686' 'x86_64')
makedepends=(cmake curl freetype2 gendesk git gmp hicolor-icon-theme hiredis jsoncpp leveldb libgl libjpeg libvorbis libxi luajit openal postgresql spatialindex sqlite)

source=('git+https://github.com/dragonfireclient/dragonfireclient.git'
		'git+https://github.com/minetest/irrlicht.git')
sha1sums=('SKIP' 'SKIP')
conflicts=("${pkgname}")
provides=("${pkgname}")

pkgver() {
	git -C "${_pkgname}" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	gendesk -f --pkgname "${_pkgname}" --pkgdesc "${pkgdesc}" --exec="minetest"

	ln -s "${srcdir}/irrlicht/" "${srcdir}/${_pkgname}/lib/irrlichtmt"
}

build() {
	cd "${srcdir}/${_pkgname}"
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_CLIENT=1 \
		-DENABLE_GETTEXT=1 \
		-DENABLE_FREETYPE=1 \
		-DENABLE_LEVELDB=0 \
		-DENABLE_POSTGRESQL=1 \
		-DENABLE_SPATIAL=1 \
		-DENABLE_REDIS=0
	
	make -j$(nproc)
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" install

	rm -f "${pkgdir}/usr/share/applications/net.minetest.minetest.desktop"
	install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
