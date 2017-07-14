# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: kusakata <shohei atmark kusakata period com>

pkgbase='freeminer'
pkgname=("${pkgbase}" "${pkgbase}-server" "${pkgbase}-common")
pkgver=0.4.14.8
pkgrel=3
arch=('i686' 'x86_64')
url='http://freeminer.org/'
license=('GPL3' 'CCPL:cc-by-sa-3.0')

makedepends=(
	'leveldb' 'curl' 'hiredis' 'sqlite' 'luajit'
	'irrlicht' 'openal' 'enet' 'jsoncpp' 'libvorbis'
	'hicolor-icon-theme' 'freetype2' 'cmake' 'msgpack-c' 'clang'
)

source=(
	"https://github.com/${pkgname}/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.zip"
	'enet_shared_lib.patch'
	'fix_msgpack.patch'
)
sha512sums=(
	'093c1640c9a070fdbd45074d0a4acc5b7894d23cd436dc3cf794cee8fff92930cf26f8d802b984cb9ce19bac7fccc6e0ce948c816c9e19b9e9551e373e560beb'
	'ac51ee33df27f9fb3bdf16c50b2a9da602d6c55bba7afe21492d0056cdfefa5f84ccfb306c23bd2bcf22066ca3ef2a952110ba0de350602393754f0466383004'
	'4ac827ed4b1185264c6b7df279c40548b7e5dc5957129ee6dc4fe6ff05222844dabab67cf1f8c1932cac0cc691ac040812eca662d7ff36424eb3d3827bb126a0'
)

prepare() {
	cd "${srcdir}"/${pkgbase}-${pkgver}

	# Use Arch's enet lib
	patch -Np1 < ../enet_shared_lib.patch

	# Fix msgpack-c v2.0.0
	patch -Np1 < ../fix_msgpack.patch

	# Create build directory
	mkdir -p "${srcdir}"/build-{client,server}
}

build() {
	# Building client
	cd "${srcdir}"/build-client
	cmake ../${pkgbase}-${pkgver} \
		-DCMAKE_C_COMPILER=clang \
		-DCMAKE_CXX_COMPILER=clang++ \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_CLIENT=1 \
		-DBUILD_SERVER=0 \
		-DRUN_IN_PLACE=0 \
		-DENABLE_SYSTEM_JSONCPP=1 \
		-DENABLE_SYSTEM_MSGPACK=1
	make

	# Building server
	cd "${srcdir}"/build-server
	cmake ../${pkgbase}-${pkgver} \
		-DCMAKE_C_COMPILER=clang \
		-DCMAKE_CXX_COMPILER=clang++ \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_CLIENT=0 \
		-DBUILD_SERVER=1 \
		-DRUN_IN_PLACE=0 \
		-DENABLE_SYSTEM_JSONCPP=1 \
		-DENABLE_SYSTEM_MSGPACK=1
	make
}

package_freeminer() {
	pkgdesc='An open source sandbox game inspired by Minecraft'
	depends=(
		"${pkgbase}-common" 'leveldb' 'curl' 'hiredis' 'sqlite'
		'luajit' 'irrlicht' 'openal' 'enet' 'jsoncpp'
		'libvorbis' 'hicolor-icon-theme' 'freetype2'
	)
	provides=("${pkgbase}=${pkgver}")
	conflicts=("${pkgbase}-git")

	# Installing client
	cd "${srcdir}"/build-client
	make DESTDIR="${pkgdir}" install

	# Translations
	cp -R locale "${pkgdir}"/usr/share/

	# Provided by freeminer-common
	rm -fR "${pkgdir}"/usr/share/{${pkgbase},doc}

	# Provided by freeminer-server
	rm -f "${pkgdir}"/usr/share/man/man6/${pkgbase}server.6
}

package_freeminer-server() {
	pkgdesc='Server of an open source sandbox game inspired by Minecraft'
	depends=(
		"${pkgbase}-common" 'leveldb' 'curl' 'hiredis' 'sqlite'
		'luajit' 'enet' 'jsoncpp'
	)
	provides=("${pkgbase}-server=${pkgver}")
	conflicts=("${pkgbase}-server-git")

	# Installing server
	cd "${srcdir}"/build-server
	make DESTDIR="${pkgdir}" install

	# Provided by freeminer
	rm -fR "${pkgdir}"/usr/share/{metainfo,appdata,applications,icons}
	rm -f "${pkgdir}"/usr/share/man/man6/${pkgbase}.6

	# Provided by freeminer-common
	rm -fR "${pkgdir}"/usr/share/{${pkgbase},doc}
}

package_freeminer-common() {
	pkgdesc="Common data files for ${pkgbase} and ${pkgbase}-server"
	arch=('any')
	provides=("${pkgbase}-common=${pkgver}")
	conflicts=("${pkgbase}-common-git")

	# Install common data files
	cd "${srcdir}"/${pkgbase}-${pkgver}
	mkdir -p "${pkgdir}"/usr/share/${pkgbase}/{,doc}
	cp -R {games,builtin,client,fonts,textures} "${pkgdir}"/usr/share/${pkgbase}/
	cp doc/*.txt "${pkgdir}"/usr/share/${pkgbase}/doc/
}
