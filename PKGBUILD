# Maintainer: Anton Karmanov <a.karmanov@inventati.org>
#
# Attribution to `neural-amp-modeler-lv2` package maintainers for main plugin build logic
#
# Set`USE_NATIVE_ARCH=ON` env variable for `x86-64-v3` microarchitecture level

_base_url='https://github.com/brummer10'
_base_name='neural-amp-modeler-ui'

pkgname="${_base_name}-lv2"
pkgver='r45.d34a9a6'
pkgrel=2
pkgdesc='Neural Amp Modeler LV2 plugin with GUI'
arch=('x86_64')
url="${_base_url}/${_base_name}"
license=('0BSD' 'GPL-3.0-only' 'BSD-3-Clause' 'MIT')
groups=('pro-audio' 'lv2-plugins')
depends=('cairo' 'glibc' 'gcc-libs' 'libx11')
makedepends=('cmake' 'lv2')
optdepends=('lv2-host: to use the plugin')
conflicts=('neural-amp-modeler-lv2')
provides=('neural-amp-modeler-lv2')

declare -g -A _refs=(
  ["${_base_name}"]='d34a9a66e9ae3a4811e9bcf6df420347e23638b0'
  ['neural-amp-modeler-lv2']='ce7cbeb8f3824c4a7d2f67976edd753b81ac9d90'
  ['libxputty']='4299c46dfde7ec66ae8309435914fa841a4ac15a'
  ['NeuralAudio']='cddc6afcd16f2252506d998a557b30071a25bfdf'
  ['NeuralAmpModelerCore']='e181f61efb8d05d34add45b5eecb3893ff21177c'
  ['RTNeural']='5909c44909cd6100367f62cd04b348de85d57dbf'
  ['math_approx']='f6d55e70f0c5e888d3a0c4e252b02b530210c78a'
  ['xsimd']='a00c81f7b9e808a42aedcf7da2fbb1f9a636da34'
)

_nam_ui_src_dir="${_base_name}-${_refs["$_base_name"]}"
_nam_src_dir="neural-amp-modeler-lv2-${_refs[neural-amp-modeler-lv2]}"

source=(
  "${_nam_ui_src_dir}.tgz::${_base_url}/${_base_name}/archive/${_refs["$_base_name"]}.tar.gz"
  "libxputty-${_refs[libxputty]}.tgz::${_base_url}/libxputty/archive/${_refs[libxputty]}.tar.gz"
  "${_nam_src_dir}.tgz::https://github.com/mikeoliphant/neural-amp-modeler-lv2/archive/${_refs[neural-amp-modeler-lv2]}.tar.gz"
  "NeuralAudio-${_refs[NeuralAudio]}.tgz::https://github.com/mikeoliphant/NeuralAudio/archive/${_refs[NeuralAudio]}.tar.gz"
  "NeuralAmpModelerCore-${_refs[NeuralAmpModelerCore]}.tgz::https://github.com/mikeoliphant/NeuralAmpModelerCore/archive/${_refs[NeuralAmpModelerCore]}.tar.gz"
  "RTNeural-${_refs[RTNeural]}.tgz::https://github.com/mikeoliphant/RTNeural/archive/${_refs[RTNeural]}.tar.gz"
  "math_approx-${_refs[math_approx]}.tgz::https://github.com/Chowdhury-DSP/math_approx/archive/${_refs[math_approx]}.tar.gz"
  "xsimd-${_refs[xsimd]}.tgz::https://github.com/xtensor-stack/xsimd/archive/${_refs[xsimd]}.tar.gz"
)
sha256sums=(
  'cb2eeabcea20453b87d12cac40d5af9610b66be2ac1bcf4330ad3cff1dc3c878'
  'ae15a2c27fe23ee9cee581461317d8fc632ce46f18acd33e982b5b6657eadeb7'
  '8de22ca3c464d2ac45b064329d047d082ba64f6e23315e411d5039c2288fe716'
  'b1fcaf3ada0e90b9ba6eb633e8564413c11882d685d1e33128166946bdbdf937'
  'e732c6e204597d4059aa01f5f416034383dac13d26859b97ef4b97ba0cb3ab39'
  '76f7f6160e681acbb4dd1fff4cfc23a3b61f51f0df2f8b3b5449c010628e4013'
  '3c638ff556d7874c01ccc327a84b9b09ed2334846341195e3f0d26803418a432'
  'f1c485107ae0b29069a88bf9619d2d93eaed8321ae03a83d7fc437da85d5b9fd'
)

function _symlink_mod() {
  local mod="$1"
  rmdir "$mod"
  ln -sr "${srcdir}/${mod}-${_refs["${mod}"]}" "${mod}"
}

prepare() {
  local mod

  cd "${srcdir}/${_nam_ui_src_dir}"
  _symlink_mod libxputty

  cd "${srcdir}/${_nam_src_dir}/deps"
  _symlink_mod NeuralAudio

  cd NeuralAudio/deps
  for mod in NeuralAmpModelerCore RTNeural math_approx; do
    _symlink_mod "$mod"
  done

  cd RTNeural/modules
  _symlink_mod xsimd
}

build() {
  cd "${srcdir}/${_nam_src_dir}"
  cmake \
    -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_NATIVE_ARCH=${USE_NATIVE_ARCH:-OFF} \
    -B build -S ./
  cmake --build 'build'

  cd "${srcdir}/${_nam_ui_src_dir}"
  make
}

package() {
  local ibundle='neural_amp_modeler_ui.lv2'

  cd "${srcdir}/${_nam_src_dir}"
  DESTDIR="$pkgdir" cmake --install build
  mv "${pkgdir}/usr/lib/lv2/neural_amp_modeler.lv2" "${pkgdir}/usr/lib/lv2/${ibundle}"
  install -vDm 644 README.md -t \
    "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm 644 deps/NeuralAudio/LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-NeuralAudio"
  install -vDm 644 deps/NeuralAudio/deps/NeuralAmpModelerCore/LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-NeuralAmpModelerCore"
  install -vDm 644 deps/NeuralAudio/deps/RTNeural/LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-RTNeural"
  install -vDm 644 deps/NeuralAudio/deps/RTNeural-NAM/LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-RTNeural-NAM"
  install -vDm 644 deps/NeuralAudio/deps/math_approx/LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-math_approx"
  install -vDm 644 deps/NeuralAudio/deps/RTNeural/modules/xsimd/LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-xsimd"

  cd "${srcdir}/${_nam_ui_src_dir}"
  make DESTDIR="$pkgdir" IBUNDLE="$ibundle" install
}
