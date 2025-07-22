# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=mlrt
pkgname=vapoursynth-plugin-${_plug}-migx-runtime-git
pkgver=725.467e4fc
pkgrel=1
pkgdesc="Plugin for VapourSynth: ${_plug} (MIGraphX runtime)"
arch=('x86_64')
url='https://github.com/AmusementClub/vs-mlrt'
license=('GPL-3.0')
depends=('vapoursynth' 'opencl-amd-dev')
makedepends=('git' 'ninja' 'cmake' 'jq')
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
        -D CMAKE_PREFIX_PATH=/opt/rocm/lib/cmake \

  cmake --build build
}

package() {
  # The cmake script puts the library inside a `lib` dir, which we don't want, so we have to install it manually
  install -Dm755 "build/libvsmigx.so" "${pkgdir}/usr/lib/vapoursynth/libvsmigx.so"
  # The plugin looks for this binary in this specific location, so make a symlink to it
  mkdir "${pkgdir}/usr/lib/vapoursynth/vsmlrt-hip"
  ln -s /opt/rocm/bin/migraphx-driver "${pkgdir}/usr/lib/vapoursynth/vsmlrt-hip/migraphx-driver"
  for i in $(find models* -type f); do install -Dm644 "${i}" "${pkgdir}/usr/lib/vapoursynth/${i}"; done

  _sitedir=$(python -c 'import site; print(site.getsitepackages())')
  # remove first two and last two characters, which are array and string delimiters
  _sitedir="${_sitedir#?}"
  _sitedir="${_sitedir#?}"
  _sitedir="${_sitedir%?}"
  _sitedir="${_sitedir%?}"
  install -Dm644 "${_plug}/scripts/vsmlrt.py" "${pkgdir}${_sitedir}/vsmlrt.py"

  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/tools/${_plug}/README.md"
  install -Dm644 "${_plug}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
