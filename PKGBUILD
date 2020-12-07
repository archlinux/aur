# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vcmod
pkgname=vapoursynth-plugin-${_plug}
pkgver=20200823
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=171412'
license=('GPL')
depends=('vapoursynth')
source=("${_plug}-${pkgver}.7z::http://www.avisynth.nl/users/vcmohan/${_plug}/${_plug}_src.7z"
        'esee'
        )
sha256sums=('c796d18aacc52cbd06b4df29680ca35f82441021d37b0c938e409e2d840f7d16'
            'f56a5f44b92f431b5d8b4095e0d6a09bd62df2e4ea52e071770e1563df4e1b21'
            )

prepare(){
  rm -fr VSHelper.h VapourSynth.h

  sed -e 's|vapoursynth.h|VapourSynth.h|g' \
      -e 's|vshelper.h|VSHelper.h|g' \
      -e 's|"VapourSynth.h"|<VapourSynth.h>|g' \
      -e 's|"VSHelper.h"|<VSHelper.h>|g' \
      -i *

      # quick fix for strcpy_s. idea taked from https://github.com/opencv/opencv/pull/13032/files
      patch --binary -p1 -i "${srcdir}/esee"

  echo "all:
	  g++ -c -fPIC ${CXXFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o vcmod.o vcmod.cpp
	  g++ -shared -fPIC ${LDFLAGS} -o lib${_plug}.so vcmod.o" > Makefile
}

build() {
  make
}

package() {
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"
}
