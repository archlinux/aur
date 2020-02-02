# Maintainer: gee

pkgname=vkbasalt
pkgver=0.3.0
pkgrel=2
pkgdesc='A Vulkan post-processing layer. Currently the effects are CAS, FXAA, SMAA, deband.'
arch=('x86_64')
url='https://github.com/DadSchoorse/vkBasalt'
license=('zlib')
depends=('glslang' 'vulkan-headers' 'vulkan-tools' 'vulkan-validation-layers' 'lib32-glibc' 'lib32-gcc-libs')
source=("git+https://github.com/DadSchoorse/vkBasalt.git#tag=v${pkgver}"
        "git+https://github.com/DadSchoorse/reshade.git#commit=8d0a5db"
        "git+https://github.com/skaslev/gl3w.git#commit=7729692"
        "git+https://github.com/ocornut/imgui.git#commit=927580d"
        "git+https://github.com/TsudaKageyu/minhook.git#commit=8fda4f5"
        "git+https://github.com/KhronosGroup/SPIRV-Headers.git#commit=af64a9e"
        "git+https://github.com/nothings/stb.git#commit=f67165c"
        "git+https://github.com/nemtrif/utfcpp.git#commit=c3f9261"
        "git+https://github.com/KhronosGroup/Vulkan-Headers.git#commit=5bc459e")
sha256sums=(SKIP
            SKIP
            SKIP
            SKIP
            SKIP
            SKIP
            SKIP
            SKIP
            SKIP)
install=vkbasalt.install

prepare() {
  cd ${srcdir}/vkBasalt
  git submodule init
  git config submodule.reshade.url ../reshade
  git submodule update
  
  cd reshade/deps
  git submodule init
  git config submodule.gl3w.url ../../../gl3w
  git config submodule.imgui.url ../../../imgui
  git config submodule.minhook.url ../../../minhook
  git config submodule.spirv.url  ../../../SPIRV-Headers
  git config submodule.stb.url ../../../stb
  git config submodule.utfcpp.url ../../../utfcpp
  git config submodule.vulkan.url ../../../Vulkan-Headers
  git submodule update
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
  install -dm 755 "${pkgdir}/usr/share/vulkan/implicit_layer.d"
  sed 's+@lib+/usr/lib/libvkbasalt.so+g' config/vkBasalt64.json > "${pkgdir}/usr/share/vulkan/implicit_layer.d/vkBasalt64.json"
  sed 's+@lib+/usr/lib32/libvkbasalt.so+g' config/vkBasalt32.json > "${pkgdir}/usr/share/vulkan/implicit_layer.d/vkBasalt32.json"
}
