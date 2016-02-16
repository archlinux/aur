# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgbase=vulkan-git
pkgname=('vulkan-loader-git' 'vulkan-sdk-git')
pkgver=r3.7e195e8
pkgrel=2
url='https://www.khronos.org/vulkan'
arch=('i686' 'x86_64')
license=('MIT')
source=('git+https://github.com/KhronosGroup/Vulkan-Docs'
        'git+https://github.com/KhronosGroup/Vulkan-LoaderAndValidationLayers'
        'vulkan.pc'
        'glsl-fix.patch')
sha1sums=('SKIP'
          'SKIP'
          'beaab6bfd4f3f219f295c4fbdc6300098ddeea2c'
          '437ece58e06c0bdab40ea4eb7fb0787ea8250150')
depends=('glslang-git' 'spirv-tools')
makedepends=('cmake' 'asciidoc' 'source-highlight')
options=('zipman')

_libver=1.0.3

pkgver() {
  cd "${srcdir}"/Vulkan-Docs
  printf "r%d.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

  _libver=$(grep VK_API_VERSION src/vulkan/vulkan.h \
    | sed -r 's/^.*\(\s*([0-9]+)\s*,\s*([0-9]+)\s*,\s*([0-9]+)\s*\).*$/\1.\2.\3/')
}

prepare() {
  cd "${srcdir}"/Vulkan-LoaderAndValidationLayers

  # Temporary fix; should be fixed upstream eventually
  patch -i ../glsl-fix.patch
}

build() {

  # ICD loader
  cd "${srcdir}"/Vulkan-LoaderAndValidationLayers
  cmake -DCMAKE_BUILD_TYPE=Release
  make vulkan

  # Layers
  make \
    VkLayer_device_limits \
    VkLayer_image \
    VkLayer_mem_tracker \
    VkLayer_object_tracker \
    VkLayer_param_checker \
    VkLayer_swapchain \
    VkLayer_threading \
    VkLayer_unique_objects

  # Note: VkLayer_draw_state requires `spirv.hpp`, which I don't know yet where
  #       to find; will be included in future revision of this package

  # Man Pages
  cd "${srcdir}/Vulkan-Docs/doc/specs/vulkan"
  make manpages
}

package_vulkan-loader-git() {
  pkgdesc='Vulkan ICD (installable client driver) loader'
  conflicts=('vulkan-loader')
  provides=("vulkan-loader")
  #provides=("vulkan-loader=${_libver}")

  # Shared library & symlinks
  cd "${srcdir}"/Vulkan-LoaderAndValidationLayers
  install -dm755 "${pkgdir}"/usr/lib/
  install -m755 loader/libvulkan.so."${_libver}"     "${pkgdir}"/usr/lib/libvulkan.so."${_libver}"
  ln -s                libvulkan.so."${_libver}"     "${pkgdir}"/usr/lib/libvulkan.so."${_libver%%.*}"
  ln -s                libvulkan.so."${_libver%%.*}" "${pkgdir}"/usr/lib/libvulkan.so

  # License
  install -Dm644 "${srcdir}"/Vulkan-LoaderAndValidationLayers/LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

package_vulkan-sdk-git() {
  pkgdesc='Vulkan SDK'
  depends=("vulkan-loader")
  #depends=("vulkan-loader=${pkgver}")
  conflicts=('vulkan-sdk')
  provides=("vulkan-sdk")
  #provides=("vulkan-sdk=${_libver}")
  options=('staticlibs')

  # Headers
  cd "${srcdir}"/Vulkan-Docs
  install -dm755               "${pkgdir}"/usr/include/vulkan/
  install -m644 src/vulkan/*.h "${pkgdir}"/usr/include/vulkan/

  # Tools
  #cd "${srcdir}"/Vulkan-LoaderAndValidationLayers
  #install -dm755      "${pkgdir}"/usr/bin/
  #install -m755 bin/* "${pkgdir}"/usr/bin/

  # Layers
  cd "${srcdir}"/Vulkan-LoaderAndValidationLayers
  install -dm755                    "${pkgdir}"/usr/share/vulkan/explicit_layer.d/
  install -m644 layers/*.so         "${pkgdir}"/usr/share/vulkan/explicit_layer.d/
  install -m644 layers/linux/*.json "${pkgdir}"/usr/share/vulkan/explicit_layer.d/

  # pkg-config
  cd "${srcdir}"/Vulkan-LoaderAndValidationLayers
  install -dm755                       "${pkgdir}"/usr/lib/pkgconfig/
  install  -m644 "${srcdir}"/vulkan.pc "${pkgdir}"/usr/lib/pkgconfig/
  sed s/%{version}/${pkgver}/       -i "${pkgdir}"/usr/lib/pkgconfig/vulkan.pc

  # Man Pages
  cd "${srcdir}/Vulkan-Docs/doc/specs/vulkan/man"
  install -d        "${pkgdir}/usr/share/man/man3/"
  install -m644 *.3 "${pkgdir}/usr/share/man/man3/"

  install -Dm644 "${srcdir}"/Vulkan-LoaderAndValidationLayers/LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
