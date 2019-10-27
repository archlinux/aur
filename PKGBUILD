# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Mikuro Kagamine <mikurok@forgecrushing.com>

_plug=edgefixer
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r1.8.gfb00a01
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('x86_64')
url='https://github.com/sekrit-twc/znedi3'
license=('GPL2')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/sekrit-twc/EdgeFixer.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cd "${_plug}"

  # use system vapoursynth headers
  rm -fr EdgeFixer/VapourSynth.h
  rm -fr EdgeFixer/VSHelper.h

  pwd

  sed -e 's|"VapourSynth.h"|<VapourSynth.h>|g' \
      -e 's|"VSHelper.h"|<VSHelper.h>|g' \
      -i EdgeFixer/vsplugin.c

  echo "all:
	  gcc -c -fPIC ${CXXFLAGS} ${CPPFLAGS} -I. -I./src/imagine -I./extra $(pkg-config --cflags vapoursynth) -o vsplugin.o EdgeFixer/vsplugin.c
	  gcc -c -fPIC ${CXXFLAGS} ${CPPFLAGS} -I. -I./src/imagine -I./extra $(pkg-config --cflags vapoursynth) -o edgefixer.o EdgeFixer/edgefixer.c

	  gcc -shared -fPIC ${LDFLAGS} -o libvs${_plug}.so vsplugin.o edgefixer.o"> Makefile
}

build() {
  make -C "${_plug}"
}

package(){
  install -Dm755 "${_plug}/libvs${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/libvs${_plug}.so"

  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
