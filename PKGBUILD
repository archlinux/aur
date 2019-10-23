# Maintainer: gee

pkgname=vkbasalt
pkgver=0.0.5
pkgrel=1
pkgdesc='A vulkan post processing layer. Currently the only effect is Contrast Adaptiv Sharpening.'
arch=('x86_64')
url='https://github.com/DadSchoorse/vkBasalt'
license=('UNKNOWN')
depends=('glslang' 'vulkan-headers' 'vulkan-tools' 'vulkan-validation-layers')
source=("https://github.com/DadSchoorse/vkBasalt/archive/v${pkgver}.tar.gz")
sha256sums=('798a15d7a363f393203a20d001f6c018d29da42371424d3ce0305511b9ef85b7')
install=vkbasalt.install

build() {
  cd ${srcdir}/vkBasalt-${pkgver}
  sed -i 's+std::string(getenv(\"HOME\")) \+ \"/.local/+\"/usr/+g' src/basalt.cpp

  make
}

package() {
  cd ${srcdir}/vkBasalt-${pkgver}
  install -Dm 755 build/libvkbasalt64.so "${pkgdir}/usr/lib/libvkbasalt.so"
  install -Dm 755 build/libvkbasalt32.so "${pkgdir}/usr/lib32/libvkbasalt.so"
  install -Dm 644 build/shader/cas.comp.spv  "${pkgdir}/usr/share/vkBasalt/shader/cas.comp.spv"
  install -Dm 644 config/vkBasalt.conf "${pkgdir}/usr/share/vkBasalt/vkBasalt.conf.example"
  install -dm 755 "${pkgdir}/usr/share/vulkan/implicit_layer.d"
  sed 's+@lib+/usr/lib/libvkbasalt.so+g' config/vkBasalt64.json > "${pkgdir}/usr/share/vulkan/implicit_layer.d/vkBasalt64.json"
  sed 's+@lib+/usr/lib32/libvkbasalt.so+g' config/vkBasalt32.json > "${pkgdir}/usr/share/vulkan/implicit_layer.d/vkBasalt32.json"

  #make prefix="${pkgdir}/usr" install
}
