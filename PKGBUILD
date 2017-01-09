# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=miscfilters
pkgname=vapoursynth-plugin-${_plug}
pkgver=4
pkgrel=2
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?t=173871'
license=('LGPL2.1')
depends=('vapoursynth')
source=("https://dl.dropboxusercontent.com/u/36232595/vapoursynth/vapoursynth-miscfilters-${pkgver}.tar.gz"
        'https://raw.githubusercontent.com/vapoursynth/miscfilters/master/COPYING.LGPLv2.1'
        )
sha256sums=('5e7544a55001224749ed4b5b495215d50da9191b11cbf837b6dca943a1984e9d'
            'b634ab5640e258563c536e658cad87080553df6f34f62269a21d554844e58bfe'
            )

prepare() {
  cd "vapoursynth-miscfilters-${pkgver}"

  sed -e 's|"VSHelper.h"|<VSHelper.h>|g' \
      -e 's|"VapourSynth.h"|<VapourSynth.h>|g' \
      -i filtersharedcpp.h \
      -i filtershared.h

  echo "all:
	  g++ -c -std=c++11 -fPIC ${CXXFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o miscfilters.o miscfilters.cpp
	  g++ -shared  -fPIC ${LDFLAGS} -o lib${_plug}.so miscfilters.o"> Makefile
}

build() {
  cd "vapoursynth-miscfilters-${pkgver}"
  make
}

package(){
  cd "vapoursynth-miscfilters-${pkgver}"
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"
  install -Dm644 "${srcdir}/COPYING.LGPLv2.1" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.LGPLv2.1"
}
