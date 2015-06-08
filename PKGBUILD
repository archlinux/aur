# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=fmtconv
pkgname=vapoursynth-plugin-${_plug}
pkgver=r15
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('i686' 'x86_64')
url="http://forum.doom9.org/showthread.php?t=166504"
license=('custom:WTFPL')
depends=('vapoursynth')
source=("http://ldesoras.free.fr/src/vs/${_plug}-${pkgver}.zip")
sha1sums=('be51f1748ca236c33136d0945cd4f2d3fd012029')

prepare() {
  rm -fr src/VapourSynth.h
  cd build/unix/
  chmod +x autogen.sh

  ./autogen.sh
}

build() {
  cd build/unix
  CPPFLAGS="${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth)" ./configure --libdir=/usr/lib/vapoursynth
  make
}

package(){
  make -C build/unix DESTDIR=${pkgdir} install
  install -d "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/"
  install -m644 "${srcdir}/doc/"*.{png,html,css} "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/"
  install -Dm644 "${srcdir}/doc/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}

