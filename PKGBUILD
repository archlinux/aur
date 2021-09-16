# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=knlmeanscl
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=1.1.1.r552.1ba48ce
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=171379'
license=('GPL')
depends=('vapoursynth'
         'opencl-icd-loader'
         )
makedepends=('git'
             'opencl-headers'
             'meson'
             'boost'
             )
conflicts=("vapoursynth-plugin-${_plug}")
provides=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Khanattila/KNLMeansCL.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  _ver="$(cat KNLMeansCL/NLMDefault.h | grep -m1 '#define VERSION' | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  arch-meson "../${_plug}" \
    --buildtype=release

  ninja
}

package(){
  DESTDIR="${pkgdir}" ninja -C build install
}
