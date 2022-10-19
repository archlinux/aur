# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=rife-ncnn-vulkan
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=9.0.g6c6d0fa
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/HomeOfVapourSynthEvolution/VapourSynth-RIFE-ncnn-Vulkan'
license=('MIT')
depends=('vapoursynth')
makedepends=('git'
             'meson'
             'cmake'
             'vulkan-headers'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/HomeOfVapourSynthEvolution/VapourSynth-RIFE-ncnn-Vulkan.git"
        'git+https://github.com/Tencent/ncnn.git'
        'git+https://github.com/KhronosGroup/glslang.git'
        )
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            )
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d r)"
}

prepare() {
  mkdir -p build

  cd "${_plug}"
  git config submodule.subprojects/ncnn.url "${srcdir}/ncnn"
  git -c protocol.file.allow=always submodule update --init \
    subprojects/ncnn

  sed "s|models|${_plug}-models|g" -i RIFE/plugin.cpp

  cd subprojects/ncnn
  git config submodule.glslang.url "${srcdir}/glslang"
  git -c protocol.file.allow=always submodule update --init \
    glslang
}

build() {
  cd build
  arch-meson "../${_plug}" \
    --libdir /usr/lib/vapoursynth

  ninja
}

package(){
  DESTDIR="${pkgdir}" ninja -C build install

  mv "${pkgdir}/usr/lib/vapoursynth/models" "${pkgdir}/usr/lib/vapoursynth/${_plug}-models"

  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
  install -Dm644 "${_plug}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
