# Maintainer: Anton Karmanov <a.karmanov@inventati.org>
#
# Attribution to `neural-amp-modeler-lv2` package maintainers for main plugin build logic
#
# Set`USE_NATIVE_ARCH=ON` env variable for `x86-64-v3` microarchitecture level
#export USE_NATIVE_ARCH=ON

_base_url='https://github.com/brummer10'
_base_name='neural-amp-modeler-ui'

pkgname="${_base_name}-lv2"
pkgver='r49.ee23316'  # COMMIT_NUM.SHORT_SHA
pkgrel=2
pkgdesc='Neural Amp Modeler LV2 plugin with GUI'
arch=('x86_64')
url="${_base_url}/${_base_name}"
license=('0BSD' 'GPL-3.0-only' 'BSD-3-Clause' 'MIT')
groups=('pro-audio' 'lv2-plugins')
depends=('cairo' 'glibc' 'libgcc' 'libstdc++' 'libx11')
makedepends=('cmake' 'lv2')
optdepends=('lv2-host: to use the plugin')
conflicts=('neural-amp-modeler-lv2')
provides=('neural-amp-modeler-lv2')
b2sums=(
  'fc0ffa0d7f64d1a4b6448ed28356ec27e17ef7cf4fa7b7b4899806e4cb9a1522e8339f8082eedaf096886d1e5d7db1141c3132c083a6c47af3abbdfc33d3dd08'
  'e5edec2758554df0467b39755cd842237a3f97c79d7a8dd0b72caf1a31af00fae9e4323e945fa68031fa38291c58fae69affbfa2e19b6044906fa605f27259e3'
  '1279b1cebe7f94e5675eda6ea262f3f21244554960f74631c07696dbe4a6584ec57eb91a0d4dd5b8fca6085b5cfea9ae5f5c1b5a4cd77a1f427f9878e46e44dd'
  'b62c0e75f836f998b2f91b7dbb7911f0014f0a9b49295f216140b11cd2bd8ee99aba3dfe519d0fad596f6242c4449d08ba899df28ff4cfba3857be257dd23f30'
  'cd8bfa952e0ba51905ee1fff482e91668ce4f7d589941d7974e674e7761e0ef4b1d33b0005c165b827a3269bc592db5f477f5db4f007cbe5b95e6e9eaa2ae0de'
  '8fa7bf70e4a315f8c64df99cdb95201404c98c46af6a422ce09af0831356320d80f7537a5a17df7628658c0bd5db5450df90155256237e182e959f069ae2a1b7'
  'c0793af233dbdefde7d8397428b01f4edbb59cca791433f60acdb1eec91a31fc78e523571b0e84041ec08d843cd8ed8843f3c53d1bead462420f02c8027508ad'
  'f45742815832983586d367ec879cd411fcde42c7f8196bd8be3e41a9a5197b0aa9b431b4d7f52ee79dfe0f8d3391fd5ebbe47ec7374613b28c318c0a23ddafe0'
)

declare -g -A _refs=(
  ["${_base_name}"]='ee23316ceb47256273414dda1a5b640f35d41d4e'
  ['neural-amp-modeler-lv2']='35c28a52ec0a89af16208e953544dc96e13dde20'
  ['libxputty']='4299c46dfde7ec66ae8309435914fa841a4ac15a'
  ['NeuralAudio']='df230ab284770e18014d5f7de5059b062a20a8b0'
  ['NeuralAmpModelerCore']='4c0ee78b71abd5eb20aec58562e7540f43caac3b'
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

_symlink_mod() {
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
  install -vDm 644 deps/NeuralAudio/deps/math_approx/LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-math_approx"
  install -vDm 644 deps/NeuralAudio/deps/RTNeural/modules/xsimd/LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-xsimd"

  cd "${srcdir}/${_nam_ui_src_dir}"
  make DESTDIR="$pkgdir" IBUNDLE="$ibundle" install
}
