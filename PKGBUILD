# Maintainer:
pkgname=libuhd-opt
pkgver=4.11.0.0
pkgrel=0
pkgdesc='UHD is the free & open-source software driver and API for the Universal Software Radio Peripheral (USRP™) SDR platform, created and sold by Ettus Research.'
arch=('x86_64')
url='https://github.com/EttusResearch/uhd'
license=('GPL3')
makedepends=('ninja' 'cmake' 'boost')
depends=('python' 'libusb' 'boost-libs' 'grpc')
provides=('libuhd')
install='libuhd-opt.install'

_build_directory=build
_tarball_extension=.tar.gz
_version_string=${pkgver}
_tarball_uhd=uhd-${_version_string}${_tarball_extension}
_tarball_uhd_images=uhd-images_${_version_string}${_tarball_extension}
_install_directory=/opt/${pkgname}/${_version_string}
_install_directory_uhd=${_install_directory}/uhd
_install_directory_images=${_install_directory}/images

source=(
	"libuhd-opt.install"
	"001-find-package-protobuf.patch"
	"${_tarball_uhd}::https://github.com/EttusResearch/uhd/archive/refs/tags/v${_version_string}.tar.gz"
	"${_tarball_uhd_images}::https://github.com/EttusResearch/uhd/releases/download/v${_version_string}/uhd-images_${_version_string}.tar.gz"
)

sha512sums=(
	"9aa636351aed97bca19d18425c4a66d54a7ba564ffcc1b66ae2afbf7bf6f2ecfe12da05798288aac901836b23f43d62ebe100a62ab8f3848b68db5f0dbf2e919"
	"b8f1d534f156ce42417910c2f161720d309db9e19fca3a597e1a794e725a18e2b37c741cfceaa4182435a92be12c71ad30ebdc32fc8b34662e757c3934b9da88"
	"2644008b0024d41689701ea33fd244ee2e629de1fe5bb6d2f3ef39aa5281337edc11475273e42e041845798794eee9e134a5bf649aa7d8a07990c5fccc5ef131"
	"5021fc5ee64048502b912f6a01e0f4e4a9e6082b052f1a03e8b15c4c2c0742f251abe38e5f34cb7ce6298f9159eedd939cb092767778358c1afc7c1febb28c44"
)

prepare() {
	cd "${srcdir}/uhd-${_version_string}"
	build_type=Release
	patch --unified --strip 1 --input "../001-find-package-protobuf.patch"
	cmake -G Ninja \
		-S "${srcdir}"/uhd-${_version_string}/host \
		-B "${srcdir}"/${_build_directory} \
		-DCMAKE_BUILD_TYPE=${build_type} \
		-DCMAKE_INSTALL_PREFIX:PATH=${_install_directory_uhd} \
		-DProtobuf_PROTOC_EXECUTABLE=/usr/bin/protoc \
		-DENABLE_TESTS=OFF
}

build() {
	cd "${srcdir}"/${_build_directory}
	ninja
}

package() {
	cd "${srcdir}"/${_build_directory}
	DESTDIR="${pkgdir}" ninja install

	cp -ar "${srcdir}"/uhd-images_${_version_string} "${pkgdir}"/${_install_directory_images}
}
