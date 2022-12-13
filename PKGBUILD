pkgname=vkbasalt-git
pkgver=1.0.r3.7e6ecfa
pkgrel=1
epoch=
pkgdesc='A Vulkan post-processing layer. Some of the effects are CAS, FXAA, SMAA, deband.'
arch=('x86_64')
url='https://github.com/DadSchoorse/vkBasalt'
license=('MIT')
depends=('gcc-libs' 'glslang' 'libx11')
makedepends=('meson' 'ninja' 'glslang' 'libx11' 'spirv-headers' 'vulkan-headers')
checkdepends=()
provides=(vkbasalt-git)
conflicts=(vkbasalt)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

prepare() {
  cd ${srcdir}/vkBasalt
  sed -i 's|/path/to/reshade-shaders/Textures|/opt/reshade/textures|g' \
    "config/vkBasalt.conf"
  sed -i 's|/path/to/reshade-shaders/Shaders|/opt/reshade/shaders|g' \
    "config/vkBasalt.conf"
}

build() {
  cd ${srcdir}/vkBasalt

  arch-meson \
    --buildtype=release \
    build
  ninja -C build
}

package() {
  optdepends=('reshade-shaders-git')
  cd ${srcdir}/vkBasalt

  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm 644 config/vkBasalt.conf "${pkgdir}/usr/share/vkBasalt/vkBasalt.conf.example"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/vkBasalt"
}
