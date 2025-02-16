# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>

_pkgname=xyce
pkgname="${_pkgname}-shylu"
pkgver=7.9.0
pkgrel=1
pkgdesc="Open-Source, SPICE-compatible, high-performance analog circuit simulator - ShyLU/OpenMP/Parallel support"
arch=("x86_64")
url="https://github.com/Xyce/xyce"
license=('GPL-3.0-or-later')
depends=(
	"glibc"
	"gcc-libs"
	"adms"
	"fftw"
	"gklib"
	"openblas"
	"suitesparse"
	"openmpi"
	"fftw-openmpi"
	"parmetis"
	"metis"
)
makedepends=(
	"git"
	"cmake"
)
optdepends=(
	"bash: For compiling plugins using 'buildxyceplugin.sh'"
	"python: For use with the Python-Xyce interface"
)
provides=(
	'libxyce.so'
)
conflicts=()
install=${_pkgname}.install
options=(!debug)

_git_tag="Release-${pkgver}"

# Trilinos package
# The last official version supported by Xyce is 14.4;
# However that one segfaults using ShyLu
#_trilinos_pkgver=14.4.0
_trilinos_pkgver=16.0.0
_trilinos_url="https://github.com/trilinos/Trilinos"
_doc_url="https://xyce.sandia.gov/files/xyce"

source=(
	"${pkgname}::git+${url}#tag=${_git_tag}"
	"trilinos::git+${_trilinos_url}#tag=trilinos-release-${_trilinos_pkgver//./-}"
	"${_doc_url}/Xyce_Docs-${pkgver%.*}.tar.gz"
)
b2sums=(
	'7f13aabca25a9c696b1783a618f8bada0e6919cb20e90b97a3052860ba6c8c002e6ac5ffdfb30b367ed5e9ddc894ba3ff64c5e6bca56ddf20f896a8353933290'
	'5cfa6474f1768f65af9fac03f367edba9cf8d0ed6e3cee4a80ddc45ff64b97886f714b303e742e971e17946760283968765a34f4a504ecedb932044ab42f4f23'
	'a8e6a3e223595ba35bdb3aeabf27c4a3c8a24d8f7fbfc8f7b6b12301664b6a56760f065ad04051971a552d9a2eb75978e64bb06caa6ff56c15a36a52c3fbee81'
)

build() {
	# Avoid having deprcated warnings all over
	export CFLAGS="${CFLAGS} -Wno-cpp"
	export CXXFLAGS="${CXXFLAGS} -Wno-cpp"
	
	# Trilinos
	cmake \
		-C "${pkgname}/cmake/trilinos/trilinos-beta.cmake" \
		-DTrilinos_ENABLE_OpenMP="ON" \
		-DTPL_ENABLE_ParMETIS="ON" \
		-DTPL_AMD_LIBRARY_DIRS="/usr/lib/" \
		-DTPL_AMD_INCLUDE_DIRS="/usr/include/suitesparse" \
		-DTeuchos_ENABLE_THREAD_SAFE=ON \
		-B build_trilinos \
		-S trilinos \
		-W no-dev \
		-W no-cpp \
		-D CMAKE_BUILD_TYPE=None
	# Build Trilinos first
	cmake --build build_trilinos
	# "Install" trilinos
	DESTDIR="_trilinos" cmake --install build_trilinos

	# Build Xyce - using the built trilinos package
	cmake \
		-DXyce_PLUGIN_SUPPORT=ON \
		-DXyce_SHYLU=ON \
		-DXyce_AMESOS2_SHYLUBASKER=ON \
		-DTrilinos_ROOT="_trilinos/usr/local/" \
		-B build_xyce \
		-S "${pkgname}" \
		-W no-dev \
		-W no-cpp \
		-D CMAKE_BUILD_TYPE=None \
		-D CMAKE_INSTALL_PREFIX="/usr"
	cmake --build build_xyce
}

package() {
	DESTDIR="${pkgdir}" cmake --install build_xyce
	# Remove 'admsXml' - Already have it from adms
	rm "${pkgdir}/usr/bin/admsXml"
	# Remove the /doc/ files
	rm -r "${pkgdir}/usr/doc"
	# Install the docs:
	(
		cd "${srcdir}/Xyce_Docs-${pkgver%.*}"
		for doc in *.pdf; do
			install -Dm0644 -t "${pkgdir}/usr/share/doc/${pkgname}/" "${doc}" 
		done
	)
}
