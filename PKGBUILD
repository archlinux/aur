# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgbase=vulkan-git
pkgname=('vulkan-icd-loader-git' 'vulkan-sdk-git')
pkgver=r4425.6fec792
pkgrel=1
url='https://www.khronos.org/vulkan/'
arch=('i686' 'x86_64')
license=('MIT')
source=('LoaderAndValidationLayers::git+https://github.com/KhronosGroup/Vulkan-LoaderAndValidationLayers'
        'git+https://github.com/LunarG/VulkanTools'
        'vulkan.pc')
sha1sums=('SKIP'
          'SKIP'
          'beaab6bfd4f3f219f295c4fbdc6300098ddeea2c')
makedepends=('cmake')

_libver=1.0.3

pkgver() {
  cd "${srcdir}"/LoaderAndValidationLayers
  printf "r%d.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

  _libver=$(grep VK_API_VERSION include/vulkan/vulkan.h \
    | sed -r 's/^.*\(\s*([0-9]+)\s*,\s*([0-9]+)\s*,\s*([0-9]+)\s*\).*$/\1.\2.\3/')
}

prepare() {
  cd "${srcdir}"

  # Missing header
  wget -q https://www.khronos.org/registry/spir-v/api/1.0/spirv.hpp \
    -O LoaderAndValidationLayers/layers/spirv.hpp
}

build() {
  cd "${srcdir}"/LoaderAndValidationLayers

  # Loader & Layers
  # Note: VulkanTools expects it to be built at "../LoaderAndValidationLayers/build/"
  mkdir -p build
  cd build
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_LOADER=ON \
    -DBUILD_LAYERS=ON \
    -DBUILD_TESTS=OFF \
    -DBUILD_DEMOS=OFF \
    -DBUILD_VKJSON=OFF \
    ..
  make

  # Tools
  cd "${srcdir}"/VulkanTools
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_VKTRACE=ON \
    -DBUILD_ICD=OFF \
    -DBUILD_TESTS=OFF \
    -DBUILD_LAYERS=OFF \
    .
  make
}

package_vulkan-icd-loader-git() {
  pkgdesc='Vulkan ICD (installable client driver) loader'
  conflicts=('vulkan-icd-loader')
  provides=("vulkan-icd-loader")
  #provides=("vulkan-icd-loader=${_libver}")
  optdepends=('glslang-git' 'spirv-tools')

  install -dm755 "${pkgdir}"/usr/lib/

  # Shared library & symlinks
  cd "${srcdir}"/LoaderAndValidationLayers/build/loader
  install -m755 libvulkan.so."${_libver}"     "${pkgdir}"/usr/lib/libvulkan.so."${_libver}"
  ln -s         libvulkan.so."${_libver}"     "${pkgdir}"/usr/lib/libvulkan.so."${_libver%%.*}"
  ln -s         libvulkan.so."${_libver%%.*}" "${pkgdir}"/usr/lib/libvulkan.so

  # License
  cd "${srcdir}"/LoaderAndValidationLayers
  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

package_vulkan-sdk-git() {
  pkgdesc='Vulkan SDK'
  depends=('vulkan-headers' 'vulkan-icd-loader' 'glslang-git' 'spirv-headers' 'spirv-tools')
  optdepends=('vulkan-man-pages')
  conflicts=('vulkan-sdk')
  provides=('vulkan-sdk')
  options=('staticlibs' 'emptydirs')

  install -dm755 "${pkgdir}"/usr/bin/
  install -dm755 "${pkgdir}"/usr/lib/
  install -dm755 "${pkgdir}"/usr/share/vulkan/explicit_layer.d/
  install -dm755 "${pkgdir}"/usr/share/vulkan/implicit_layer.d/
  install -dm755 "${pkgdir}"/usr/lib/pkgconfig/

  # Tools
  cd "${srcdir}"/VulkanTools/vktrace
  install -m755 vktrace                        "${pkgdir}"/usr/bin/
  install -m755 vkreplay                       "${pkgdir}"/usr/bin/
  install -m644 *.so                           "${pkgdir}"/usr/lib/
  install -m644 src/vktrace_layer/linux/*.json "${pkgdir}"/usr/share/vulkan/explicit_layer.d/

  # Layers
  cd "${srcdir}"/LoaderAndValidationLayers/build/layers
  install -m644 *.so   "${pkgdir}"/usr/lib/
  install -m644 *.json "${pkgdir}"/usr/share/vulkan/explicit_layer.d/

  # pkg-config
  cd "${srcdir}"
  install  -m644 vulkan.pc          "${pkgdir}"/usr/lib/pkgconfig/
  sed "s/%{version}/${_libver}/" -i "${pkgdir}"/usr/lib/pkgconfig/vulkan.pc

  # License
  cd "${srcdir}"/LoaderAndValidationLayers
  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
