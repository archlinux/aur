# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Mikuro Kagamine <mikurok@forgecrushing.com>

_plug=znedi3
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=2.1.22.g4e88a5d
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
source=("${_plug}::git+https://github.com/sekrit-twc/${_plug}.git"
        'git+https://github.com/sekrit-twc/vsxx.git'
        'git+https://github.com/sekrit-twc/graphengine.git'
        )
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            )
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d r)"
}

prepare() {
  cd "${_plug}"
  git config submodule.vsplugin/vsxx.url "${srcdir}/vsxx"
  git config submodule.graphengine.url "${srcdir}/graphengine"
  git -c protocol.file.allow=always submodule update --init \
    vsxx \
    graphengine

  # use system vapoursynth headers
  rm -fr vsxx/VapourSynth

  sed -e "s| -Ivsxx/vapoursynth||g" \
      -e '/VSConstants4.h/d' \
      -e '/VapourSynth4.h/d' \
      -e '/VSHelper4.h/d'\
      -i Makefile

}

build() {
  CXXFLAGS="${CXXFLAGS/-fno-plt/-fplt}"
  CPPFLAGS+=" $(pkg-config --cflags vapoursynth) -DNNEDI3_WEIGHTS_PATH=\\\"/usr/lib/vapoursynth/nnedi3_weights.bin\\\""
  LDFLAGS="${LDFLAGS/-z,now/-z,lazy}"

  make -C "${_plug}" X86=1 X86_AVX512=1
}

package(){
  install -Dm755 "${_plug}/vsznedi3.so" "${pkgdir}/usr/lib/vapoursynth/libvsznedi3.so"

  install -Dm644 "${_plug}/readme.rst" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/readme.rst"
}
