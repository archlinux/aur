# Maintainer: gee
# contributors: yochananmarqos, bpierre, PedroHLC, rodrigo21, FabioLolix
pkgname='lib32-vkbasalt'
pkgver=0.3.2.10
pkgrel=1
pkgdesc='A Vulkan post-processing layer. Some of the effects are CAS, FXAA, SMAA, deband.'
arch=('x86_64')
url='https://github.com/DadSchoorse/vkBasalt'
license=('zlib')
depends=('lib32-glibc' 'lib32-gcc-libs' 'lib32-libx11' 'vkbasalt')
makedepends=('meson' 'ninja' 'glslang' 'spirv-headers' 'vulkan-headers')
source=("${url}/releases/download/v${pkgver}/vkBasalt-${pkgver}.tar.gz")
sha256sums=('eb196ff446fa36ec0ca99c4406d753c1fa210afddeec5e7a76e1c2e74ed605e3')

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
    -Dwith_json=true \
    build
  ninja -C build
}

package() {
  cd ${srcdir}/vkBasalt-${pkgver}

  DESTDIR="${pkgdir}" ninja -C build install
  mv "${pkgdir}/usr/share/vulkan/implicit_layer.d/vkBasalt.json" "${pkgdir}/usr/share/vulkan/implicit_layer.d/vkBasalt.x86.json"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
