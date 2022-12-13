# Maintainer: Zeioth <zeioth@hotmail.com>
# Contributor: FabioLolix <fabio.loli@disroot.org>


pkgname=vkbasalt-git
pkgver=0.3.2.7.r0.ga705b44
pkgrel=1
pkgdesc='A Vulkan post-processing layer. Some of the effects are CAS, FXAA, SMAA, deband.'
arch=('x86_64')
url='https://github.com/DadSchoorse/vkBasalt'
license=('MIT')
depends=('glslang' 'libx11')
makedepends=('git' 'meson' 'ninja' 'spirv-headers' 'vulkan-headers')
optdepends=('reshade-shaders-git')
provides=(vkbasalt)
conflicts=(vkbasalt)
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/vkBasalt"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/vkBasalt"
  sed -i 's|/path/to/reshade-shaders/Textures|/opt/reshade/textures|g' \
    "config/vkBasalt.conf"
  sed -i 's|/path/to/reshade-shaders/Shaders|/opt/reshade/shaders|g' \
    "config/vkBasalt.conf"
}

build() {
  cd "${srcdir}/vkBasalt"

  arch-meson \
    --buildtype=release \
    build
  ninja -C build
}

package() {
  cd "${srcdir}/vkBasalt"

  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm 644 config/vkBasalt.conf "${pkgdir}/usr/share/vkBasalt/vkBasalt.conf.example"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
