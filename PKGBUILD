# Contributor : Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=realsr-ncnn-vulkan
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r1.1.g4262d64
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/Kiyamou/vapoursynth-realsr-ncnn-vulkan'
license=('MIT')
depends=('vapoursynth'
         'vulkan-icd-loader'
         )
makedepends=('git'
             'cmake'
             'vulkan-headers'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Kiyamou/VapourSynth-${_plug}.git"
        'git+https://github.com/Tencent/ncnn.git'
        'git+https://github.com/KhronosGroup/glslang.git'
        'https://github.com/nihui/realsr-ncnn-vulkan/raw/master/models/models-DF2K/x4.bin'
        'https://github.com/nihui/realsr-ncnn-vulkan/raw/master/models/models-DF2K/x4.param'
        'model-path.patch'
        )
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'a3f5eb53906ef54d5c5d125b2c9dd5f570d9dbb779e3d934df14b5375fd923c1'
            'a7f31e75518ad279c179202bf77da9eca3141124a67e5261d97235849e6cc323'
            'SKIP'
            )

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  cd ${_plug}
  git config submodule.deps/ncnn.url "${srcdir}/ncnn"
  git submodule update --init deps/ncnn

  # fix models path
  git apply < "$srcdir"/model-path.patch

  cd deps/ncnn
  git config submodule.glslang.url "${srcdir}/glslang"
  git submodule update --init glslang

}

build() {
  cd build
  cmake "../${_plug}" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DVAPOURSYNTH_INCLUDE_DIR=/usr/include/vapoursynth

  make
}

package(){
  install -Dm755 build/librsnv.so "$pkgdir"/usr/lib/vapoursynth/librsnv.so

  install -Dm644 x4.bin "$pkgdir"/usr/share/vapoursynth/"$_plug"/models/models-DF2K/x4.bin
  install -Dm644 x4.param "$pkgdir"/usr/share/vapoursynth/"$_plug"/models/models-DF2K/x4.param

  install -Dm644 "$_plug"/README.md "$pkgdir"/usr/share/doc/vapoursynth/plugins/"$_plug"/README
  install -Dm644 "$_plug"/LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
