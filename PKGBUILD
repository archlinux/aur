# Maintainer: marmis
# Contributor: gee
# Contributor: yochananmarqos
# Contributor: bpierre
# Contributor: PedroHLC
# Contributor: rodrigo21
# Contributor: FabioLolix

pkgname='vkbasalt-redemp-git'
pkgver=r470.d5c38ed
pkgrel=1
pkgdesc='A Vulkan post-processing layer. Some of the effects are CAS, FXAA, SMAA, deband. (Redemp fork)'
arch=('x86_64')
url='https://github.com/Redemp/vkBasalt'
license=('Zlib')
makedepends=('git' 'glslang' 'meson' 'ninja' 'spirv-headers' 'vulkan-headers')
depends=('glibc' 'gcc-libs' 'libx11')
optdepends=('reshade-shaders-git: collection of shaders to use with vkBasalt')
provides=('vkbasalt')
conflicts=('vkbasalt')
source=("${pkgname}-${pkgver//_/-}::git+${url}.git")
b2sums=('SKIP')
install=vkbasalt.install

pkgver() {
  cd "${srcdir}/${pkgname}-${pkgver//_/-}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver//_/-}"

  sed -i 's|/path/to/reshade-shaders|/opt/reshade|g' \
    "config/vkBasalt.conf"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver//_/-}"

  arch-meson --buildtype=release -D b_lto=true build
  meson compile -C build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver//_/-}"

  DESTDIR="${pkgdir}" ninja -C build install
  mv "${pkgdir}"/usr/share/vulkan/implicit_layer.d/vkBasalt.{,"${CARCH}".}json
  install -Dm 644 config/vkBasalt.conf "${pkgdir}/usr/share/vkBasalt/vkBasalt.conf.example"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
