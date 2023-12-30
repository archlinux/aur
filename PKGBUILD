# Maintainer: ROllerozxa <rollerozxa@voxelmanip.se>
# Previous Maintainer: y5nw <y5nw@outlook.com>
# Previous Previous Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Konsta Kokkinen <kray@tsundere.fi>

pkgbase=minetest-git
pkgname=(minetest-git minetest-server-git minetest-common-git)
_pkgname=minetest
pkgver=5.8.0.r67.g431444ba9
pkgrel=1
epoch=1
url=https://www.minetest.net
license=(LGPLv2.1)
arch=(i686 x86_64)
makedepends=(cmake curl freetype2 git gmp hicolor-icon-theme hiredis jsoncpp leveldb libgl libjpeg libvorbis libxi luajit openal postgresql-libs spatialindex sqlite ninja sdl2)
source=(git+https://github.com/minetest/minetest.git
		git+https://github.com/minetest/irrlicht.git
		minetest.service
		sysusers.d
		tmpfiles.d)
sha256sums=('SKIP'
			'SKIP'
			'2d80b4ff925770bdf3d857debb2ad11227cc9b022eb01a358b18f8d5f2641a5c'
			'e4166d639b35efda2cd72269208184ab1e72c54541344cd202ff2005c90b9433'
			'd9405cf7cd0a657ef06082570783383a1f527fbc0bd122ea506d4fbe26950d4a')

pkgver() {
	git -C "${_pkgname}" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	ln -sf "${srcdir}/irrlicht" "${srcdir}/${_pkgname}/lib/irrlichtmt"

	cd "${srcdir}/${_pkgname}"
	mkdir -p build && cd build

	cmake -G Ninja .. \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_CLIENT=1 \
		-DBUILD_SERVER=1 \
		-DBUILD_UNITTESTS=0 \
		-DENABLE_GETTEXT=1 \
		-DENABLE_LEVELDB=1 \
		-DENABLE_POSTGRESQL=1 \
		-DENABLE_SPATIAL=1 \
		-DENABLE_REDIS=1
	ninja
}

package_minetest-git() {
	pkgdesc='Free and open source voxel-based game engine (git)'
	depends=(curl leveldb freetype2 gmp jsoncpp libgl libjpeg libvorbis libxi luajit minetest-common-git openal postgresql-libs hiredis spatialindex sqlite sdl2)
	provides=("${_pkgname}")
	conflicts=("${_pkgname}")

	cd "${srcdir}/${_pkgname}/build"
	DESTDIR="${pkgdir}" ninja install

	rm "${pkgdir}/usr/bin/minetestserver"
	rm -rf "${pkgdir}/usr/share/doc"
	rm -rf "${pkgdir}/usr/share/minetest/builtin"
	
	rm "${pkgdir}/usr/share/man/man6/minetestserver.6"
}

package_minetest-server-git() {
	pkgdesc='Free and open source voxel-based game engine (headless server) (git)'
	depends=(minetest-common-git leveldb curl sqlite hiredis luajit postgresql-libs spatialindex jsoncpp gmp)
	provides=("${_pkgname}-server")
	conflicts=("${_pkgname}-server")

	cd "${srcdir}/${_pkgname}/build"
	DESTDIR="${pkgdir}" ninja install
	
	rm "${pkgdir}/usr/bin/minetest"
	rm -rf "${pkgdir}/usr/share/"{minetest,metainfo,appdata,applications,icons,doc,locale}
	mv "${pkgdir}/usr/share/man/man6/minetest.6" "${pkgdir}/usr/share/man/man6/minetestserver.6"

	install -Dm644 "${srcdir}/minetest.service" "${pkgdir}/usr/lib/systemd/system/minetest@.service"

	install -Dm644 "${srcdir}/tmpfiles.d" "${pkgdir}/usr/lib/tmpfiles.d/minetest-server.conf"
	install -Dm644 "${srcdir}/sysusers.d" "${pkgdir}/usr/lib/sysusers.d/minetest-server.conf"
}

package_minetest-common-git() {
	pkgdesc='Free and open source voxel-based game engine (common data files) (git)'
	provides=("${_pkgname}-common")
	conflicts=("${_pkgname}-common")

	cd "${srcdir}/${_pkgname}/build"
	DESTDIR="${pkgdir}" ninja install

	rm -rf "${pkgdir}/usr/bin/"
	rm -rf "${pkgdir}/usr/share/"{applications,icons,locale,man,metainfo}
	rm -rf "${pkgdir}/usr/share/minetest/"{client,fonts,textures}
}
