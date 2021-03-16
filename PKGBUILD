# Maintainer: gee
# contributors: yochananmarqos, bpierre, PedroHLC, rodrigo21
pkgname='lib32-vkbasalt'
pkgver=0.3.2.4
pkgrel=1
pkgdesc='A Vulkan post-processing layer. Some of the effects are CAS, FXAA, SMAA, deband.'
arch=('x86_64')
url='https://github.com/DadSchoorse/vkBasalt'
license=('zlib')
makedepends=('meson' 'ninja' 'glslang' 'lib32-gcc-libs' 'lib32-libx11')
depends=('lib32-gcc-libs' 'lib32-libx11' 'vkbasalt' )
source=("${url}/releases/download/v${pkgver}/vkBasalt-${pkgver}.tar.gz")
sha256sums=('f45d513d9f212e9a1e1ec49448e72c5f2510d62303c38fdb5015b9a3afd42b26')

prepare() {
  cd ${srcdir}/vkBasalt-${pkgver}
  sed -i 's|/path/to/reshade-shaders/Textures|/usr/share/reshade/textures|g' \
    "config/vkBasalt.conf"
  sed -i 's|/path/to/reshade-shaders/Shaders|/usr/share/reshade/shaders|g' \
    "config/vkBasalt.conf"
}

build() {
  cd ${srcdir}/vkBasalt-${pkgver}

  ASFLAGS+=" --32" \
  CFLAGS+=" -m32" \
  CXXFLAGS+=" -m32" \
  LDFLAGS+=" -m32"
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
