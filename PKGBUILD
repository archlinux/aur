# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Mikuro Kagamine <mikurok@forgecrushing.com>

_plug=timecube
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r2a.0.gd3982b2
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('x86_64')
url='https://github.com/sekrit-twc/timecube'
license=('GPL2')
depends=('vapoursynth'
         )
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/sekrit-twc/${_plug}.git"
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
  install -Dm755 "${_plug}/vscube.so" "${pkgdir}/usr/lib/vapoursynth/libvscube.so"
  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/readme.rst"
}

