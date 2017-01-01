# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=scenechange
pkgname=vapoursynth-plugin-${_plug}
pkgver=0.2.0_2
pkgrel=6
pkgdesc="Plugin for Vapoursynth: ${_plug} (Include temporalsoften2 script)"
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?t=166769'
license=('LGPL2.1')
depends=('vapoursynth')
source=("https://dl.dropbox.com/u/6596386/vapoursynth-plugins/${_plug}-${pkgver/_/-}.7z")
sha256sums=('138ef3bd565e54dab556080e0ae3a426ef00f62f340e8eb6c2cb134dbf14332c')

_site_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

prepare() {
  rm -fr src/Vapoursynth.h

  echo "all:
	  gcc -c -std=gnu99 -ffast-math -fexcess-precision=fast -fPIC ${CFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o scenechange.o src/scenechange.c
	  gcc -c -std=gnu99 -ffast-math -fexcess-precision=fast -fPIC ${CFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o temporalsoften.o src/temporalsoften.c
	  gcc -shared -fPIC ${LDFLAGS} -o lib${_plug}.so scenechange.o
	  gcc -shared -fPIC ${LDFLAGS} -o libtemporalsoften2.so temporalsoften.o" > Makefile
}

build() {
  make
}

package(){
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"
  install -Dm755 libtemporalsoften2.so "${pkgdir}/usr/lib/vapoursynth/libtemporalsoften2.so"

  install -Dm644 temporalsoften2.py "${pkgdir}${_site_packages}/temporalsoften2.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/temporalsoften2.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/temporalsoften2.py"

  install -Dm644 readme.txt "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.txt"
  install -Dm644 readme_temporalsoften.txt "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README_temporalsoften2.txt"
}
