# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vsakarin
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=v0.92.4.g8adcefc
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GITversion)"
arch=('x86_64')
url='https://github.com/akarinVS/vapoursynth-plugin.git'
license=('GPL')
depends=('vapoursynth'
         )
makedepends=('git'
             'meson'
             'clang+llvm-binaries=11.1.0'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/akarinVS/vapoursynth-plugin.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare(){
  mkdir -p build

  (cd build;
  ln -s "/opt/clang+llvm11/bin/llvm-config" llvm-config

cat <<EOF>> build_file.ini
[binaries]
llvm-config = '$(pwd)/llvm-config'
EOF
  )

}

build() {
  cd build

  CC="/opt/clang+llvm11/bin/clang-11" \
  CXX="/opt/clang+llvm11/bin/clang++" \
  LDFLAGS+=" -fuse-ld=lld" \
  arch-meson "../${_plug}" \
    --buildtype=release \
    --native-file=build_file.ini

  ninja
}

package(){
  DESTDIR="${pkgdir}" ninja -C build install

  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
