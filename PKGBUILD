# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=fmtconv
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r15.0.g7c6cd1e
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url="http://forum.doom9.org/showthread.php?t=166504"
license=('custom:WTFPL')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("git+https://github.com/EleonoreMizo/${_plug}.git")
sha1sums=('SKIP')

pkgver() {
  cd fmtconv
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  rm -fr fmtconv/src/VapourSynth.h
  cd fmtconv/build/unix/
  chmod +x autogen.sh

  ./autogen.sh
}

build() {
  cd fmtconv/build/unix
  CPPFLAGS="${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth)" ./configure --libdir=/usr/lib/vapoursynth
  make
}

package(){
  make -C fmtconv/build/unix DESTDIR=${pkgdir} install
  install -d "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/"
  install -m644 "${srcdir}/fmtconv/doc/"*.{png,html,css} "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/"
  install -Dm644 "${srcdir}/fmtconv/doc/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
