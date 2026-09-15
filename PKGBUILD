# Maintainer: TheFeelTrain <the@feeltra.in>
# Contributor: Josh Holmer <jholmer.in@gmail.com>

_plug=vs-mlrt
pkgname=vapoursynth-plugin-mlrt-migx-runtime-git
pkgver=672.c2e33e0
pkgrel=1
pkgdesc="Plugin for VapourSynth: ${_plug} (MIGraphX runtime)"
arch=('x86_64')
url='https://github.com/Ichunjo/vs-mlrt'
license=('GPL-3.0-only')
depends=(
	'vapoursynth' 
	'migraphx'
	'python'
)
makedepends=(
	'git' 
	'ninja' 
	'cmake' 
	'jq'
)
optdepends=()
provides=('vapoursynth-plugin-mlrt')
conflicts=('vapoursynth-plugin-mlrt')

source=(
	"${_plug}::git+${url}.git"
	"https://raw.githubusercontent.com/Jaded-Encoding-Thaumaturgy/vs-wheels/refs/heads/master/vsmlrt/migx/CMakeLists.txt"
)
sha256sums=(
	'SKIP'
	'SKIP'
)

pkgver() {
	cd "${_plug}"
	_rev=$(git rev-list --count --all)
	_hash=$(git rev-parse --short HEAD)
	printf "%s.%s" "$_rev" "$_hash"
}

build() {
	cmake -S . -B build -G Ninja -Wno-dev -LA \
		-D CMAKE_BUILD_TYPE=Release \
		-D CMAKE_CXX_COMPILER=g++ \
		-D CMAKE_CXX_FLAGS="${CXXFLAGS} -Wall -ffast-math" \
		-D migraphx_DIR=/opt/rocm/lib/cmake/migraphx \
		-D MIOpen_DIR=/opt/rocm/lib/cmake/miopen \
		-D hip_DIR=/opt/rocm/lib/cmake/hip \
		-D AMDDeviceLibs_DIR=/opt/rocm/lib/cmake/AMDDeviceLibs \
		-D amd_comgr_DIR=/opt/rocm/lib/cmake/amd_comgr \
		-D hsa-runtime64_DIR=/opt/rocm/lib/cmake/hsa-runtime64 \
		-D rocblas_DIR=/opt/rocm/lib/cmake/rocblas \
		-D hipblaslt_DIR=/opt/rocm/lib/cmake/hipblaslt \
		-D CMAKE_PREFIX_PATH=/opt/rocm/lib/cmake

	cmake --build build
}

package() {
    _plugindir=$(python3 -c "import vapoursynth; print(vapoursynth.get_plugin_dir())")
	cmake --install build --prefix "${pkgdir}${_plugindir}"
}
