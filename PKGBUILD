#!/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
options+=(debug !strip)

#Configuration:
#Use: makepkg VAR1=0 VAR2=1 to enable(1) disable(0) a feature
#Use: {yay,paru} --mflags=VAR1=0,VAR2=1
#Use: aurutils --margs=VAR1=0,VAR2=1
#Use: VAR1=0 VAR2=1 pamac

# Use FRAGMENT=#{commit,tag,brach}=xxx for bisect build
_fragment="${FRAGMENT:-#branch=master}"

# Use CUDA_ARCH to build for specific GPU architecture
# Supports: single arch (5.2) and list of archs (5.2;6.0), arch name (Maxwell) or auto (Auto)
[[ -v CUDA_ARCH ]] && _cuda_arch="-DCCTAG_CUDA_CC_LIST_INIT=${CUDA_ARCH}"

((DISABLE_CUDA)) && _with_cuda=OFF || _with_cuda=ON	# Build without cuda support
((ENABLE_APPS)) && _build_apps=ON || _build_apps=OFF	# Build the sample applications
((ENABLE_AVX2)) && _enable_avx=ON || _enable_avx=OFF	# Enable AVX2 optimizations
((ENABLE_SERIALIZE)) && _serialize=ON || _serialize=OFF	# Store all the output
((ENABLE_VISUAL_DEBUG)) && _visual_debug=ON || _visual_debug=OFF # Enable visual debug
((GPU_DETECT)) && _cc_current=ON || _cc_current=OFF	# Detect local GPU arch
((THRUST_COPY_IF)) && _no_thrust=ON || _no_thrust=OFF	# Don't use thrust::copy_if() ( bug on cuda:7 with GTX 980/1080
((ENABLE_DOC)) && _build_doc=ON || _build_doc=OFF	# Build doc
((ENABLE_DOC)) && makedepends+=(python-sphinx doxygen)

# Unused cmake flags.
#option(CCTAG_NO_COUT "Disable output stream" ON)
#option(CCTAG_EIGEN_NO_ALIGN "Disable Eigen alignment" ON)
#option(CCTAG_USE_POSITION_INDEPENDENT_CODE "Generate position independent code." ON)

pkgname=cctag
pkgver=1.0.0
_src_dir="CCTag-${pkgver}"
pkgrel=1
pkgdesc="Detection of CCTag markers made up of concentric circles."
arch=('i686' 'x86_64')
url="https://github.com/alicevision/CCTag"
license=('MPL2')
depends=(boost-libs tbb)
makedepends=(boost cmake eigen ninja)
# Configuration specific dependencis:
((DISABLE_CUDA)) || { makedepends+=(cuda); optdepends+=('cuda: for cuda detector'); }
((ENABLE_APPS)) && depends+=(devil2 opencv qt5-base)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
	"fix_boost_math.patch::https://github.com/alicevision/CCTag/pull/166.diff")
sha256sums=('0b40506506219cc839424496871e8d392311ed4ae0512f0740e8111a5da44796'
            '2ce981c55538849e667dab168d88c16f0006c9bb76846e18300495b95a853141')

prepare() {
# Fix missing -lboostmath for geom_elipse.cpp
	patch -d "${srcdir}/${_src_dir}" -Np1 -i "${srcdir}"/fix_boost_math.patch
}

build() {
	cmake -S "${srcdir}/${_src_dir}" -B build -G Ninja \
		-DCUDA_HOST_COMPILER=/usr/bin/gcc-10 \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DBUILD_SHARED_LIBS=ON \
		-DCCTAG_WITH_CUDA="$_with_cuda" \
		-DCCTAG_BUILD_APPS="$_build_apps" \
		-DCCTAG_ENABLE_SIMD_AVX2="$_enable_avx" \
		-DCCTAG_SERIALIZE="$_serialize" \
		-DCCTAG_VISUAL_DEBUG="$_visual_debug" \
		-DCCTAG_CUDA_CC_CURRENT_ONLY="$_cc_current" \
		-DCCTAG_NO_THRUST_COPY_IF="$_no_thrust" \
		"$_cuda_arch"
	ninja -C build
}

package() {
	DESTDIR="${pkgdir}" ninja -C build install
}
# vim:set tabstop=8:
