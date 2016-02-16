# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgbase=vulkan
pkgname=('vulkan-loader' 'vulkan-sdk')
pkgver=1.0.3.1
pkgrel=2
url='https://www.khronos.org/vulkan'
arch=('x86_64')
license=('MIT')
source=("sdk.run::https://vulkan.lunarg.com/pub/sdks/linux/latest"
        'vulkan.pc')
sha1sums=('869e60e46df3c1938d206158ec0591bf037cf83c'
          'beaab6bfd4f3f219f295c4fbdc6300098ddeea2c')
depends=('glslang-git' 'spirv-tools')
makedepends=('cmake' 'asciidoc' 'source-highlight')
options=('zipman')

_libver=${pkgver%.*}

build() {
  cd "${srcdir}"
  sh sdk.run --noexec --target sdk
}

package_vulkan-loader() {
  pkgdesc='Vulkan ICD (installable client driver) loader'

  cd "${srcdir}"/sdk/"${pkgver}"/"${CARCH}"

  # Shared library & symlinks
  install -dm755 "${pkgdir}"/usr/lib/
  install -m755 lib/libvulkan.so."${_libver}"     "${pkgdir}"/usr/lib/libvulkan.so."${_libver}"
  ln -s             libvulkan.so."${_libver}"     "${pkgdir}"/usr/lib/libvulkan.so."${_libver%%.*}"
  ln -s             libvulkan.so."${_libver%%.*}" "${pkgdir}"/usr/lib/libvulkan.so

  #TODO: LICENSE
}

package_vulkan-sdk() {
  pkgdesc='Vulkan SDK'
  depends=("vulkan-loader")
  #depends=("vulkan-loader=${pkgver}")
  options=('staticlibs')

  cd "${srcdir}"/sdk/"${pkgver}"/"${CARCH}"

  # Headers
  install -dm755                        "${pkgdir}"/usr/include/vulkan/
  install -m644 include/vulkan/vulkan.h "${pkgdir}"/usr/include/vulkan/
  install -m644 include/vulkan/vk_*     "${pkgdir}"/usr/include/vulkan/

  # Tools
  install -dm755            "${pkgdir}"/usr/bin/
  install -m755 bin/vk*     "${pkgdir}"/usr/bin/
  install -m755 bin/vulkan* "${pkgdir}"/usr/bin/

  # Layers
  install -dm755                          "${pkgdir}"/usr/share/vulkan/explicit_layer.d/
  install -m644 lib/vulkan/layer/* "${pkgdir}"/usr/share/vulkan/explicit_layer.d/
  install -m644 lib/libVkLayer_vktrace_layer.so "${pkgdir}"/usr/share/vulkan/explicit_layer.d/

  # pkg-config
  install -dm755                       "${pkgdir}"/usr/lib/pkgconfig/
  install  -m644 "${srcdir}"/vulkan.pc "${pkgdir}"/usr/lib/pkgconfig/
  sed s/%{version}/${pkgver}/       -i "${pkgdir}"/usr/lib/pkgconfig/vulkan.pc

  #TODO: Man Pages
  #install -d        "${pkgdir}/usr/share/man/man3/"
  #install -m644 *.3 "${pkgdir}/usr/share/man/man3/"

  #TODO: LICENSE
}
