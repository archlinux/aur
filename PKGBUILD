# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=remapframes
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=v1.0.1.gdec8c9e
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('i686' 'x86_64')
url='https://forum.doom9.org/showthread.php?t=174727'
license=('BSD')
depends=('vapoursynth')
source=("${_plug}::git+https://github.com/blaze077/Vapoursynth-RemapFrames.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare(){
  cd "${_plug}"

  sed -e 's|"VapourSynth.h"|<VapourSynth.h>|g' \
      -e 's|"VSHelper.h"|<VSHelper.h>|g' \
    -i Common.h

  echo "all:
	  g++ -c -fPIC ${CXXFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o Common.o Common.cpp
	  g++ -c -fPIC ${CXXFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o RemapFrames.o RemapFrames.cpp
	  g++ -c -fPIC ${CXXFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o RemapFramesSimple.o RemapFramesSimple.cpp
	  g++ -c -fPIC ${CXXFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o ReplaceFramesSimple.o ReplaceFramesSimple.cpp
	  g++ -c -fPIC ${CXXFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o VSPlugin.o VSPlugin.cpp

	  g++ -shared -L. -fPIC ${LDFLAGS} -o libvs${_plug}.so Common.o RemapFrames.o RemapFramesSimple.o ReplaceFramesSimple.o VSPlugin.o"> Makefile
}

build() {
  cd "${_plug}"
  make
}

package() {
  cd "${_plug}"
  install -Dm755 "libvs${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/libvs${_plug}.so"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
