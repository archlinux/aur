# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgbase=vulkan
pkgname=('vulkan' 'vulkan-sdk')
pkgver=1.0.3.1
pkgrel=1
url='https://www.khronos.org/vulkan'
arch=('x86_64')
license=('MIT')
source=("sdk.run::https://vulkan.lunarg.com/pub/sdks/linux/latest"
        'vulkan.pc')
sha1sums=('869e60e46df3c1938d206158ec0591bf037cf83c'
          'beaab6bfd4f3f219f295c4fbdc6300098ddeea2c')
makedepends=('cmake' 'asciidoc' 'source-highlight')
options=('zipman')

build() {
  cd "${srcdir}"
  sh sdk.run --noexec --target sdk
}

package_vulkan-sdk() {
  pkgdesc='Vulkan SDK'
  depends=("vulkan=${pkgver}")
  options=('staticlibs')

  cd "${srcdir}"/sdk/"${pkgver}"/"${CARCH}"

  # Headers
  install -dm755                 "${pkgdir}"/usr/include/vulkan/
  install -m644 include/vulkan/* "${pkgdir}"/usr/include/vulkan/

  # Tools
  install -dm755      "${pkgdir}"/usr/bin/
  install -m755 bin/* "${pkgdir}"/usr/bin/

  # Layers
  install -dm755                          "${pkgdir}"/usr/share/vulkan/explicit_layer.d/
  install -m644 lib/vulkan/layer/* "${pkgdir}"/usr/share/vulkan/explicit_layer.d/
  install -m644 lib/libVkLayer_vktrace_layer.so "${pkgdir}"/usr/share/vulkan/explicit_layer.d/

  # pkg-config
  install -dm755                       "${pkgdir}"/usr/lib/pkgconfig/
  install  -m644 "${srcdir}"/vulkan.pc "${pkgdir}"/usr/lib/pkgconfig/
  sed s/%{version}/${pkgver}/       -i "${pkgdir}"/usr/lib/pkgconfig/vulkan.pc
}

package_vulkan() {
  pkgdesc='Vulkan ICD (installable client driver) loader'

  cd "${srcdir}"/sdk/"${pkgver}"/"${CARCH}"

  local _libver=${pkgver%.*}

  # Shared library & symlinks
  install -dm755 "${pkgdir}"/usr/lib/
  install -m755 lib/libvulkan.so."${_libver}"     "${pkgdir}"/usr/lib/libvulkan.so."${_libver}"
  ln -s             libvulkan.so."${_libver}"     "${pkgdir}"/usr/lib/libvulkan.so."${_libver%%.*}"
  ln -s             libvulkan.so."${_libver%%.*}" "${pkgdir}"/usr/lib/libvulkan.so
}
