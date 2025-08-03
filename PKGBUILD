# Maintainer: DownerCase <downercase8 (at) gmail (dot) com>

pkgbase=ecal
pkgname=("${pkgbase}"{,'-app','-samples'})
pkgver=6.0.0
pkgrel=1
pkgdesc="enhanced Communication Abstraction Layer"
arch=('x86_64')
url="https://github.com/eclipse-ecal/ecal"
license=('Apache-2.0')
makedepends=(
	git
	cmake
	asio
	curl
	ecaludp # AUR
	fineftp-server # AUR
	ftxui # AUR
	hdf5
	protobuf
	qt6-base
	qwt
	recycle # AUR
	spdlog
	tclap
	tcp_pubsub # AUR
	termcolor # AUR
	tinyxml2
	yaml-cpp
)
_tag=f088f51926bc0ff942cb0323ca9fc3de4258f660
source=(
	"$pkgbase-$pkgver::git+https://github.com/eclipse-ecal/ecal.git#tag=$_tag"
	"FindCMakeFunctions.cmake"
	"Findrecycle.cmake"
	"Findasio.cmake"
	"protobuf-30-compat.patch"
	"static_app_helpers.patch"
	"hdf5_target.patch"
	"fix_mirror_server_name_clash.patch"
	"fix-component-for-apps.patch"
)
sha256sums=('5b659f1034fab768c04c35063adf6fc747de76edbf348cc1d3976b9e06f940a7'
            '7772a07a3be74dd249eecd8f058e79956755c99cc507bdc79221676e37523807'
            'e8d90f45fad48dee0a5ce4196966a260176f23c766918c0fb493cde509b9a452'
            'a19e5ed8b675bf416fd6013e382043b1c0e7e9552605eb3aba92661e0a56cd30'
            'eabede2d59f92f9644bd0e6ee68d09040299fb1fe709621f172c141822416430'
            'fbe08b8aa4dfd4e017ad5d3dd40591c09c6f5b74d5a57469cd953ad2ced4d443'
            'e38a25c01eaeac394c918dc6e6c65a836d5235f0460b84c293d8eb078374ba6d'
            'd1eff2178649bf40d27c277b5160074f7f67d5eb79d6ed4cdfdea3f5df52c619'
            '5dcbd71e570c742b48463f6eac46cc1300ad8da0de440be81758d70e9696cc90')

prepare() {
	cd "$pkgbase-$pkgver"
	patch -Np1 -i ../protobuf-30-compat.patch
	patch -Np1 -i ../static_app_helpers.patch
	patch -Np1 -i ../hdf5_target.patch
	patch -Np1 -i ../fix_mirror_server_name_clash.patch
	patch -Np1 -i ../fix-component-for-apps.patch
}

build() {
	local cmake_options=(
		-S "$pkgbase-$pkgver"
		-B build
		-DCMAKE_BUILD_TYPE=None
		-DCMAKE_INSTALL_PREFIX=/usr
		-DCMAKE_INSTALL_SYSCONFDIR=/etc
		-DBUILD_SHARED_LIBS=ON
		# Package fixes
		-DCMAKE_MODULE_PATH="$srcdir"
		-Dasio_INCLUDE_DIR=/usr/include/
		## Abseil (via Protobuf) needs a consistent C++ standard across the project
		-DCMAKE_CXX_STANDARD=17
		## Makes CMake prefer protobuf's config over its own FindProtobuf which doesn't work for eCAL
		-DCMAKE_FIND_PACKAGE_PREFER_CONFIG=ON
		# Explicitly configure pacakge
		## Enable sub-components
		-DECAL_BUILD_APPS=ON
		-DECAL_BUILD_C_BINDING=ON
		##TODO: Enable Python bindings as of 6.0.0 it places the Python modules
		## at /usr/ecal/*.so
		## The bindings currently expect to be built by scikit-build-core
		-DECAL_BUILD_PY_BINDING=OFF
		-DECAL_BUILD_SAMPLES=ON
		-DECAL_USE_FTXUI=ON
		-DECAL_USE_HDF5=ON
		-DECAL_USE_QT=ON
		## Overriden: Don't install source files for samples
		-DECAL_INSTALL_SAMPLE_SOURCES=OFF
	)
	cmake "${cmake_options[@]}"
	cmake --build build
}

package_ecal() {
	depends=(
		gcc-libs
		glibc
		ecaludp # AUR
		hdf5
		protobuf
		tcp_pubsub # AUR
		yaml-cpp
	)
	backup=('etc/ecal/ecal.yaml' 'etc/ecal/ecaltime.yaml')

	install -D -m644 "${srcdir}"/"${pkgbase}-${pkgver}"/LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE.txt
	DESTDIR="$pkgdir" cmake --install build --component Unspecified
	DESTDIR="$pkgdir" cmake --install build --component configuration
	DESTDIR="$pkgdir" cmake --install build --component sdk
}

package_ecal-app() {
	pkgdesc="First-party tools for eCAL"
	depends=(
		gcc-libs
		glibc
		ecal # AUR
		curl
		fineftp-server # AUR
		hicolor-icon-theme
		protobuf
		qt6-base
		qwt
		spdlog
		tinyxml2
		yaml-cpp
	)
	DESTDIR="$pkgdir" cmake --install build --component app
	install -D -m644 "${srcdir}"/"${pkgbase}-${pkgver}"/LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE.txt
}

package_ecal-samples() {
	pkgdesc="Sample eCAL applications"
	depends=(
		gcc-libs
		glibc
		ecal # AUR
		protobuf
		qt6-base
	)
	DESTDIR="$pkgdir" cmake --install build --component samples
	install -D -m644 "${srcdir}"/"${pkgbase}-${pkgver}"/LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE.txt
}

