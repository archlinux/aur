# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vautodeint
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=0.0.1.0.g70bcc3d
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/gnaggnoyil/VAutoDeint'
license=('GPL')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/gnaggnoyil/VAutoDeint.git")
sha256sums=('SKIP')
options=('debug')

_site_packages="$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  cd "${_plug}/externalfilters"

  rm -fr VapourSynth.h VSHelper.h

  echo "all:
	  g++ -c -std=gnu++11 -fPIC ${CXXFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o IsCombedTIVTCport.o IsCombedTIVTCport.cpp
	  g++ -c -std=gnu++11 -fPIC ${CXXFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o PlaneDifferenceFromPrevious.o PlaneDifferenceFromPrevious.cpp
	  g++ -c -std=gnu++11 -fPIC ${CXXFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o PluginInit.o PluginInit.cpp
	  g++ -shared -fPIC ${LDFLAGS} -o lib${_plug}.so IsCombedTIVTCport.o PlaneDifferenceFromPrevious.o PluginInit.o" > Makefile
}

build() {
  make -C "${_plug}/externalfilters"
}

package(){
  cd "${_plug}"
  install -Dm755 "externalfilters/lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"

  install -Dm644 VAutoDeint.py "${pkgdir}${_site_packages}/VAutoDeint.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/VAutoDeint.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/VAutoDeint.py"

  install -Dm644 README "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"
}
