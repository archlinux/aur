# Maintainer: gee
# contributors: yochananmarqos, bpierre, PedroHLC, rodrigo21
pkgname='vkbasalt'
pkgver=0.3.2.8
pkgrel=1
pkgdesc='A Vulkan post-processing layer. Some of the effects are CAS, FXAA, SMAA, deband.'
arch=('x86_64')
url='https://github.com/DadSchoorse/vkBasalt'
license=('zlib')
makedepends=('meson' 'ninja' 'glslang' 'libx11' 'spirv-headers' 'vulkan-headers')
depends=('gcc-libs' 'glslang' 'libx11')
source=("${url}/releases/download/v${pkgver}/vkBasalt-${pkgver}.tar.gz")
sha256sums=('1f1084703703783063bd6066f72e09aa8811846aaf2ca8bc26733b78ed6dbe4c')
install=vkbasalt.install

prepare() {
  cd ${srcdir}/vkBasalt-${pkgver}
  sed -i 's|/path/to/reshade-shaders/Textures|/opt/reshade/textures|g' \
    "config/vkBasalt.conf"
  sed -i 's|/path/to/reshade-shaders/Shaders|/opt/reshade/shaders|g' \
    "config/vkBasalt.conf"
}

build() {
  cd ${srcdir}/vkBasalt-${pkgver}

  arch-meson \
    --buildtype=release \
    build
  ninja -C build
}

package() {
  optdepends=('reshade-shaders-git')
  cd ${srcdir}/vkBasalt-${pkgver}

  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm 644 config/vkBasalt.conf "${pkgdir}/usr/share/vkBasalt/vkBasalt.conf.example"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/vkBasalt"
}
