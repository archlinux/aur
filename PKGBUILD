# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=dpid
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r3.4.g4b74ad9
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/WolframRhodium/VapourSynth-dpid'
license=('GPL')
depends=('vapoursynth'
         'cuda'
         )
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/WolframRhodium/VapourSynth-dpid.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}


prepare() {
  cd "${_plug}/Source"

  sed -e 's|"vapoursynth\\VapourSynth.h"|<VapourSynth.h>|g' \
      -e 's|"vapoursynth\\VSHelper.h"|<VSHelper.h>|g' \
      -i dpid.cpp

  echo "all:
	  nvcc -Xcompiler -fPIC -rdc=true -c -o kernel8_.o kernel8.cu
	  nvcc -Xcompiler -fPIC -dlink -o kernel8.o kernel8_.o
	  nvcc -Xcompiler -fPIC -rdc=true -c -o kernel16_.o kernel16.cu
	  nvcc -Xcompiler -fPIC -dlink -o kernel16.o kernel16_.o
	  g++ -c -fPIC ${CFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o dpid.o dpid.cpp
	  g++ -shared -L/opt/cuda/lib64 -lcudart -fPIC ${LDFLAGS} -o lib${_plug}.so kernel8.o kernel16.o dpid.o" > Makefile
}

build() {
  make -C "${_plug}/Source"
}

package(){
  cd "${_plug}"
  install -Dm755 "Source/lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
