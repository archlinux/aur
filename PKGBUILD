# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=videoscope
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=1.0.2.g527b9b0
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url="https://github.com/dubhater/vapoursynth-${_plug}"
license=('custom:WTFPL')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/dubhater/vapoursynth-${_plug}.git"
        'COPYING::http://www.wtfpl.net/txt/copying/')
sha256sums=('SKIP'
            '0356258391e190dc1d44ea01565cfe627fe44e27dad693a0a54c2483a7b223e5'
            )
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  mkdir -p build
}

build() {
  cd "${_plug}"
  ./autogen.sh

  cd "${srcdir}/build"
  "../${_plug}/configure" \
    --prefix=/usr \
    --libdir=/usr/lib/vapoursynth

  make
}

package(){
  make -C build DESTDIR="${pkgdir}" install

  install -Dm644 "${_plug}/readme.rst" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/readme.rst"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
