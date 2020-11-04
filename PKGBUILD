# Maintainer: gee

pkgname=vkbasalt
pkgver=0.3.2.3
pkgrel=1
pkgdesc='A Vulkan post-processing layer. Some of the effects are CAS, FXAA, SMAA, deband.'
arch=('x86_64')
url='https://github.com/DadSchoorse/vkBasalt'
license=('zlib')
makedepends=('git' 'meson' 'ninja')
depends=('glslang' 'lib32-gcc-libs' 'lib32-libx11')
optdepends=('reshade-shaders-git')
source=("git+https://github.com/DadSchoorse/vkBasalt.git#tag=v${pkgver}")
sha256sums=(SKIP)
install=vkbasalt.install

prepare() {
  cd ${srcdir}/vkBasalt
  git submodule init
  git config submodule.reshade.url ../reshade
  git submodule update
}

build() {
  cd ${srcdir}/vkBasalt

  printf -- "\n------------------\n"
  printf "|  BUILDING 64B  |\n"
  printf -- "------------------\n\n"
  meson --buildtype=release builddir
  ninja -C builddir

  printf -- "\n------------------\n"
  printf "|  BUILDING 32B  |\n"
  printf -- "------------------\n\n"

  ASFLAGS=--32 CFLAGS=-m32 CXXFLAGS=-m32 PKG_CONFIG_PATH=/usr/lib32/pkgconfig meson \
    --prefix=/usr \
    --buildtype=release \
    --libdir=lib32 \
    -Dwith_json=false \
    builddir.32
  ninja -C builddir.32
}

package() {
  cd ${srcdir}/vkBasalt

  install -Dm 755 builddir/src/libvkbasalt.so "${pkgdir}/usr/lib/libvkbasalt.so"
  install -Dm 755 builddir.32/src/libvkbasalt.so "${pkgdir}/usr/lib32/libvkbasalt.so"
  install -Dm 644 config/vkBasalt.conf "${pkgdir}/usr/share/vkBasalt/vkBasalt.conf.example"
  sed -i 's|/path/to/reshade-shaders/Textures|/usr/share/reshade/textures|g' \
    "${pkgdir}/usr/share/vkBasalt/vkBasalt.conf.example"
  sed -i 's|/path/to/reshade-shaders/Shaders|/usr/share/reshade/shaders|g' \
    "${pkgdir}/usr/share/vkBasalt/vkBasalt.conf.example"
  install -dm 755 "${pkgdir}/usr/share/vulkan/implicit_layer.d"
  install -Dm 644 config/vkBasalt.json.in "${pkgdir}/usr/share/vulkan/implicit_layer.d/vkBasalt.json"
  sed -i 's|@ld_lib_dir_vkbasalt@libvkbasalt.so|libvkbasalt.so|g' "${pkgdir}/usr/share/vulkan/implicit_layer.d/vkBasalt.json"
}
