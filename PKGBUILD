# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=fixtelecinedfades
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r5.28.g36c3423
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?t=174151'
license=('GPL2')
depends=('vapoursynth')
makedepends=('git'
             'meson'
             'yasm'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/IFeelBloated/Fix-Telecined-Fades.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cd "${_plug}"

  rm -fr VapourSynth.h VSHelper.h

  sed -e 's|"VapourSynth.h"|<VapourSynth.h>|g' \
      -e 's|"VSHelper.h"|<VSHelper.h>|g' \
      -i Shared.hpp

  mkdir build
  cd build
  meson .. \
   --prefix="${EPREFIX}/usr" \
   --buildtype=plain
}

build() {
  cd "${_plug}/build"

  ninja -v
}

package(){
  cd "${_plug}/build"
  DESTDIR="${pkgdir}" ninja install
}
