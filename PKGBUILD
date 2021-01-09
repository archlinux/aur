# Maintainer : Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=waifu2x-ncnn-vulkan
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r3.1.gc2316e0
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/Nlzy/vapoursynth-waifu2x-ncnn-vulkan'
license=('MIT')
depends=('vapoursynth'
         'vulkan-icd-loader'
         )
makedepends=('git'
             'cmake'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Nlzy/VapourSynth-${_plug}.git"
        'git+https://github.com/Tencent/ncnn.git'
        'git+https://github.com/KhronosGroup/glslang.git'
        'https://github.com/Nlzy/vapoursynth-waifu2x-ncnn-vulkan/releases/download/r0.1/models.7z'
        )
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'e3b7b0b71ca606031821ac5d63b4ff25ab6874e8521521585de4a308b2f974c9'
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

  # rename models path
  sed "s|models-|${_plug}-models/models-|g" -i src/vsw2xnvk.cpp

  cd deps/ncnn
  git config submodule.glslang.url "${srcdir}/glslang"
  git submodule update --init glslang

}

build() {
  cd build
  cmake "../${_plug}" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package(){
  install -Dm755 "build/libvsw2xnvk.so" "${pkgdir}/usr/lib/vapoursynth/libvsw2xnvk.so"

  for i in $(find models* -type f); do install -Dm644 "${i}"  "${pkgdir}/usr/lib/vapoursynth/${_plug}-models/${i}"; done

  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"
  install -Dm644 "${_plug}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
