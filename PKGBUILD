# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: gee
# Contributor: yochananmarqos
# Contributor: bpierre
# Contributor: PedroHLC
# Contributor: rodrigo21
# Contributor: FabioLolix

pkgbase=vkbasalt-redemp-git
pkgname=("${pkgbase}" "lib32-${pkgbase}")
pkgdesc='A Vulkan post-processing layer (Redemp fork)'
pkgver=r470.gd5c38ed
pkgrel=1
url='https://github.com/Redemp/vkBasalt'
arch=(x86_64)
license=('Zlib')
makedepends=('git' 'glslang' 'meson' 'ninja' 'spirv-headers' 'vulkan-headers')
_lib64_depends=('glibc' 'libgcc' 'libstdc++' 'libx11')
_lib32_depends=('lib32-glibc' 'lib32-gcc-libs' 'lib32-libx11')
depends=("${_lib64_depends[@]}" "${_lib32_depends[@]}")
optdepends=('reshade-shaders-git: collection of shaders to use with vkBasalt')
source=("Redemp-vkBasalt::git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd Redemp-vkBasalt

  local version commit
  version="$(git rev-list --count HEAD)"
  commit="$(git rev-parse --short=7 HEAD)"
  printf 'r%s.g%s\n' "${version}" "${commit}"
}

prepare() {
  cd Redemp-vkBasalt

  sed -i 's|/path/to/reshade-shaders|/opt/reshade|g' config/vkBasalt.conf
}

_build_64-bit() {
  arch-meson build -D b_lto=true
  meson compile -C build
}

_build_32-bit() (
  export ASFLAGS="${ASFLAGS} --32"
  export CFLAGS="${CFLAGS} -m32"
  export CXXFLAGS="${CXXFLAGS} -m32"
  export LDFLAGS="${LDFLAGS} -m32"
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

  arch-meson --libdir=lib32 build32 -D b_lto=true -D with_json=false
  meson compile -C build32
)

build() {
  cd Redemp-vkBasalt

  _build_64-bit
  _build_32-bit
}

package_vkbasalt-redemp-git() {
  depends=("${_lib64_depends[@]}")
  provides=('vkbasalt')
  conflicts=('vkbasalt')

  cd Redemp-vkBasalt

  meson install -C build --destdir "${pkgdir}"
  install -vD -m644 config/vkBasalt.conf -T "${pkgdir}/usr/share/vkBasalt/vkBasalt.conf.example"
  install -vD -t "${pkgdir}/usr/share/licenses/${pkgbase}/" -m644 LICENSE
}

package_lib32-vkbasalt-redemp-git() {
  pkgdesc="${pkgdesc} (32-bit)"
  depends=("${pkgbase}" "${_lib32_depends[@]}")
  provides=('lib32-vkbasalt')
  conflicts=('lib32-vkbasalt')

  cd Redemp-vkBasalt

  meson install -C build32 --destdir "${pkgdir}"
  install -vD -t "${pkgdir}/usr/share/licenses/lib32-${pkgbase}/" -m644 LICENSE
}
