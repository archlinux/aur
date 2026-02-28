# Maintainer: DownerCase <downercase8 (at) gmail (dot) com>

pkgbase=ecal
pkgname=("${pkgbase}"{,'-app','-samples'})
pkgver=6.1.0.r0.gf60f5a2
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
	protozero
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
_tag=f60f5a20780f7e5a7780af05f3f6f29eece26a6f
source=(
	"$pkgbase::git+https://github.com/eclipse-ecal/ecal.git#tag=$_tag"
	"FindCMakeFunctions.cmake"
	"Findrecycle.cmake"
	"Findasio.cmake"
	"Findprotozero.cmake"
	"protobuf-30-compat.patch"
	"hdf5_target.patch"
)
sha256sums=('66370d4674a3458b983e978cfc9dbd73da2a6b75f980d80ea231abea714b8534'
            '7772a07a3be74dd249eecd8f058e79956755c99cc507bdc79221676e37523807'
            'e8d90f45fad48dee0a5ce4196966a260176f23c766918c0fb493cde509b9a452'
            'a19e5ed8b675bf416fd6013e382043b1c0e7e9552605eb3aba92661e0a56cd30'
            'bab284bced7e486fdf2d32940d268f974fdabbc000001bb01d47e4e0ad6e218a'
            '1e6992285d6b6e0b9f7130b5edb91abd7b2030cb6a3ea93572758054888f0e1b'
            'e38a25c01eaeac394c918dc6e6c65a836d5235f0460b84c293d8eb078374ba6d')

pkgver() {
  cd "$pkgbase"
  # cutting off 'v' prefix that presents in the git tag
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$pkgbase"
	patch -Np1 -i ../protobuf-30-compat.patch
	patch -Np1 -i ../hdf5_target.patch
}

build() {
	local cmake_options=(
		-S "$pkgbase"
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
		glibc
		libgcc
		libstdc++
		abseil-cpp
		ecaludp # AUR
		hdf5
		protobuf
		tcp_pubsub # AUR
		yaml-cpp
	)
	backup=('etc/ecal/ecal.yaml' 'etc/ecal/ecaltime.yaml')

	install -D -m644 "${srcdir}"/"${pkgbase}"/LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE.txt
	DESTDIR="$pkgdir" cmake --install build --component Unspecified
	DESTDIR="$pkgdir" cmake --install build --component configuration
	DESTDIR="$pkgdir" cmake --install build --component sdk
}

package_ecal-app() {
	pkgdesc="First-party tools for eCAL"
	depends=(
		glibc
		libgcc
		libstdc++
		abseil-cpp
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
	install -D -m644 "${srcdir}"/"${pkgbase}"/LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE.txt
}

package_ecal-samples() {
	pkgdesc="Sample eCAL applications"
	depends=(
		glibc
		libgcc
		libstdc++
		abseil-cpp
		ecal # AUR
		protobuf
		qt6-base
	)
	DESTDIR="$pkgdir" cmake --install build --component samples
	install -D -m644 "${srcdir}"/"${pkgbase}"/LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE.txt
}

