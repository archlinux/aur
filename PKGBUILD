# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=removedirtvs
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r78.ddc78e5
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?t=169771'
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
  #echo "$(git describe --long --tags)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  rm -fr "${_plug}/"{VapourSynth,VSHelper}.h

  echo "all:
	  g++ -o lib${_plug}.so -std=gnu++11 ${CXXFLAGS} ${CPPFLAGS} ${LDFLAGS} $(pkg-config --cflags vapoursynth) ${_plug}/*.cpp -fPIC -shared -fpermissive -DVS_TARGET_CPU_X86=1" > Makefile
}

build() {
  make
}

package() {
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"
  install -Dm644 removedirtvs.py "${pkgdir}${_sites_packages}/removedirtvs.py"
}
