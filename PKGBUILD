# Maintainer: gee

pkgname=vkbasalt
pkgver=0.3.1
pkgrel=1
pkgdesc='A Vulkan post-processing layer. Currently the effects are CAS, FXAA, SMAA, deband.'
arch=('x86_64')
url='https://github.com/DadSchoorse/vkBasalt'
license=('zlib')
makedepends=('git')
depends=('glslang' 'vulkan-headers' 'vulkan-tools' 'vulkan-validation-layers' 'lib32-glibc' 'lib32-gcc-libs' 'lib32-libx11')
optdepends=('reshade-shaders-git')
source=("git+https://github.com/DadSchoorse/vkBasalt.git#tag=v${pkgver}"
        "git+https://github.com/DadSchoorse/reshade.git#commit=82bc5d1")
sha256sums=(SKIP
            SKIP)
install=vkbasalt.install

prepare() {
  cd ${srcdir}/vkBasalt
  git submodule init
  git config submodule.reshade.url ../reshade
  git submodule update

  sed -i 's|../reshade/deps/spirv/include/spirv/unified1|/usr/include/SPIRV/|g' src/makefile
}

build() {
  cd ${srcdir}/vkBasalt

  CXXFLAGS="$CXXFLAGS -fPIC" make
}

package() {
  cd ${srcdir}/vkBasalt

  install -Dm 755 build/libvkbasalt64.so "${pkgdir}/usr/lib/libvkbasalt.so"
  install -Dm 755 build/libvkbasalt32.so "${pkgdir}/usr/lib32/libvkbasalt.so"
  install -dm 755 "${pkgdir}/usr/share/vkBasalt/shader"
  install -Dm 644 build/shader/*.spv  "${pkgdir}/usr/share/vkBasalt/shader"
  install -Dm 644 config/vkBasalt.conf "${pkgdir}/usr/share/vkBasalt/vkBasalt.conf.example"
  sed -i 's|*path/to/reshade-shaders/Textures\*|/usr/share/reshade/textures|g' "${pkgdir}/usr/share/vkBasalt/vkBasalt.conf.example"
  sed -i 's|*path/to/reshade-shaders/Shaders\*|/usr/share/reshade/shaders|g' "${pkgdir}/usr/share/vkBasalt/vkBasalt.conf.example"
  install -dm 755 "${pkgdir}/usr/share/vulkan/implicit_layer.d"
  sed 's+@lib+/usr/lib/libvkbasalt.so+g' config/vkBasalt64.json > "${pkgdir}/usr/share/vulkan/implicit_layer.d/vkBasalt64.json"
  sed 's+@lib+/usr/lib32/libvkbasalt.so+g' config/vkBasalt32.json > "${pkgdir}/usr/share/vulkan/implicit_layer.d/vkBasalt32.json"
}
