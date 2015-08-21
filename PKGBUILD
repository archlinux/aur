# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: kusakata <shohei atmark kusakata period com>

pkgname=freeminer
pkgver=0.4.13.7
pkgrel=1
pkgdesc='An open source sandbox game inspired by Minecraft.'
arch=('i686' 'x86_64')
url='http://freeminer.org/'
license=('GPL3' 'CCPL:cc-by-sa-3.0')

depends=('irrlicht' 'leveldb' 'libvorbis' 'openal' 'sqlite' 'curl' 'luajit' 'xdg-utils' 'hicolor-icon-theme' 'hiredis')
makedepends=('cmake' 'msgpack-c')
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}-git")

install=${pkgname}.install

source=(
	"https://github.com/${pkgname}/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.zip"
	"${pkgname}.install"
)
sha512sums=(
	'd650bf3b2f471407d448f080f6cf16af818b4c72607b8e2b1c5e36e0c8ed8447c944a3f148a90de410f507f0eb999a28d77e2de8798f3280559c94d39a2ac505'
	'd590345e9b87e4350b7420eebf8f69e4ad65a53415257573b569ed1c85568a40b4f65fc8df5925f7c03af75d340c52a10a4d1389e5d868816aef9711102ebef1'
)

prepare() {
	# Create build directory
	mkdir -p ${srcdir}/build
}

build() {
	# Number of jobs
	declare -i njobs=$(nproc)
	
	if [[ ${njobs} -ge 8 ]]; then
		njobs=$(( ${njobs} - 2 ))
	fi
	
	# Building package
	cd ${srcdir}/build
	cmake ../${pkgname}-${pkgver} \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DRUN_IN_PLACE=0
	make -j${njobs}
}

package() {
	# Installing package
	cd ${srcdir}/build
	make DESTDIR=${pkgdir} install
}