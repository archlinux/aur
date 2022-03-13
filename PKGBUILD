# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=fsrcnn-ncnn-vulkan
pkgname="vapoursynth-plugin-${_plug}-git"
pkgver=r3.c9dad37
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/Sg4Dylan/vapoursynth-fsrcnn-ncnn-vulkan'
license=('MIT')
depends=('vapoursynth'
         'opencv-cuda'
         'vulkan-icd-loader'
         'glslang'
         )
makedepends=('git'
             'cmake'
             'ncnn-git'
             'vulkan-headers'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Sg4Dylan/vapoursynth-${_plug}.git"
#         'https://github.com/Nlzy/vapoursynth-waifu2x-ncnn-vulkan/releases/download/r0.1/models.7z'
        "esee.patch"
        )
sha256sums=('SKIP'
#             'e3b7b0b71ca606031821ac5d63b4ff25ab6874e8521521585de4a308b2f974c9'
            'f966efbae46f821beae06b3641c15c1ef113f9344ca21b543ba68362541fb5f3'
            )
options=('debug')

pkgver() {
  cd "${_plug}"
#   echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {

  sed -e 's|D:/ProgramData/opencv/build|/usr|g' \
      -e 's|D:/ProgramData/VulkanSDK/1.1.126.0|/usr|g' \
      -e 's|D:/Workspace/ncnn-master/build-vs2017/install|/usr|g' \
      -e 's|D:/Program Files/VapourSynth/sdk|/usr|g' \
      -e 's|Include|include|g' \
      -e 's|{OpenCV}/include|{OpenCV}/include/opencv4|g' \
      -e 's|Lib|lib|g' \
      -e 's|lib64|lib|g' \
      -e 's|x64/vc15/||g' \
      -e 's|vulkan-1|vulkan glslang SPIRV|g' \
      -e 's|opencv_world412|opencv_core opencv_imgproc opencv_highgui|g' \
      -e 's|vsscript|vapoursynth-script|g' \
      -i "${_plug}/CMakeLists.txt"

  git apply --directory "${_plug}" -p1 "${srcdir}/esee.patch" --ignore-whitespace
}

build() {
  cmake -S "${_plug}" -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package(){
  install -Dm755 "build/libvs_fsrcnn_vulkan.so" "${pkgdir}/usr/lib/vapoursynth/libvs_fsrcnn_vulkan.so"

  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"
  install -Dm644 "${_plug}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
