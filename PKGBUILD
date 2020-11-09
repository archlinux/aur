# Maintainer: gee
# contributors: yochananmarqos, bpierre, PedroHLC, rodrigo21
pkgname='lib32-vkbasalt'
pkgver=0.3.2.3
pkgrel=4
pkgdesc='A Vulkan post-processing layer. Some of the effects are CAS, FXAA, SMAA, deband.'
arch=('x86_64')
url='https://github.com/DadSchoorse/vkBasalt'
license=('zlib')
makedepends=('meson' 'ninja' 'glslang' 'lib32-gcc-libs' 'lib32-libx11')
depends=('lib32-gcc-libs' 'lib32-libx11' 'vkbasalt' )
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

  ASFLAGS=--32 \
  CFLAGS=-m32 \
  CXXFLAGS=-m32 \
  PKG_CONFIG_PATH=/usr/lib32/pkgconfig \
  arch-meson \
    --buildtype=release \
    --libdir=lib32 \
    -Dwith_json=false \
    build
  ninja -C build
}

package() {
  cd ${srcdir}/vkBasalt-${pkgver}

  DESTDIR="${pkgdir}" ninja install -C build
}
