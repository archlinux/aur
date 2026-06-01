# Maintainer: Anton Karmanov <a.karmanov@inventati.org>

_upstream_name='Stompbox'
pkgname="stompbox-jack"
pkgver='0.2.2'
pkgrel=1
pkgdesc='Guitar amplification and effects library (headless JACK client)'
arch=('x86_64' 'aarch64')
url="https://github.com/mikeoliphant/${_upstream_name}"
license=('GPL-3.0-only' 'BSD-3-Clause' 'MIT' 'Unlicense' 'Zlib')
groups=('pro-audio')
depends=('glibc' 'jack' 'libgcc' 'libstdc++')
makedepends=('cmake' 'git' 'libjack.so')
_dr_libs_ref='a4b73d3d423e1cea0652b76d0806e7620337a40f'
_r8brain_free_ref='3c930bf6825c0cfea4a813210c83b1a650c820b5'
_wdl_ref='35d382f78b0c23f7d8bdff48e5069882d644c14c'
_neural_audio_ref='7bc4c24256f88b1a249eb13be706ee9856773ced'
_neural_amp_modeler_core_ref='5656639bb6dd65340369eeeb50e4d70c32a42922'
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
b2sums=(
  '7ef0f6bd4212bd10f78af704b9ac2a21346ff9cddb87711782f51bbd43ca4b7dc3f62c5b7b20effa06c80d78dbb51d2601f3265d97c154ba7d0d4a9df340fd78'
  '5a15a755f8e40fc473000d48d9cf3715121404a4725a5753aae33734739567e77abcb2d1bd94f9869e803854241385059ff635bdf8249264b604cc72f1d5c10e'
  'fc6fe2dd4e7cea9b9d51e7bc3c404d2877a50a96d94a63e40258dffe1327a939fd4e101697dc0f4b4c2f37dd4e1839de793c789ffce7099f7f0ffea5af100fda'
  'd82d52e24822282138bf6e7e2707a1ae14632f6a7dd40a1bda760e4bab44ffdba1532d7b0a8bd635f08f1d2b5d187b9066dfde18f2bc193bf1d6902279077ed3'
  '6d4f2cd5480b4ad30b416baa689a755622ee69bf76c22ff8f2d286508460ecc91ae62e8d69e8e06a677dda565c68deeea16a80cccde142fafb5f921a585e1e8d'
  '06412ca69a49d8cfbc9a7055ce3b34d78a98e43fe3de7c17cbdccd256273f0761590f6d0622bcca30f9e4893936a36f4efa840b1e0e9a6befe5897b88b73cb4a'
  '8fa7bf70e4a315f8c64df99cdb95201404c98c46af6a422ce09af0831356320d80f7537a5a17df7628658c0bd5db5450df90155256237e182e959f069ae2a1b7'
  'c0793af233dbdefde7d8397428b01f4edbb59cca791433f60acdb1eec91a31fc78e523571b0e84041ec08d843cd8ed8843f3c53d1bead462420f02c8027508ad'
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
