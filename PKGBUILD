# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: kusakata <shohei atmark kusakata period com>

pkgname=freeminer
pkgver=0.4.13.7
pkgrel=5
pkgdesc='An open source sandbox game inspired by Minecraft.'
arch=('i686' 'x86_64')
url='http://freeminer.org/'
license=('GPL3' 'CCPL:cc-by-sa-3.0')

depends=(
	'leveldb' 'curl' 'hiredis' 'sqlite' 'luajit' 'xdg-utils' 'irrlicht'
	'openal' 'jsoncpp' 'libvorbis' 'hicolor-icon-theme' 'freetype2'
)
makedepends=('cmake' 'msgpack-c' 'clang')
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}-git")

source=(
	"https://github.com/${pkgname}/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.zip"
	'msgpackc_fix.patch'
)
sha512sums=(
	'd650bf3b2f471407d448f080f6cf16af818b4c72607b8e2b1c5e36e0c8ed8447c944a3f148a90de410f507f0eb999a28d77e2de8798f3280559c94d39a2ac505'
	'59ef98c9550ede0e77ce30dcca6002759978a3b3d9046c7a135d319b8344c3647d745123e7f7a9695326f152a31b304824b40c36866818bade511dceaf27a86f'
)

prepare() {
	# msgpack-c now provides libmsgpackc
	cd "${srcdir}"/${pkgname}-${pkgver}
	patch -Np1 < ../msgpackc_fix.patch

	# Create build directory
	mkdir -p "${srcdir}"/build
}

build() {
	# Number of jobs
	declare -i njobs=$(nproc)

	if [[ ${njobs} -ge 8 ]]; then
		njobs=$(( ${njobs} - 2 ))
	fi

	# Building package
	cd "${srcdir}"/build
	cmake ../${pkgname}-${pkgver} \
		-DCMAKE_C_COMPILER=clang \
		-DCMAKE_CXX_COMPILER=clang++ \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DRUN_IN_PLACE=0 \
		-DENABLE_SYSTEM_JSONCPP=1 \
		-DENABLE_SYSTEM_MSGPACK=1
	make -j${njobs}
}

package() {
	# Installing package
	cd "${srcdir}"/build
	make DESTDIR="${pkgdir}" install
}
