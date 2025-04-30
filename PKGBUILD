# Maintainer: ROllerozxa <rollerozxa@voxelmanip.se>
# Previous Maintainer: y5nw <y5nw@outlook.com>
# Previous Previous Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Konsta Kokkinen <kray@tsundere.fi>

pkgbase=minetest-git
pkgname=(minetest-git minetest-server-git minetest-common-git)
_pkgname=minetest
pkgver=5.10.0.rc1.r6.g9982c5637
pkgrel=1
epoch=1
url=https://www.luanti.org
license=(LGPLv2.1)
arch=(i686 x86_64)
makedepends=(cmake curl freetype2 git gmp hicolor-icon-theme hiredis jsoncpp leveldb libgl libjpeg libvorbis libxi luajit openal postgresql-libs spatialindex sqlite ninja sdl2)
source=(git+https://github.com/minetest/minetest.git
		luanti.service
		sysusers.d
		tmpfiles.d)
sha256sums=('SKIP'
            '94bd65bff21c63d508f127f19a6323c1a4e9c6869da239c9fc3af2d7f498d09d'
            '294283b0686c4d73d816168544ab2f813a7a0ca63fc49da59563a329dd329eed'
            'c9a0c78a49461f56381e5615045d036cd594b741c910129eccf43e475c40cca1')

pkgver() {
	git -C "${_pkgname}" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
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
	provides=("${_pkgname}" "luanti")
	conflicts=("${_pkgname}" "luanti")

	cd "${srcdir}/${_pkgname}/build"
	DESTDIR="${pkgdir}" ninja install

	rm "${pkgdir}/usr/bin/"{luanti,minetest}server
	rm -rf "${pkgdir}/usr/share/doc"
	rm -rf "${pkgdir}/usr/share/luanti/builtin"
	
	rm "${pkgdir}/usr/share/man/man6/luantiserver.6"
}

package_minetest-server-git() {
	pkgdesc='Free and open source voxel-based game engine (headless server) (git)'
	depends=(minetest-common-git leveldb curl sqlite hiredis luajit postgresql-libs spatialindex jsoncpp gmp)
	provides=("${_pkgname}-server" "luanti-server")
	conflicts=("${_pkgname}-server" "luanti-server")

	cd "${srcdir}/${_pkgname}/build"
	DESTDIR="${pkgdir}" ninja install
	
	rm "${pkgdir}/usr/bin/"{luanti,minetest}
	rm -rf "${pkgdir}/usr/share/"{luanti,metainfo,appdata,applications,icons,doc,locale}
	mv "${pkgdir}/usr/share/man/man6/luanti.6" "${pkgdir}/usr/share/man/man6/luantiserver.6"

	install -Dm644 "${srcdir}/luanti.service" "${pkgdir}/usr/lib/systemd/system/luanti@.service"

	install -Dm644 "${srcdir}/tmpfiles.d" "${pkgdir}/usr/lib/tmpfiles.d/luanti-server.conf"
	install -Dm644 "${srcdir}/sysusers.d" "${pkgdir}/usr/lib/sysusers.d/luanti-server.conf"
}

package_minetest-common-git() {
	pkgdesc='Free and open source voxel-based game engine (common data files) (git)'
	provides=("${_pkgname}-common" "luanti-common")
	conflicts=("${_pkgname}-common" "luanti-common")

	cd "${srcdir}/${_pkgname}/build"
	DESTDIR="${pkgdir}" ninja install

	rm -rf "${pkgdir}/usr/bin/"
	rm -rf "${pkgdir}/usr/share/"{applications,icons,locale,man,metainfo}
	rm -rf "${pkgdir}/usr/share/luanti/"{client,fonts,textures}
}
