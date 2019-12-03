# Maintainer: gee

pkgname=vkbasalt
pkgver=0.2.1
pkgrel=4
pkgdesc='A Vulkan post-processing layer. Currently the effects are CAS, FXAA, SMAA, deband.'
arch=('x86_64')
url='https://github.com/DadSchoorse/vkBasalt'
license=('zlib')
depends=('glslang' 'vulkan-headers' 'vulkan-tools' 'vulkan-validation-layers' 'lib32-glibc' 'lib32-gcc-libs')
source=("https://github.com/DadSchoorse/vkBasalt/archive/v${pkgver}.tar.gz")
sha256sums=('fe8db0f745e60913df9b833a17a48f932183a932479e9d130a68e3da9dcab699')
install=vkbasalt.install

build() {
  cd ${srcdir}/vkBasalt-${pkgver}

  make
}

package() {
  cd ${srcdir}/vkBasalt-${pkgver}

  install -Dm 755 build/libvkbasalt64.so "${pkgdir}/usr/lib/libvkbasalt.so"
  install -Dm 755 build/libvkbasalt32.so "${pkgdir}/usr/lib32/libvkbasalt.so"
  install -dm 755 "${pkgdir}/usr/share/vkBasalt/shader"
  install -Dm 644 build/shader/*.spv  "${pkgdir}/usr/share/vkBasalt/shader"
  install -Dm 644 config/vkBasalt.conf "${pkgdir}/usr/share/vkBasalt/vkBasalt.conf.example"
  install -dm 755 "${pkgdir}/usr/share/vulkan/implicit_layer.d"
  sed 's+@lib+/usr/lib/libvkbasalt.so+g' config/vkBasalt64.json > "${pkgdir}/usr/share/vulkan/implicit_layer.d/vkBasalt64.json"
  sed 's+@lib+/usr/lib32/libvkbasalt.so+g' config/vkBasalt32.json > "${pkgdir}/usr/share/vulkan/implicit_layer.d/vkBasalt32.json"
}
