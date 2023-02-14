# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=fftspectrum
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=1.5.g6326b2e
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/Beatrice-Raws/FFTSpectrum'
license=('GPL')
depends=('vapoursynth'
         'fftw'
         )
makedepends=('git'
             'meson'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Beatrice-Raws/FFTSpectrum.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d r)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  export CFLAGS="${CFLAGS/-march=x86-64 -mtune=generic/-march=native}"
  arch-meson "../${_plug}" \
    --libdir /usr/lib/vapoursynth

  ninja
}

package(){
  DESTDIR="${pkgdir}" ninja -C build install

  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
