# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=removedirtvs
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=20131120.ddc78e5
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url="http://forum.doom9.org/showthread.php?t=169771"
license=('GPL')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("git+https://github.com/handaimaoh/${_plug}.git"
        'removedirtvs.py')
sha1sums=('SKIP'
          'bf3826d8944b135c0f32fbfc5e21de35718a2c33')
_sites_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

pkgver() {
  cd "${_plug}"
  echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git log -1 --format="%h")"
}

prepare() {
  cd "${_plug}"
  rm VapourSynth.h VSHelper.h
  echo "all:
	  g++ -shared ${CXXFLAGS} -fPIC -fpermissive -DVS_TARGET_CPU_X86=1 -I. -o lib${_plug}.so *.cpp $(pkg-config --cflags vapoursynth)" > Makefile
}

build() {
  cd "${_plug}"
  make
}

package(){
  install -Dm755 "${_plug}/lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"
  install -Dm644 removedirtvs.py "${pkgdir}${_sites_packages}/removedirtvs.py"
}
