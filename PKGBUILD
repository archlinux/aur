# Maintainer : Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=waifu2x-ncnn-vulkan
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r2.0.g22c5ef4
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
             'ncnn-git'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Nlzy/VapourSynth-${_plug}.git"
        'https://github.com/Nlzy/vapoursynth-waifu2x-ncnn-vulkan/releases/download/r0.1/models.7z'
        )
sha256sums=('SKIP'
            'e3b7b0b71ca606031821ac5d63b4ff25ab6874e8521521585de4a308b2f974c9'
            )

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  # rename models path
  sed "s|models-|${_plug}-models/|g" -i "${_plug}/src/vsw2xnvk.cpp"
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

  install -dm777 "${pkgdir}/usr/lib/vapoursynth/${_plug}-models"
  install -dm777 "${pkgdir}/usr/lib/vapoursynth/${_plug}-models/cunet"
  install -dm777 "${pkgdir}/usr/lib/vapoursynth/${_plug}-models/upconv_7_anime_style_art_rgb"
  install -dm777 "${pkgdir}/usr/lib/vapoursynth/${_plug}-models/upconv_7_photo"

  install -Dm644 models-cunet/*  "${pkgdir}/usr/lib/vapoursynth/${_plug}-models/cunet"
  install -Dm644 models-upconv_7_anime_style_art_rgb/*  "${pkgdir}/usr/lib/vapoursynth/${_plug}-models/upconv_7_anime_style_art_rgb"
  install -Dm644 models-upconv_7_photo/*  "${pkgdir}/usr/lib/vapoursynth/${_plug}-models/upconv_7_photo"

  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"
  install -Dm644 "${_plug}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
