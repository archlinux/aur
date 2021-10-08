# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=yadifmod2
pkgname=avisynth-plugin-${_plug}-git
pkgver=0.2.7.0.g54afaf5
pkgrel=1
pkgdesc="Plugin for Avisynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/Asd-g/yadifmod2'
license=('GPL')
depends=('avisynthplus')
makedepends=('git'
             'cmake'
             )
provides=("avisynth-plugin-${_plug}")
conflicts=("avisynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Asd-g/yadifmod2.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p "${_plug}/build"
}

build() {
  cd "${_plug}/build"

  CXXFLAGS+=" $(pkg-config --cflags avisynth)" cmake .. \
   -DCMAKE_BUILD_TYPE=Release \
   -DCMAKE_INSTALL_PREFIX=/usr \

  make
}

package(){
  make -C "${_plug}/build" DESTDIR="${pkgdir}" install

  install -Dm644 "${_plug}/readme.md" "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/README.md"
}
