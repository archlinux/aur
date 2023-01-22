# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=assrender
pkgname=avisynth-plugin-${_plug}-git
pkgver=0.35.11.gae23131
pkgrel=1
pkgdesc="Plugin for Avisynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/pinterf/assrender'
license=('GPL')
depends=('libavisynth.so'
         'libass.so'
         )
makedepends=('git'
             'cmake'
             'avisynthplus'
             'libass'
             )
provides=("avisynth-plugin-${_plug}")
conflicts=("avisynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/pinterf/assrender.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  rm -fr "${_plug}/src/include"
}

build() {
  cd build

  CFLAGS+=" $(pkg-config --cflags avisynth)"

  cmake "../${_plug}" \
   -DCMAKE_BUILD_TYPE=None \
   -DCMAKE_INSTALL_PREFIX=/usr \

  make
}

package(){
  make -C build DESTDIR="${pkgdir}" install

  install -Dm644 "${_plug}/docs/README.md" "${pkgdir}/usr/share/doc/avistnth/plugins/${_plug}/README.md"
}
