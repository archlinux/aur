# Maintainer: gee

pkgname=vkbasalt
pkgver=0.2.0
pkgrel=3
pkgdesc='A vulkan post processing layer. Currently the only effect is Contrast Adaptiv Sharpening.'
arch=('x86_64')
url='https://github.com/DadSchoorse/vkBasalt'
license=('zlib')
depends=('glslang' 'vulkan-headers' 'vulkan-tools' 'vulkan-validation-layers')
source=("https://github.com/DadSchoorse/vkBasalt/archive/v${pkgver}.tar.gz")
sha256sums=('de38bd2974d7259a48e3f1afcfe77547c80e284b3ad82c51777952474a5d17a7')
install=vkbasalt.install

build() {
  cd ${srcdir}/vkBasalt-${pkgver}
  sed -i 's+std::string(getenv(\"HOME\")) \+ \"/.local/+\"/usr/+g' src/effect_*.cpp

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
