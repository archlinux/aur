# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vsakarin
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=0.96f.r128.6d7c733
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/akarinVS/vapoursynth-plugin.git'
license=('GPL')
depends=(
  'vapoursynth'
  'gcc-libs' # libgcc_s.so libstdc++.so
  'glibc' # ld-linux-x86-64.so libc.so libm.so
  'llvm-libs' # libLLVM-18.so
  )
makedepends=(
  'git'
  'meson'
  'llvm'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=(
  "${_plug}::git+https://github.com/Jaded-Encoding-Thaumaturgy/akarin-vapoursynth-plugin.git"
  "https://github.com/AkarinVS/vapoursynth-plugin/pull/23.diff"
)
sha256sums=(
  'SKIP'
  '60a93b109081d2d5e13375faa788a05db938f4769b7c995cc4130c94c79c37d3'
  )
options=('debug')

pkgver() {
  cd "${_plug}"
  printf "0.96f.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  patch -d "${_plug}" -p1 -i "${srcdir}/23.diff"
}

build() {
  arch-meson "${_plug}" build \
    --buildtype=release \
    -Dstatic-llvm=false

  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build

  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
