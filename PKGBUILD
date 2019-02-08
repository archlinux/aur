# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=f3kdb
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=2.0pre.r414.9b896a6
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='http://forum.doom9.org/showthread.php?t=161411'
license=('GPL3')
depends=('vapoursynth')
makedepends=('git'
             'python-sphinx'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}"
           'vapoursynth-plugin-flash3kyuu_deband'
           )
source=("${_plug}::git+https://github.com/SAPikachu/flash3kyuu_deband.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  _ver="$(cat wscript | grep 'VERSION = ' | cut -d '"' -f2)"
  echo "$(echo ${_ver}).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  rm -fr "${_plug}/src/vapoursynth/"{VapourSynth,VSHelper}.h

  mkdir -p "${_plug}/docs/source/_static"
}

build() {
  cd "${_plug}"
  CXXFLAGS+=" $(pkg-config --cflags vapoursynth)" \
  ./waf \
    --mode=release \
    --prefix=/usr \
    --libdir=/usr/lib/vapoursynth \
    configure build

  sphinx-build docs/source html
}

package(){
  cd "${_plug}"
  ./waf install --no-ldconfig --destdir="${pkgdir}"
  for i in $(find html -type f); do install -Dm644 ${i} "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/${i}"; done
}
