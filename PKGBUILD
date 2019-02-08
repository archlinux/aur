# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Mikuro Kagamine <mikurok@forgecrushing.com>

_plug=znedi3
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r70.815beb9
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('x86_64')
url='https://github.com/sekrit-twc/znedi3'
license=('GPL2')
depends=('vapoursynth'
         'vapoursynth-plugin-nnedi3_weights_bin'
         )
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/sekrit-twc/znedi3.git"
        'git+https://github.com/sekrit-twc/vsxx.git'
        )
sha256sums=('SKIP'
            'SKIP'
            )

pkgver() {
  cd "${_plug}"
  #echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_plug}"
  git config submodule.vsplugin/vsxx.url "${srcdir}/vsxx"
  git submodule update --init

  # use system vapoursynth headers
  rm -fr vsxx/VapourSynth.h
  rm -fr vsxx/VSScript.h
  rm -fr vsxx/VSHelper.h

  sed -e 's|"VapourSynth.h"|<VapourSynth.h>|g' \
      -e 's|"VSHelper.h"|<VSHelper.h>|g' \
      -i vsxx/VapourSynth++.hpp

  sed -e "s|-Ivsxx|& $(pkg-config --cflags vapoursynth)|g" \
      -e '/VSScript.h/d' \
      -e '/VapourSynth.h/d' \
      -e '/VSHelper.h/d'\
      -i Makefile
}

build() {
  make -C "${_plug}" X86=1
}

package(){
  install -Dm755 "${_plug}/vsznedi3.so" "${pkgdir}/usr/lib/vapoursynth/libvsznedi3.so"
  install -Dm644 "${_plug}/readme.rst" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/readme.rst"
}

