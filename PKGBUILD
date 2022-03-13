# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=scenechange
pkgname=vapoursynth-plugin-${_plug}
pkgver=0.2.0_2
pkgrel=9
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('x86_64')
url='http://forum.doom9.org/showthread.php?t=166769'
license=('LGPL2.1')
depends=('vapoursynth-plugin-temporalsoften2-git')
source=("https://sl1pkn07.wtf/${_plug}/${_plug}-${pkgver/_/-}.7z")
sha256sums=('138ef3bd565e54dab556080e0ae3a426ef00f62f340e8eb6c2cb134dbf14332c')
options=('debug')

_site_packages="$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"

prepare() {
  rm -fr src/Vapoursynth.h

  echo "all:
	  gcc -c -std=gnu99 -ffast-math -fexcess-precision=fast -fPIC ${CFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o scenechange.o src/scenechange.c
	  gcc -shared -fPIC ${LDFLAGS} -o lib${_plug}.so scenechange.o" > Makefile
}

build() {
  make
}

package(){
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"

  install -Dm644 readme.txt "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.txt"

}
