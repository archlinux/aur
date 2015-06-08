# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=flash3kyuu_deband
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=2.0pre.r410.b98d6bc
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url="http://forum.doom9.org/showthread.php?t=161411"
license=('GPL3')
depends=('vapoursynth')
makedepends=('git' 'python-sphinx')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/SAPikachu/${_plug}.git")
sha1sums=('SKIP')

pkgver() {
  cd "${_plug}"
  _ver="$(cat wscript | grep 'VERSION = ' | cut -d '"' -f2)"
  echo "$(echo ${_ver}).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_plug}"
  rm -fr src/vapoursynth/{VapourSynth,VSHelper}.h
  mkdir -p docs/source/_static
}

build() {
  cd "${_plug}"
  CXXFLAGS+=" $(pkg-config --cflags vapoursynth)" ./waf --mode=release --prefix=/usr --libdir=/usr/lib/vapoursynth configure build
  sphinx-build docs/source html
}

package(){
  cd "${_plug}"
  ./waf install --no-ldconfig --destdir="${pkgdir}"
  for i in $(find html -type f); do install -Dm644 ${i} "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/${i}"; done
}
