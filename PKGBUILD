# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: kusakata <shohei atmark kusakata period com>

pkgname=freeminer
pkgver=0.4.14.8
pkgrel=2
pkgdesc='An open source sandbox game inspired by Minecraft.'
arch=('i686' 'x86_64')
url='http://freeminer.org/'
license=('GPL3' 'CCPL:cc-by-sa-3.0')

depends=(
	'leveldb' 'curl' 'hiredis' 'sqlite' 'luajit' 'irrlicht'
	'openal' 'enet' 'jsoncpp' 'libvorbis' 'hicolor-icon-theme' 'freetype2'
)
makedepends=('cmake' 'msgpack-c' 'clang')
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}-git")

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
	cd "${srcdir}"/${pkgname}-${pkgver}

	# Use Arch's enet lib
	patch -Np1 < ../enet_shared_lib.patch

	# Fix msgpack-c v2.0.0
	patch -Np1 < ../fix_msgpack.patch

	# Create build directory
	mkdir -p "${srcdir}"/build
}

build() {
	# Building package
	cd "${srcdir}"/build
	cmake ../${pkgname}-${pkgver} \
		-DCMAKE_C_COMPILER=clang \
		-DCMAKE_CXX_COMPILER=clang++ \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DRUN_IN_PLACE=0 \
		-DENABLE_SYSTEM_JSONCPP=1 \
		-DENABLE_SYSTEM_MSGPACK=1
	make
}

package() {
	# Installing package
	cd "${srcdir}"/build
	make DESTDIR="${pkgdir}" install
}
