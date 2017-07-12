# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vfrtocfr
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=v1.0.2.gc25cce8
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('i686' 'x86_64')
url='https://forum.doom9.org/showthread.php?t=174711'
license=('BSD')
depends=('vapoursynth')
source=("${_plug}::git+https://github.com/blaze077/Vapoursynth-VFRToCFR.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare(){
  cd "${_plug}"

  sed -e 's|"VapourSynth.h"|<VapourSynth.h>|g' \
      -e 's|"VSHelper.h"|<VSHelper.h>|g' \
    -i VFRToCFR.cpp

  echo "all:
	  g++ -c -fPIC ${CXXFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o VFRToCFR.o VFRToCFR.cpp

	  g++ -shared -L. -fPIC ${LDFLAGS} -o libvs${_plug}.so VFRToCFR.o"> Makefile
}

build() {
  cd "${_plug}"
  make
}

package() {
  cd "${_plug}"
  install -Dm755 "libvs${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/libvs${_plug}.so"

  install -Dm644 README.rst "${pkgdir}/usr/share/doc/vapoursynth/plugins/${pkgname}/README.rst"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
