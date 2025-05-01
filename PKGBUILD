# Maintainer: Anton Karmanov <a.karmanov@inventati.org>

_upstream_name='stompbox'
pkgname="${_upstream_name}-jack"
pkgver='0.1.13'
pkgrel=1
pkgdesc='Guitar amplification and effects library (headless JACK client)'
arch=('x86_64' 'aarch64')
url="https://github.com/mikeoliphant/${_upstream_name}"
license=('GPL-3.0-only')
groups=('pro-audio')
depends=('glibc' 'gcc-libs' 'jack')
makedepends=('git' 'libjack.so')
_dr_libs_ref='9cb7092ac8c75a82b5c6ea72652ca8d0091d7ffa'
_r8brain_free_ref='b3f0753d90b3325b8ea8a08fd699e8e6db26e5b5'
_wdl_ref='35d382f78b0c23f7d8bdff48e5069882d644c14c'
_neural_audio_ref='a1f54d48453b830c6eb6d966333ecf252e9e5219'
_neural_amp_modeler_core_ref='e181f61efb8d05d34add45b5eecb3893ff21177c'
_rt_neural_ref='5909c44909cd6100367f62cd04b348de85d57dbf'
_math_approx_ver='1.0.0'
source=(
  "stompbox-v${pkgver}::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  "https://github.com/mackron/dr_libs/archive/${_dr_libs_ref}.zip"
  "https://github.com/avaneev/r8brain-free-src/archive/${_r8brain_free_ref}.zip"
  "https://github.com/mikeoliphant/WDL/archive/${_wdl_ref}.zip"
  "https://github.com/mikeoliphant/NeuralAudio/archive/${_neural_audio_ref}.zip"
  "https://github.com/mikeoliphant/NeuralAmpModelerCore/archive/${_neural_amp_modeler_core_ref}.zip"
  "https://github.com/mikeoliphant/RTNeural/archive/${_rt_neural_ref}.zip"
  "math_approx-v${_math_approx_ver}::https://github.com/Chowdhury-DSP/math_approx/archive/refs/tags/v${_math_approx_ver}.tar.gz"
)
sha256sums=(
  '701cabb7880c9eea88ad241b382fde590f636707159c4ab1977c3faca8b478ad'
  '16775423774daf692c6665b89a5ed38e65fb60b42e5864d646debafc3f52e98d'
  'f0c76dc451fd8f48f2712d4f2ce42ebb483e545fe4cc4214fd6f526ae97a29ac'
  '72a37b261746825977126fcff8782e1e58a932c70b0ab40d859a8d529ee88559'
  '8fa435fbe7fc82c45e6e7a9750105676f56ac02b40c764e42e0113643e6f4fda'
  '1ca1369d196356e964862646b7e38500349f059a05473af78c8f11a075e69dda'
  'f3612ef85d1d272ba0b239890979d8282c0e9173ab917480725ccd27969e5f8d'
  '464e5097291f503c27b3a21c5727d58830b08d4476f0d6713d46a900bfae8dd1'
)
_main_src_dir="$_upstream_name-${pkgver}"

prepare() {
  submodules=(dr_libs r8brain-free-src WDL NeuralAudio)
  submodules_refs=("$_dr_libs_ref" "$_r8brain_free_ref" "$_wdl_ref" "$_neural_audio_ref")
  len=${#submodules[@]}
  for (( i=0; i<$len; i++ )); do
    submod_dir="${_main_src_dir}/Dependencies/${submodules[$i]}"
    rmdir "$submod_dir"
    ln -s -r "${submodules[$i]}-${submodules_refs[$i]}" "$submod_dir"
  done

  submodules=(NeuralAmpModelerCore RTNeural math_approx)
  submodules_refs=("$_neural_amp_modeler_core_ref" "$_rt_neural_ref" "$_math_approx_ver")
  len=${#submodules[@]}
  for (( i=0; i<$len; i++ )); do
    submod_dir="${_main_src_dir}/Dependencies/NeuralAudio/deps/${submodules[$i]}"
    rmdir "$submod_dir"
    ln -s -r "${submodules[$i]}-${submodules_refs[$i]}" "$submod_dir"
  done
}

build() {
  # TODO For v0.1.13. Try to remove on later versions.
  export CXXFLAGS+=' -Wno-error=format-security'

  cd "${_main_src_dir}/build/"
  cmake .. -DCMAKE_BUILD_TYPE='Release' 
  cmake --build stompbox-jack/
}

package() {
  cd "${srcdir}/${_main_src_dir}/build/"
  install -D -m 755 stompbox-jack/stompbox-jack -t "${pkgdir}/usr/bin/"

  cd "${srcdir}/${_main_src_dir}/"
  pwd
  ls -1
  install -D -m 644 CREDITS.md README.md -t "${pkgdir}/usr/share/docs/${_upstream_name}/"
}
