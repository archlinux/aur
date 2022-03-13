# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vfrtocfr
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=1.0.9.gd00a374
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=174711'
license=('BSD')
depends=('vapoursynth')
makedepends=('git'
             'meson'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Irrational-Encoding-Wizardry/Vapoursynth-VFRToCFR.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare(){
  mkdir -p build

  cd "${_plug}"
  sed -e 's|"VapourSynth.h"|<VapourSynth.h>|g' \
      -e 's|"VSHelper.h"|<VSHelper.h>|g' \
      -i VFRToCFR.cpp
}

build() {
  cd build
  arch-meson "../${_plug}" \
    --prefix=/usr

  ninja
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install

  install -Dm644 "${_plug}/README.rst" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.rst"
  install -Dm644 "${_plug}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
