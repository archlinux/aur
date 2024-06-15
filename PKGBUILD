# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=mlrt
pkgname=vapoursynth-plugin-${_plug}-trt-runtime-git
pkgver=597.28c8c5f
pkgrel=1
pkgdesc="Plugin for VapourSynth: ${_plug} (TensorRT runtime: recommended for Nvidia GPUs)"
arch=('x86_64')
url='https://github.com/AmusementClub/vs-mlrt'
license=('LGPL')
depends=('vapoursynth' 'cuda' 'tensorrt')
makedepends=('git' 'ninja' 'cmake')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}-ov-runtime-git"
  "vapoursynth-plugin-${_plug}-ort-runtime-git"
  "vapoursynth-plugin-${_plug}-ncnn-runtime-git")
source=("${_plug}::git+https://github.com/AmusementClub/vs-mlrt.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.%s" "$_rev" "$_hash"
}

build() {
  cmake -S "${_plug}/vstrt" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DVAPOURSYNTH_INCLUDE_DIRECTORY="/usr/include/vapoursynth" \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS} -ffast-math"

  cmake --build build
}

package() {
  # The cmake script puts the library inside a `lib` dir, which we don't want, so we have to install it manually
  install -Dm755 "build/libvstrt.so" "${pkgdir}/usr/lib/vapoursynth/libvstrt.so"
  for i in $(find models* -type f); do install -Dm644 "${i}" "${pkgdir}/usr/lib/vapoursynth/${_plug}-models/${i}"; done

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
