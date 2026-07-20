# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=mlrt
pkgname=vapoursynth-plugin-${_plug}-migx-runtime-git
pkgver=786.83b0180
pkgrel=2
pkgdesc="Plugin for VapourSynth: ${_plug} (MIGraphX runtime)"
arch=('x86_64')
url='https://github.com/AmusementClub/vs-mlrt'
license=('GPL-3.0-only')
depends=('vapoursynth' 'migraphx')
makedepends=('git' 'ninja' 'cmake' 'jq' 'vapoursynth-api3-headers')
optdepends=()
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")

# Function to fetch the latest release version
get_latest_release_version() {
	curl --silent "https://api.github.com/repos/AmusementClub/vs-mlrt/releases/latest" | jq -r .tag_name
}

# Fetch the latest release version
latest_release=$(get_latest_release_version)

source=(
	"${_plug}::git+https://github.com/AmusementClub/vs-mlrt.git"
	"models-${latest_release}.7z::https://github.com/AmusementClub/vs-mlrt/releases/download/${latest_release}/models.${latest_release}.7z"
)
sha256sums=('SKIP' 'SKIP')

pkgver() {
	cd "${_plug}"

	_rev=$(git rev-list --count --all)
	_hash=$(git rev-parse --short HEAD)
	printf "%s.%s" "$_rev" "$_hash"
}

build() {
	cmake -S "${_plug}/vsmigx" -B build -G Ninja -Wno-dev -LA \
		-D CMAKE_BUILD_TYPE=Release \
		-D VAPOURSYNTH_INCLUDE_DIRECTORY="/usr/include/vapoursynth" \
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
	site_packages="$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"
	PLUGINDIR=$(python -c "import vapoursynth; print(vapoursynth.get_plugin_dir())")

	# The cmake script puts the library inside a `lib` dir, which we don't want, so we have to install it manually
	install -Dm755 "build/libvsmigx.so" "${pkgdir}${PLUGINDIR}/libvsmigx.so"
	# The plugin looks for this binary in this specific location, so make a symlink to it
	mkdir "${pkgdir}${PLUGINDIR}/vsmlrt-hip"
	ln -s /opt/rocm/bin/migraphx-driver "${pkgdir}${PLUGINDIR}/vsmlrt-hip/migraphx-driver"
	for i in $(find models* -type f); do install -Dm644 "${i}" "${pkgdir}${PLUGINDIR}/${i}"; done

	install -Dm644 "${_plug}/scripts/vsmlrt.py" "${pkgdir}${site_packages}/vsmlrt.py"

	install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/tools/${_plug}/README.md"
	install -Dm644 "${_plug}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
