# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: gee
# Contributor: yochananmarqos
# Contributor: bpierre
# Contributor: PedroHLC
# Contributor: rodrigo21
# Contributor: FabioLolix

pkgbase='vkbasalt-redemp-git'
pkgname=("${pkgbase}" "lib32-${pkgbase}")
pkgver=r470.d5c38ed
pkgrel=2
pkgdesc='A Vulkan post-processing layer. (Redemp fork)'
arch=('x86_64')
url='https://github.com/Redemp/vkBasalt'
license=('Zlib')
_depends=('glibc' 'gcc-libs' 'libx11')
depends=("${_depends[@]}" "${_depends[@]/#/lib32-}")
makedepends=('git' 'glslang' 'meson' 'ninja' 'spirv-headers' 'vulkan-headers')
optdepends=('reshade-shaders-git: collection of shaders to use with vkBasalt')
source=("${pkgbase}-${pkgver//_/-}::git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgbase}-${pkgver//_/-}"

  version="$(git rev-list --count HEAD)"
  commit="$(git rev-parse --short=7 HEAD)"

  printf "r%s.%s" "${version}" "${commit}"
}

prepare() {
  cd "${srcdir}/${pkgbase}-${pkgver//_/-}"

  sed -i 's|/path/to/reshade-shaders|/opt/reshade|g' \
    "config/vkBasalt.conf"
}

_build_64-bit() {
  arch-meson --buildtype=release build -D b_lto=true
  meson compile -C build
}

_build_32-bit() {
  export ASFLAGS="${ASFLAGS} --32"
  export CFLAGS="${CFLAGS} -m32"
  export CXXFLAGS="${CXXFLAGS} -m32"
  export LDFLAGS="${LDFLAGS} -m32"
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

  arch-meson --libdir=lib32 --buildtype=release build32 -D b_lto=true
  meson compile -C build32
}

build() {
  cd "${srcdir}/${pkgbase}-${pkgver//_/-}"

  _build_64-bit
  _build_32-bit
}

package_vkbasalt-redemp-git() {
  depends=("${_depends[@]}")
  provides=('vkbasalt')
  conflicts=('vkbasalt')

  cd "${srcdir}/${pkgbase}-${pkgver//_/-}"

  meson install -C build --destdir "${pkgdir}"
  mv "${pkgdir}"/usr/share/vulkan/implicit_layer.d/vkBasalt.{,"${CARCH}".}json
  install -Dm 644 config/vkBasalt.conf "${pkgdir}/usr/share/vkBasalt/vkBasalt.conf.example"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgbase}"
}

package_lib32-vkbasalt-redemp-git() {
  pkgdesc="${pkgdesc} (32-bit)"
  depends=("${_depends[@]/#/lib32-}")
  optdepends+=("${pkgbase}: sample config at /usr/share/vkBasalt/vkBasalt.conf.example")
  provides=('lib32-vkbasalt')
  conflicts=('lib32-vkbasalt')

  cd "${srcdir}/${pkgbase}-${pkgver//_/-}"

  meson install -C build32 --destdir "${pkgdir}"
  mv "${pkgdir}"/usr/share/vulkan/implicit_layer.d/vkBasalt.{,x86.}json
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/lib32-${pkgbase}"
}
