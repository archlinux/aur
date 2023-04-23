# Maintainer: y5nw <y5nw@outlook.com>
# Previous Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Konsta Kokkinen <kray@tsundere.fi>

pkgbase=minetest-git
pkgname=(minetest-git minetest-server-git minetest-common-git)
pkgver=5.7.0.r36.g0fb6dbab3
pkgrel=1
epoch=1
url=https://www.minetest.net
license=(GPL)
arch=(i686 x86_64)
makedepends=(cmake curl freetype2 git gmp hicolor-icon-theme hiredis jsoncpp leveldb libgl libjpeg libvorbis libxi luajit openal postgresql spatialindex sqlite)
source=(git+https://github.com/minetest/minetest.git
		git+https://github.com/minetest/irrlicht.git
		git+https://github.com/minetest/minetest_game.git
		minetest.service
		sysusers.d
		tmpfiles.d)
sha256sums=('SKIP'
		'SKIP'
		'SKIP'
		'2d80b4ff925770bdf3d857debb2ad11227cc9b022eb01a358b18f8d5f2641a5c'
		'e4166d639b35efda2cd72269208184ab1e72c54541344cd202ff2005c90b9433'
		'd9405cf7cd0a657ef06082570783383a1f527fbc0bd122ea506d4fbe26950d4a')

pkgver() {
	git -C "${pkgbase%-git}" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	ln -sf "${srcdir}/irrlicht" "${srcdir}/${pkgbase%-git}/lib/irrlichtmt"
}

build() {
	cmake -B build-client -S "${pkgbase%-git}" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_CLIENT=1 \
		-DBUILD_GETTEXT=1 \
		-DENABLE_LEVELDB=0 \
		-DENABLE_POSTGRESQL=1 \
		-DENABLE_SPATIAL=1 \
		-DENABLE_REDIS=0
	make -C build-client

	cmake -B build-server -S "${pkgbase%-git}" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_CLIENT=0 \
		-DBUILD_SERVER=1 \
		-DENABLE_LEVELDB=1 \
		-DENABLE_POSTGRESQL=1 \
		-DENABLE_SPATIAL=1 \
		-DENABLE_REDIS=1
	make -C build-server
}

package_minetest-git() {
	pkgdesc='Multiplayer infinite-world block sandbox game (git)'
	depends=(curl desktop-file-utils freetype2 gmp hicolor-icon-theme jsoncpp libgl libjpeg libvorbis libxi luajit minetest-common-git openal postgresql-libs spatialindex sqlite xdg-utils)
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")

	make -C build-client DESTDIR="${pkgdir}" install

	rm -rf "${pkgdir}"/usr/share/{minetest,doc}
	rm "${pkgdir}"/usr/share/man/man6/minetestserver.6
}

package_minetest-server-git() {
	pkgdesc='Server of infinite-world block sandbox game (git)'
	depends=(minetest-common leveldb curl sqlite hiredis luajit postgresql-libs spatialindex jsoncpp gmp)
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")

	make -C build-server DESTDIR="${pkgdir}" install

	install -d "${pkgdir}"/etc/minetest
	install -Dm644 minetest.service "${pkgdir}"/usr/lib/systemd/system/minetest@.service

	rm -rf "${pkgdir}"/usr/share/{minetest,metainfo,appdata,applications,icons,doc}
	mv "${pkgdir}"/usr/share/man/man6/minetest.6 "${pkgdir}"/usr/share/man/man6/minetestserver.6

	install -Dm644 "${srcdir}"/tmpfiles.d "${pkgdir}"/usr/lib/tmpfiles.d/minetest-server.conf
	install -Dm644 "${srcdir}"/sysusers.d "${pkgdir}"/usr/lib/sysusers.d/minetest-server.conf
}

package_minetest-common-git() {
	pkgdesc='Common data files for minetest and minetest-server (git)'
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")

	install -d "${pkgdir}"/usr/share/minetest
	cp -r -t "${pkgdir}"/usr/share/minetest "${pkgbase%-git}"/{games,builtin,client,fonts,textures,doc} build-client/locale

	cp -r "${srcdir}"/minetest_game "${pkgdir}"/usr/share/minetest/games/minetest
	rm "${pkgdir}"/usr/share/minetest/games/minetest/.gitignore
}
