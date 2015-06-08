# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=scenechange
pkgname=vapoursynth-plugin-${_plug}
pkgver=0.2.0_2
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (Include temporalsoften2 script)"
arch=('i686' 'x86_64')
url="http://forum.doom9.org/showthread.php?t=166769"
license=('LGPL2.1')
depends=('vapoursynth')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}-git")
makedepends=('git')
source=("https://dl.dropbox.com/u/6596386/vapoursynth-plugins/${_plug}-${pkgver/_/-}.7z")
sha1sums=('98ffaf3ea7ed8294a6a4b415c2ff813f5b87b8f1')
noextract=("${_plug}-${pkgver/_/-}.7z")
_sites_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

build() {
  mkdir -p "${_plug}-build"
  cd "${_plug}-build/"
  bsdtar -xf "../${_plug}-${pkgver/_/-}.7z"
  cd src

  CFLAGS="-fPIC -Wall -Wshadow -std=gnu99 -I."
  XLDFLAGS="-Wl,-s"
  XCFLAGS="-Os -g0 -ffast-math -fexcess-precision=fast -fomit-frame-pointer"
  LDFLAGS="-shared -fPIC -L."
  gcc -o libscenechange.so $CFLAGS $XCFLAGS $LDFLAGS $XLDFLAGS scenechange.c
  gcc -o libtemporalsoften2.so $CFLAGS $XCFLAGS $LDFLAGS $XLDFLAGS temporalsoften.c
}

package(){
  cd "${_plug}-build"
  install -Dm755 src/libscenechange.so "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"
  install -Dm755 src/libtemporalsoften2.so "${pkgdir}/usr/lib/vapoursynth/libtemporalsoften2.so"
  install -Dm644 readme.txt "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"
  install -Dm644 readme_temporalsoften.txt "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README_temporalsoften2"
  install -Dm644 temporalsoften2.py "${pkgdir}${_sites_packages}/temporalsoften2.py"
}

