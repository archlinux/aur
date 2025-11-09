#!/hint/bash
# Maintainer : SFN
# Contributor : bartus <arch-user-repoᘓbartus.33mail.com>

#Configuration:
#Use: makepkg VAR1=0 VAR2=1 to enable(1) disable(0) a feature
#Use: {yay,paru} --mflags=VAR1=0,VAR2=1
#Use: aurutils --margs=VAR1=0,VAR2=1
#Use: VAR1=0 VAR2=1 pamac

# Use FRAGMENT=#{commit,tag,brach}=xxx for bisect build
_fragment="${FRAGMENT:-#branch=master}"

# Use CUDA_ARCH to build for specific GPU architecture
# Supports: single arch (5.2) and list of archs (5.2;6.0), arch name (Maxwell) or auto (Auto)
[[ -v CUDA_ARCH ]]	&& _cuda_arch="-DCCTAG_CUDA_CC_LIST_INIT=${CUDA_ARCH}"

((DISABLE_CUDA))	&& _with_cuda=OFF	|| _with_cuda=ON	# Build without cuda support
((ENABLE_APPS))		&& _build_apps=ON	|| _build_apps=OFF	# Build the sample applications
((ENABLE_AVX2))		&& _enable_avx=ON	|| _enable_avx=OFF	# Enable AVX2 optimizations
((ENABLE_SERIALIZE))	&& _serialize=ON	|| _serialize=OFF	# Store all the output
((ENABLE_VISUAL_DEBUG))	&& _visual_debug=ON	|| _visual_debug=OFF	# Enable visual debug
((GPU_DETECT))		&& _cc_current=ON	|| _cc_current=OFF	# Detect local GPU arch
((THRUST_COPY_IF))	&& _no_thrust=ON	|| _no_thrust=OFF	# Don't use thrust::copy_if() (bug on cuda:7 with GTX 980/1080)
((ENABLE_DOC))		&& _build_doc=ON	|| _build_doc=OFF	# Build doc

# Unused cmake flags.
#option(CCTAG_NO_COUT "Disable output stream" ON)
#option(CCTAG_EIGEN_NO_ALIGN "Disable Eigen alignment" ON)
#option(CCTAG_USE_POSITION_INDEPENDENT_CODE "Generate position independent code." ON)

pkgname=cctag
pkgver=1.0.4
_src_dir="CCTag-${pkgver}"
pkgrel=2
pkgdesc="Detection of CCTag markers made up of concentric circles."
arch=('x86_64')
url="https://github.com/alicevision/CCTag"
license=('MPL2')
depends=(boost-libs tbb)
makedepends=(boost cmake eigen ninja opencv)
# Configuration specific dependencis:
((DISABLE_CUDA)) || { makedepends+=(cuda); optdepends+=('cuda: for cuda detector'); }
((ENABLE_APPS)) && depends+=(devil2 qt5-base)
((ENABLE_DOC)) && makedepends+=(python-sphinx doxygen)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f4ced6138419f4ad09d62d4373738c172586c91068faff8bf08c2caa5e76d516')

prepare () {
    cd "${srcdir}/${_src_dir}"
    # Don't try to compile for unsupported CUDA arch's
    sed -e 's|set(CUDA_MIN_CC 50|set(CUDA_MIN_CC 75|g' -i cmake/ChooseCudaCC.cmake
    # Update CXX standard to use newer CUDA libs
    sed -e 's|CMAKE_CXX_STANDARD 14|CMAKE_CXX_STANDARD 17|g' \
        -e 's|CCTAG_CXX_STANDARD 14|CCTAG_CXX_STANDARD 17|g' \
        -i CMakeLists.txt
    # Disable lto for Cuda objects as it's broken
    sed -e 's|\(CUDA_NVCC_FLAGS}\)|\1;-Xcompiler=-fno-lto|g' -i src/CMakeLists.txt
    # eigen 5.x compat
    sed -i "s|\${CCTAG_EIGEN_REQUIRED_VERSION}||g" CMakeLists.txt
    sed -i "s|@CCTAG_EIGEN_REQUIRED_VERSION@||g" cmake/Config.cmake.in
    # Boost 1.89+ compat
    sed -i "s|;system;|;|g" CMakeLists.txt
    sed -i "s| Boost::system||g" src/CMakeLists.txt
}

build() {
	cmake -S "${srcdir}/${_src_dir}" -B build -G Ninja \
		-DCUDA_HOST_COMPILER=${NVCC_CCBIN} \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_SHARED_LIBS=ON \
		-DCCTAG_WITH_CUDA="$_with_cuda" \
		-DCCTAG_BUILD_APPS="$_build_apps" \
		-DCCTAG_BUILD_DOC="$_build_doc" \
		-DCCTAG_ENABLE_SIMD_AVX2="$_enable_avx" \
		-DCCTAG_SERIALIZE="$_serialize" \
		-DCCTAG_VISUAL_DEBUG="$_visual_debug" \
		-DCCTAG_CUDA_CC_CURRENT_ONLY="$_cc_current" \
		-DCCTAG_NO_THRUST_COPY_IF="$_no_thrust" \
		$_cuda_arch
	ninja -C build
}

package() {
	DESTDIR="${pkgdir}" ninja -C build install
}
# vim:set ts=8:
