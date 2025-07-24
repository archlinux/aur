# Maintainer: Anton Karmanov <a.karmanov@inventati.org>

_upstream_name='stompbox'
pkgname="${_upstream_name}-jack"
pkgver='0.1.15'
pkgrel=2
pkgdesc='Guitar amplification and effects library (headless JACK client)'
arch=('x86_64' 'aarch64')
url="https://github.com/mikeoliphant/${_upstream_name}"
license=('GPL-3.0-only' 'BSD-3-Clause' 'MIT' 'Unlicense' 'Zlib')
groups=('pro-audio')
depends=('glibc' 'gcc-libs' 'jack')
makedepends=('git' 'libjack.so')
_dr_libs_ref='a4b73d3d423e1cea0652b76d0806e7620337a40f'
_r8brain_free_ref='3c930bf6825c0cfea4a813210c83b1a650c820b5'
_wdl_ref='35d382f78b0c23f7d8bdff48e5069882d644c14c'
_neural_audio_ref='85a4c4dc6c0911df560d77eb465f7719166e488e'
_neural_amp_modeler_core_ref='e181f61efb8d05d34add45b5eecb3893ff21177c'
_rt_neural_ref='5909c44909cd6100367f62cd04b348de85d57dbf'
_math_approx_ref='f6d55e70f0c5e888d3a0c4e252b02b530210c78a'
source=(
  "stompbox-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  "https://github.com/mackron/dr_libs/archive/${_dr_libs_ref}.tar.gz"
  "https://github.com/avaneev/r8brain-free-src/archive/${_r8brain_free_ref}.tar.gz"
  "https://github.com/mikeoliphant/WDL/archive/${_wdl_ref}.tar.gz"
  "https://github.com/mikeoliphant/NeuralAudio/archive/${_neural_audio_ref}.tar.gz"
  "https://github.com/mikeoliphant/NeuralAmpModelerCore/archive/${_neural_amp_modeler_core_ref}.tar.gz"
  "https://github.com/mikeoliphant/RTNeural/archive/${_rt_neural_ref}.tar.gz"
  "https://github.com/Chowdhury-DSP/math_approx/archive/${_math_approx_ref}.tar.gz"
)
sha256sums=(
  '30d3412b7e17b9f8774df73af4fbe02056f700835ff9819d6a30252feed00705'
  'adab9ee4b7ef891cedd4248c1c1f5bea20ec9fee522c8546bd96effc162f34bd'
  'e7940af26d0487f1f03cd0d2a94ac91bc96c554cfe50969fa6e330b0439c6f12'
  '2feb38cd3b26168bd4b57bbb0f29e9dd5754d62901c97b7d3c2d6f6d0c5b67ef'
  '5f5124f9d084f91eb5abc8c05122550ed8c28b3df5cc985d05b3584fb4100ae3'
  'e732c6e204597d4059aa01f5f416034383dac13d26859b97ef4b97ba0cb3ab39'
  '76f7f6160e681acbb4dd1fff4cfc23a3b61f51f0df2f8b3b5449c010628e4013'
  '3c638ff556d7874c01ccc327a84b9b09ed2334846341195e3f0d26803418a432'
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
  submodules_refs=("$_neural_amp_modeler_core_ref" "$_rt_neural_ref" "$_math_approx_ref")
  len=${#submodules[@]}
  for (( i=0; i<$len; i++ )); do
    submod_dir="${_main_src_dir}/Dependencies/NeuralAudio/deps/${submodules[$i]}"
    rmdir "$submod_dir"
    ln -s -r "${submodules[$i]}-${submodules_refs[$i]}" "$submod_dir"
  done
}

build() {
  cd "${_main_src_dir}/build/"
  cmake .. -DCMAKE_BUILD_TYPE='Release' 
  cmake --build stompbox-jack/
}

package() {
  cd "${srcdir}/${_main_src_dir}/build/"
  install -D -m 755 stompbox-jack/stompbox-jack -t "${pkgdir}/usr/bin/"

  cd "${srcdir}/${_main_src_dir}/"
  install -D -m 644 CREDITS.md README.md -t "${pkgdir}/usr/share/docs/${_upstream_name}/"

  install_license() {
    local dep=$1
    local lic_dir="${pkgdir}/usr/share/licenses/${_upstream_name}/"
    install -D -m 644 "${dep}/LICENSE" "${lic_dir}/LICENSE_${dep}"
  }

  cd "${srcdir}/${_main_src_dir}/Dependencies/"
  install_license NeuralAudio
  install_license r8brain-free-src
  install_license dr_libs

  cd "${srcdir}/${_main_src_dir}/Dependencies/NeuralAudio/deps/"
  install_license NeuralAmpModelerCore
  install_license RTNeural
  install_license math_approx
}
