# Maintainer: gee
# contributors: yochananmarqos, bpierre, PedroHLC, rodrigo21, FabioLolix
pkgname='vkbasalt'
pkgver=0.3.2.10
pkgrel=1
pkgdesc='A Vulkan post-processing layer. Some of the effects are CAS, FXAA, SMAA, deband.'
arch=('x86_64')
url='https://github.com/DadSchoorse/vkBasalt'
license=('zlib')
depends=('gcc-libs' 'glslang' 'libx11')
makedepends=('meson' 'ninja' 'spirv-headers' 'vulkan-headers')
optdepends=('reshade-shaders-git')
source=("${url}/releases/download/v${pkgver}/vkBasalt-${pkgver}.tar.gz")
sha256sums=('eb196ff446fa36ec0ca99c4406d753c1fa210afddeec5e7a76e1c2e74ed605e3')
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
  cd ${srcdir}/vkBasalt-${pkgver}

  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm 644 config/vkBasalt.conf "${pkgdir}/usr/share/vkBasalt/vkBasalt.conf.example"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
