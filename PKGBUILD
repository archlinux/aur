# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vsakarin
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=0.94.0.g35b7fb6
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/akarinVS/vapoursynth-plugin.git'
license=('GPL')
depends=('vapoursynth'
         'llvm13-libs'
         )
makedepends=('git'
             'meson'
             'llvm13'
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

prepare(){
  mkdir -p build

  cat > build/native_config <<EOF
[binaries]
llvm-config = '/usr/lib/llvm13/bin/llvm-config'
EOF
}

build() {
  cd build

  arch-meson "../${_plug}" \
    --buildtype=release \
    -Dstatic-llvm=false \
    --native-file="$(pwd)/native_config"

  ninja
}

package(){
  DESTDIR="${pkgdir}" ninja -C build install

  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
