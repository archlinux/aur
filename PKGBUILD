# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>

_pkgname=xyce
pkgname="${_pkgname}-shylu"
pkgver=7.10.0
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
	"make"
	"gcc-fortran"
)
optdepends=(
	"bash: For compiling plugins using 'buildxyceplugin.sh'"
	"python: For use with the Python-Xyce interface"
	"texlive-binextra: latexmk used to compile documentation"
)
provides=(
	'xyce'
)
conflicts=('xyce')
install=${_pkgname}.install
options=(!debug)

_git_tag="Release-${pkgver}"

# Trilinos package
# The last official version supported by Xyce is 14.4;
# However that one segfaults using ShyLu
#_trilinos_pkgver=14.4.0
_trilinos_pkgver=16.1.0
_trilinos_url="https://github.com/trilinos/Trilinos"
_doc_url="https://xyce.sandia.gov/files/xyce"

source=(
	"${pkgname}::git+${url}#tag=${_git_tag}"
	"trilinos::git+${_trilinos_url}#tag=trilinos-release-${_trilinos_pkgver//./-}"
	"0001-epextra-openmp-linkage-workaround.patch"
	"0002-multiple-plugin-fix.patch"
	"0003-fix-latex-doc-build.patch"
)
b2sums=(
	'6e51120fd8ba481bfd4a226f0a208eefc4511b4e666235a8715f1fa41d28329ce5ad467708d5081a93af2599b94eb4639dd0271dc8f8ecc34242f5bfaba57dc5'
    'ef9fe57c1aab698a38e8a35e070a9f8e23af1368cd162af065b0a7468a6bcf24cfc9277772b2f1aa86505e4ee7b9607620e44dfeb72ea83b494d4192d27443e8'
    '76bcd57791866166387af5bd4b2984b9344c766f0a838fd5d0f32ae7670d181a17470efc429aef774b7e6feca68d1d407211bfdee885eaf8536f751b304c76d2'
    '9651017d9f1548f27db0a73230a75aa404b3d2353cd229803056232cf9e3f985660553503cbf46de5435c129a40dac4ace38feb5e501ddb7c7f485edf2efea08'
    '5e34211b9e43acfe25bad80fd8a70c624f49cd9802fe70b30977a02a75f00799c443eea21494b488e9f0ca777211bce88e9b3a981b4d1f992f984768a2b35bda'
)
prepare() {
	(
		cd trilinos
		# For newer GCC versions there is a linkage issue between C and C++
		# Suitesparse handles this internally so remove the explicit extern C
		patch -Np1 < ../0001-epextra-openmp-linkage-workaround.patch
	)

	(
		cd "${pkgname}"
		# For multiple plugins (more than 2) we need to patch
		# see upstream issue: https://github.com/Xyce/Xyce/issues/148
		patch -Np1 < ../0002-multiple-plugin-fix.patch

		# Fix latex build issues
		# see upstream issue: https://github.com/Xyce/Xyce/issues/159
		patch -Np1 < ../0003-fix-latex-doc-build.patch
	)
}

build() {
	# Avoid having deprcated warnings all over
	export CFLAGS="${CFLAGS} -Wno-cpp"
	export CXXFLAGS="${CXXFLAGS} -Wno-cpp"
	
	# Trilinos
	cmake \
		-C "${pkgname}/cmake/trilinos/trilinos-new-base.cmake" \
		-DTrilinos_ENABLE_OpenMP="ON" \
		-DTrilinos_ENABLE_ShyLU_NodeBasker="ON" \
		-DTPL_ENABLE_METIS="ON" \
		-DTPL_ENABLE_ParMETIS="ON" \
		-DTPL_AMD_LIBRARY_DIRS="/usr/lib/" \
		-DTPL_AMD_INCLUDE_DIRS="/usr/include/suitesparse" \
		-DTeuchos_ENABLE_THREAD_SAFE=ON \
		-B build_trilinos \
		-S trilinos \
		-W no-dev \
		-W no-cpp \
		-D CMAKE_BUILD_TYPE=None \
		-D CMAKE_POSITION_INDEPENDENT_CODE=ON
	# Build Trilinos first
	cmake --build build_trilinos
	# "Install" trilinos
	DESTDIR="_trilinos" cmake --install build_trilinos

	# Build Xyce - using the built trilinos package
	cmake \
		-DXyce_PLUGIN_SUPPORT=ON \
		-DXyce_SHYLU=ON \
		-DXyce_AMESOS2_SHYLUBASKER=ON \
		-DTrilinos_DIR="${srcdir}/_trilinos/usr/local/lib/cmake/Trilinos" \
		-B build_xyce \
		-S "${pkgname}" \
		-W no-dev \
		-W no-cpp \
		-D CMAKE_BUILD_TYPE=None \
		-D CMAKE_INSTALL_PREFIX="/usr" \
		-D CMAKE_POSITION_INDEPENDENT_CODE=ON
	cmake --build build_xyce

	# Build documentation (only if latexmk is available)
	if command -v latexmk &> /dev/null; then
		(
			cd "${srcdir}/${pkgname}/doc/Users_Guide/"
			make
		)

		(
			cd "${srcdir}/${pkgname}/doc/Reference_Guide/"
			make
		)
	else
		echo "latexmk not installed => Skipping documentation"
	fi
}

package() {
	DESTDIR="${pkgdir}" cmake --install build_xyce
	# Remove 'admsXml' - Already have it from adms
	rm "${pkgdir}/usr/bin/admsXml"
	# Remove the /doc/ files
	rm -r "${pkgdir}/usr/doc"
	# Install the docs:
	(
		cd "${srcdir}/${pkgname}/doc"

		REFGUIDE="Reference_Guide/Xyce_RG.pdf"
		USERGUIDE="Users_Guide/Xyce_UG.pdf"
		# Reference Guide
		if [[ -e "${REFGUIDE}" ]]; then
			install -Dm0644 "${REFGUIDE}" "${pkgdir}/usr/share/doc/${pkgname}/Xyce_RG.pdf"
		fi

		# User guide
		if [[ -e "${USERGUIDE}" ]]; then
			install -Dm0644 "${USERGUIDE}" "${pkgdir}/usr/share/doc/${pkgname}/Xyce_UG.pdf"
		fi
	)
}
