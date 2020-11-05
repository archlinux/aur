# Maintainer: gee
# contributors: yochananmarqos, bpierre, PedroHLC, rodrigo21
pkgbase=vkbasalt
pkgname=('vkbasalt' 'lib32-vkbasalt')
pkgver=0.3.2.3
pkgrel=3
pkgdesc='A Vulkan post-processing layer. Some of the effects are CAS, FXAA, SMAA, deband.'
arch=('x86_64')
url='https://github.com/DadSchoorse/vkBasalt'
license=('zlib')
makedepends=('git' 'meson' 'ninja' 'glslang' 'lib32-gcc-libs' 'lib32-libx11')
source=("git+https://github.com/DadSchoorse/vkBasalt.git#tag=v${pkgver}")
sha256sums=(SKIP)

prepare() {
  cd ${srcdir}/vkBasalt
  git submodule init
  git config submodule.reshade.url ../reshade
  git submodule update
  sed -i 's|/path/to/reshade-shaders/Textures|/usr/share/reshade/textures|g' \
    "${srcdir}/vkBasalt/config/vkBasalt.conf"
  sed -i 's|/path/to/reshade-shaders/Shaders|/usr/share/reshade/shaders|g' \
    "${srcdir}/vkBasalt/config/vkBasalt.conf"
}

build() {
  cd ${srcdir}/vkBasalt

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
  cd ${srcdir}/vkBasalt

  DESTDIR="${pkgdir}" ninja install -C build64
  install -Dm 644 config/vkBasalt.conf "${pkgdir}/usr/share/vkBasalt/vkBasalt.conf.example"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/vkBasalt"
}

package_lib32-vkbasalt() {
  depends=('lib32-gcc-libs' 'lib32-libx11' 'vkbasalt' )
  cd ${srcdir}/vkBasalt

  DESTDIR="${pkgdir}" ninja install -C build32
}
