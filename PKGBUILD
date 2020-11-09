# Maintainer: gee
# contributors: yochananmarqos, bpierre, PedroHLC, rodrigo21
pkgbase=vkbasalt
pkgname=('vkbasalt' 'lib32-vkbasalt')
pkgver=0.3.2.3
pkgrel=4
pkgdesc='A Vulkan post-processing layer. Some of the effects are CAS, FXAA, SMAA, deband.'
arch=('x86_64')
url='https://github.com/DadSchoorse/vkBasalt'
license=('zlib')
makedepends=('meson' 'ninja' 'glslang' 'lib32-gcc-libs' 'lib32-libx11')
source=("${url}/releases/download/v0.3.2.3/vkBasalt-${pkgver}.tar.gz")
sha256sums=('8cc65a69a20ac16802a8ff46629efa6540dee22daeef9db4ad0a22b63d2a4368')

prepare() {
  cd ${srcdir}/vkBasalt-${pkgver}
  sed -i 's|/path/to/reshade-shaders/Textures|/usr/share/reshade/textures|g' \
    "config/vkBasalt.conf"
  sed -i 's|/path/to/reshade-shaders/Shaders|/usr/share/reshade/shaders|g' \
    "config/vkBasalt.conf"
}

build() {
  cd ${srcdir}/vkBasalt-${pkgver}

  printf -- "\n------------------\n"
  printf "|  BUILDING 64B  |\n"
  printf -- "------------------\n\n"
  arch-meson \
    --buildtype=release \
    build64
  ninja -C build64

  printf -- "\n------------------\n"
  printf "|  BUILDING 32B  |\n"
  printf -- "------------------\n\n"

  ASFLAGS=--32 \
  CFLAGS=-m32 \
  CXXFLAGS=-m32 \
  PKG_CONFIG_PATH=/usr/lib32/pkgconfig \
  arch-meson \
    --buildtype=release \
    --libdir=lib32 \
    -Dwith_json=false \
    build32
  ninja -C build32
}

package_vkbasalt() {
  install=vkbasalt.install
  depends=('gcc-libs' 'glslang' 'libx11')
  optdepends=('reshade-shaders-git')
  cd ${srcdir}/vkBasalt-${pkgver}

  DESTDIR="${pkgdir}" ninja install -C build64
  install -Dm 644 config/vkBasalt.conf "${pkgdir}/usr/share/vkBasalt/vkBasalt.conf.example"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/vkBasalt"
}

package_lib32-vkbasalt() {
  depends=('lib32-gcc-libs' 'lib32-libx11' 'vkbasalt' )
  cd ${srcdir}/vkBasalt-${pkgver}

  DESTDIR="${pkgdir}" ninja install -C build32
}
