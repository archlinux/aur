# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vautodeint
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=v0.0.1.0.g70bcc3d
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url='https://github.com/gnaggnoyil/VAutoDeint'
license=('GPL')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/gnaggnoyil/VAutoDeint.git")
sha1sums=('SKIP')

_sites_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cd "${_plug}"
  
  rm -fr externalfilters/VSHelper.h externalfilters/VapourSynth.h

  echo "all:
	  gcc -c -Os -g0 -std=gnu++11 -I. -fPIC -Wextra -Wno-unused-parameter ${CXXFLAGS} ${CPPFLAGS} $(pkg-config --cflags vapoursynth) -o IsCombedTIVTCport.o externalfilters/IsCombedTIVTCport.cpp
	  gcc -c -Os -g0 -std=gnu++11 -I. -fPIC -Wextra -Wno-unused-parameter ${CXXFLAGS} ${CPPFLAGS} $(pkg-config --cflags vapoursynth) -o PlaneDifferenceFromPrevious.o externalfilters/PlaneDifferenceFromPrevious.cpp
	  gcc -c -Os -g0 -std=gnu++11 -I. -fPIC -Wextra -Wno-unused-parameter ${CXXFLAGS} ${CPPFLAGS} $(pkg-config --cflags vapoursynth) -o PluginInit.o externalfilters/PluginInit.cpp
	  gcc -shared -fPIC ${LDFLAGS} -o lib${_plug}.so IsCombedTIVTCport.o PlaneDifferenceFromPrevious.o PluginInit.o" > Makefile
}

build() {
  cd "${_plug}"
  make
}

package(){
  cd "${_plug}"
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"
  install -Dm644 VAutoDeint.py "${pkgdir}${_sites_packages}/VAutoDeint.py"
  install -Dm644 README "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
