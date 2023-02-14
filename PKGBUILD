# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Mikuro Kagamine <mikurok@forgecrushing.com>

_plug=timecube
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=3.1.8.g868ed49
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/sekrit-twc/timecube'
license=('GPL2')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/sekrit-twc/timecube.git"
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
  git config submodule.vsxx.url "${srcdir}/vsxx"
  git config submodule.graphengine.url "${srcdir}/graphengine"
  git -c protocol.file.allow=always submodule update --init \
    vsxx \
    graphengine

  # use system vapoursynth headers
  rm -fr vsxx/vapoursynth

  sed -e "s| -Ivsxx/vapoursynth||g" \
      -e '/VSConstants4.h/d' \
      -e '/VapourSynth4.h/d' \
      -e '/VapourSynth.h/d' \
      -e '/VSHelper4.h/d'\
      -i Makefile
}

build() {
  CXXFLAGS+=" $(pkg-config --cflags vapoursynth)"

  make -C "${_plug}" X86=1
}

package(){
  install -Dm755 "${_plug}/vscube.so" "${pkgdir}/usr/lib/vapoursynth/libvscube.so"

  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/readme.rst"
}

