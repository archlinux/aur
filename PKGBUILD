# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=scenechange
pkgname=vapoursynth-plugin-${_plug}
pkgver=0.2.0_2
pkgrel=3
pkgdesc="Plugin for Vapoursynth: ${_plug} (Include temporalsoften2 script)"
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?t=166769'
license=('LGPL2.1')
depends=('vapoursynth')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}-git")
makedepends=('git')
source=("https://dl.dropbox.com/u/6596386/vapoursynth-plugins/${_plug}-${pkgver/_/-}.7z")
sha1sums=('98ffaf3ea7ed8294a6a4b415c2ff813f5b87b8f1')

_sites_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

prepare() {
  rm -fr src/Vapoursynth.h

  echo "all:
	  gcc -c -std=gnu99 -msse2 -mfpmath=sse -ffast-math -fomit-frame-pointer -fPIC ${CFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o scenechange.o src/scenechange.c
	  gcc -c -std=gnu99 -msse2 -mfpmath=sse -ffast-math -fomit-frame-pointer -fPIC ${CFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o temporalsoften.o src/temporalsoften.c
	  gcc -shared -fPIC ${LDFLAGS} -o lib${_plug}.so scenechange.o
	  gcc -shared -fPIC ${LDFLAGS} -o libtemporalsoften2.so temporalsoften.o" > Makefile
}

build() {
  make
}

package(){
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"
  install -Dm755 libtemporalsoften2.so "${pkgdir}/usr/lib/vapoursynth/libtemporalsoften2.so"
  install -Dm644 temporalsoften2.py "${pkgdir}${_sites_packages}/temporalsoften2.py"

  install -Dm644 readme.txt "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.txt"
  install -Dm644 readme_temporalsoften.txt "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README_temporalsoften2.txt"
}
