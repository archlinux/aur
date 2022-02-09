# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Mikuro Kagamine <mikurok@forgecrushing.com>

_plug=znedi3
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r2.1.4.g643e4b4
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT Version)"
arch=('x86_64')
url='https://github.com/sekrit-twc/znedi3'
license=('GPL2')
depends=('vapoursynth'
         'vapoursynth-plugin-nnedi3_weights_bin'
         )
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/JeremyMahieu/${_plug}.git"
        'git+https://github.com/sekrit-twc/vsxx.git'
        )
sha256sums=('SKIP'
            'SKIP'
            )

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cd "${_plug}"
  git config submodule.vsplugin/vsxx.url "${srcdir}/vsxx"
  git submodule update --init vsxx

  # use system vapoursynth headers
  rm -fr vsxx/VapourSynth

  sed -e 's|"VapourSynth4.h"|<VapourSynth4.h>|g' \
      -e 's|"VSHelper4.h"|<VSHelper4.h>|g' \
      -i vsxx/VapourSynth4++.hpp

  sed -e 's|-Ivsxx/VapourSynth||g' \
      -e '/VSScript4.h/d' \
      -e '/VapourSynth4.h/d' \
      -e '/VSHelper4.h/d' \
      -i Makefile
}

build() {
  CXXFLAGS+=" $(pkg-config --cflags vapoursynth)"
  CPPFLAGS+=" -DNNEDI3_WEIGHTS_PATH=\\\"/usr/lib/vapoursynth/nnedi3_weights.bin\\\""
  cd "${_plug}"
  LC_ALL=C make V=1 X86=1
}

package(){
  install -Dm755 "${_plug}/vsznedi3.so" "${pkgdir}/usr/lib/vapoursynth/libvsznedi3.so"

  install -Dm644 "${_plug}/readme.rst" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/readme.rst"
}
