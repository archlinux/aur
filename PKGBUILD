# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=mlrt
pkgname=vapoursynth-plugin-${_plug}-ort-runtime-git
pkgver=683.845f2fb
pkgrel=1
pkgdesc="Plugin for VapourSynth: ${_plug} (ONNX runtime)"
arch=('x86_64')
url='https://github.com/AmusementClub/vs-mlrt'
license=('LGPL')
depends=('vapoursynth' 'cuda' 'cudnn' 'nccl' 'onnx' 'onnxruntime' 'protobuf')
makedepends=('git' 'ninja' 'cmake' 'jq')
optdepends=(
  "onnxruntime-opt: AVX2-optimized onnxruntime"
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")

# Function to fetch the latest release version
get_latest_release_version() {
  curl --silent "https://api.github.com/repos/AmusementClub/vs-mlrt/releases/latest" | jq -r .tag_name
}

# Fetch the latest release version
latest_release=$(get_latest_release_version)

source=("${_plug}::git+https://github.com/AmusementClub/vs-mlrt.git"
  "models-${latest_release}.7z::https://github.com/AmusementClub/vs-mlrt/releases/download/${latest_release}/models.${latest_release}.7z")
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd "${_plug}"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.%s" "$_rev" "$_hash"
}

build() {
  cmake -S "${_plug}/vsort" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DVAPOURSYNTH_INCLUDE_DIRECTORY="/usr/include/vapoursynth" \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS} -ffast-math" \
    -D ENABLE_CUDA=1 \
    -D CUDAToolkit_ROOT=/opt/cuda \
    -D ONNX_RUNTIME_API_DIRECTORY=/usr/include/onnxruntime \
    -D ONNX_RUNTIME_LIB_DIRECTORY=/usr/lib \
    -D CMAKE_CXX_STANDARD=20

  cmake --build build
}

package() {
  # The cmake script puts the library inside a `lib` dir, which we don't want, so we have to install it manually
  install -Dm755 "build/libvsort.so" "${pkgdir}/usr/lib/vapoursynth/libvsort.so"
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
