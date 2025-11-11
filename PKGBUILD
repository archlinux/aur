# Maintainer: Adam Cihelka
# Contributor: Kowabunga
# Contributor: yochananmarqos
# Contributor: bpierre
# Contributor: PedroHLC
# Contributor: rodrigo21

pkgname='lib32-vkpost'
pkgver=0.4.6
pkgrel=2
pkgdesc='A Vulkan Post Processing Layer For Linux (32-bit). Next Gen vkBasalt.'
arch=('x86_64')
url='https://github.com/KowabungaOfficial/vkPost'
license=('Zlib')
depends=('lib32-glibc' 'lib32-gcc-libs' 'lib32-libx11' 'lib32-wayland' 'lib32-libxkbcommon')
makedepends=('glslang' 'meson' 'ninja' 'spirv-headers' 'vulkan-headers')
optdepends=('reshade-shaders-git: collection of shaders to use with vkPost'
            'vkpost: sample config at /usr/share/vkPost/vkPost.conf.example')
source=("${url}/releases/download/v${pkgver}/vkPost-${pkgver}.tar.gz")
sha256sums=("827964fa67bcad0973f5245f1e2453aea0cbb104608e1fabbbb3b1cd55fffd14")

build() {
  cd "${srcdir}/vkPost-${pkgver}"

  ASFLAGS+=" --32"
  CFLAGS+=" -m32"
  CXXFLAGS+=" -m32"
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
  cd "${srcdir}/vkPost-${pkgver}"

  DESTDIR="${pkgdir}" ninja -C build install
  mv "${pkgdir}/usr/share/vulkan/implicit_layer.d/vkPost.json" "${pkgdir}/usr/share/vulkan/implicit_layer.d/vkPost.x86.json"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
