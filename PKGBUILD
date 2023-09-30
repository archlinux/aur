# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vsakarin
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=0.96f.2.g8b7ff6d
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/akarinVS/vapoursynth-plugin.git'
license=('GPL')
depends=(
  'vapoursynth'
  'gcc-libs' # libgcc_s.so libstdc++.so
  'glibc' # ld-linux-x86-64.so libc.so libm.so
  'llvm15-libs' # libLLVM-15.so
  )
makedepends=(
  'git'
  'meson'
  'llvm15'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/akarinVS/vapoursynth-plugin.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  cat > native_config <<EOF
[binaries]
llvm-config = '/usr/lib/llvm15/bin/llvm-config'
EOF
}

build() {
  arch-meson "${_plug}" build \
    --buildtype=release \
    --native-file=native_config \
    -Dstatic-llvm=false

  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build

  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
