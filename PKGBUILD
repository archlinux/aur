# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: kusakata <shohei atmark kusakata period com>

pkgname=freeminer
pkgver=0.4.13.7
pkgrel=4
pkgdesc='An open source sandbox game inspired by Minecraft.'
arch=('i686' 'x86_64')
url='http://freeminer.org/'
license=('GPL3' 'CCPL:cc-by-sa-3.0')

depends=('leveldb' 'curl' 'hiredis' 'sqlite' 'luajit' 'xdg-utils' 'irrlicht' 'openal' 'jsoncpp' 'libvorbis' 'hicolor-icon-theme' 'freetype2')
makedepends=('cmake' 'msgpack-c' 'clang')
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}-git")

install=${pkgname}.install

source=(
	"https://github.com/${pkgname}/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.zip"
	"${pkgname}.install"
	'msgpackc_fix.patch'
)
sha512sums=(
	'd650bf3b2f471407d448f080f6cf16af818b4c72607b8e2b1c5e36e0c8ed8447c944a3f148a90de410f507f0eb999a28d77e2de8798f3280559c94d39a2ac505'
	'd590345e9b87e4350b7420eebf8f69e4ad65a53415257573b569ed1c85568a40b4f65fc8df5925f7c03af75d340c52a10a4d1389e5d868816aef9711102ebef1'
	'29b589f11bf2fbd8b0c7fa6df82ce2fc08d781dc9bad29e73cff5dd496331da583aededb039344840272423c0dc45fa72b067b5fd4fa05d3fa9aedd9c9757656'
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
