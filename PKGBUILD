# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=mvtools_sf
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r9.7.g5dfa875
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=172525'
license=('GPL2')
depends=('vapoursynth'
         'fftw'
         )
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/IFeelBloated/vapoursynth-mvtools-sf.git")
sha256sums=('SKIP')

_site_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  cd "${_plug}"

  rm -fr src/VapourSynth.h src/VSHelper.h

  chmod +x autogen.sh
  ./autogen.sh
}

build() {
  cd build
  CXXFLAGS+=" $(pkg-config --cflags vapoursynth)" \
  ../"${_plug}"/configure \
    --prefix=/usr \
    --libdir=/usr/lib/vapoursynth

  make
}

package(){
  make -C build DESTDIR="${pkgdir}" install

  install -Dm644 "${_plug}/src/mvmulti.py" "${pkgdir}${_site_packages}/mvmulti.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/mvmulti.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/mvmulti.py"
}
