# Maintainer: gee

pkgname=vkbasalt
pkgver=0.3.2.1
pkgrel=1
pkgdesc='A Vulkan post-processing layer. Currently the effects are CAS, FXAA, SMAA, deband.'
arch=('x86_64')
url='https://github.com/DadSchoorse/vkBasalt'
license=('zlib')
makedepends=('cmake' 'git' 'meson' 'ninja')
depends=('glslang' 'libx11' 'lib32-glibc' 'lib32-gcc-libs' 'lib32-libx11')
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

  msg "Building 64b"
  meson --buildtype=release builddir
  ninja -C builddir

  msg "Building 32b"
  ASFLAGS=--32 CFLAGS=-m32 CXXFLAGS=-m32 PKG_CONFIG_PATH=/usr/lib32/pkgconfig meson --prefix=/usr --buildtype=release --libdir=lib32 -Dwith_json=false builddir.32
  ninja -C builddir.32
}

package() {
  cd ${srcdir}/vkBasalt

  install -Dm 755 builddir/src/libvkbasalt.so "${pkgdir}/usr/lib/libvkbasalt.so"
  install -Dm 755 builddir.32/src/libvkbasalt.so "${pkgdir}/usr/lib32/libvkbasalt.so"
  install -Dm 644 config/vkBasalt.conf "${pkgdir}/usr/share/vkBasalt/vkBasalt.conf.example"
  sed -i 's|*path/to/reshade-shaders/Textures\*|/usr/share/reshade/textures|g' "${pkgdir}/usr/share/vkBasalt/vkBasalt.conf.example"
  sed -i 's|*path/to/reshade-shaders/Shaders\*|/usr/share/reshade/shaders|g' "${pkgdir}/usr/share/vkBasalt/vkBasalt.conf.example"
  install -dm 755 "${pkgdir}/usr/share/vulkan/implicit_layer.d"
  install -Dm 644 config/vkBasalt.json "${pkgdir}/usr/share/vulkan/implicit_layer.d/vkBasalt.json"
}
