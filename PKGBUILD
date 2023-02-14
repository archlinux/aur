# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=iccconvert
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=5.0.2.g184b0e4
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=183115'
license=('LGPL')
depends=('vapoursynth'
         'libmagick'
         'libxrandr'
         'libcolord.so'
         )
makedepends=('git'
             'meson'
             'gcc-objc'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/YomikoR/VapourSynth-ICCConvert.git"
        'git+https://github.com/sekrit-twc/libp2p.git'
        )
sha256sums=('SKIP'
            'SKIP'
            )
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  cd "${_plug}"

  git config submodule.src/libp2p.url "${srcdir}/libp2p"
  git -c protocol.file.allow=always submodule update --init \
    src/libp2p

  rm -fr src/vapoursynth
}

build() {
  cd build
  arch-meson "../${_plug}" \
    --libdir /usr/lib/vapoursynth

  ninja
}

package(){
  install -Dm755 build/libiccc_colord.so "${pkgdir}/usr/lib/libvapoursynth/libiccc_colord.so"
  install -Dm755 build/libiccc.so "${pkgdir}/usr/lib/libvapoursynth/libiccc.so"

  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
