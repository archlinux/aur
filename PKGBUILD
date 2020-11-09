# Maintainer: gee
# contributors: yochananmarqos, bpierre, PedroHLC, rodrigo21
pkgname='vkbasalt'
pkgver=0.3.2.3
pkgrel=4
pkgdesc='A Vulkan post-processing layer. Some of the effects are CAS, FXAA, SMAA, deband.'
arch=('x86_64')
url='https://github.com/DadSchoorse/vkBasalt'
license=('zlib')
makedepends=('meson' 'ninja' 'glslang' 'libx11')
depends=('gcc-libs' 'glslang' 'libx11')
source=("${url}/releases/download/v0.3.2.3/vkBasalt-${pkgver}.tar.gz")
sha256sums=('8cc65a69a20ac16802a8ff46629efa6540dee22daeef9db4ad0a22b63d2a4368')
install=vkbasalt.install

prepare() {
  cd ${srcdir}/vkBasalt-${pkgver}
  sed -i 's|/path/to/reshade-shaders/Textures|/usr/share/reshade/textures|g' \
    "config/vkBasalt.conf"
  sed -i 's|/path/to/reshade-shaders/Shaders|/usr/share/reshade/shaders|g' \
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

  DESTDIR="${pkgdir}" ninja install -C build
  install -Dm 644 config/vkBasalt.conf "${pkgdir}/usr/share/vkBasalt/vkBasalt.conf.example"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/vkBasalt"
}
