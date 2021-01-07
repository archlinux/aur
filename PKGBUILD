# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=turnstile
pkgname=avisynth-plugin-${_plug}-git
pkgver=v1.0.0.0.g9174d07
pkgrel=1
pkgdesc="Plugin for Avisynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/ItEndsWithTens/TurnsTile'
license=('GPL')
depends=('avisynthplus')
makedepends=('git'
             'cmake'
             )
provides=("avisynth-plugin-${_plug}")
conflicts=("avisynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/ItEndsWithTens/TurnsTile.git"
        'git+https://github.com/lvandeve/lodepng.git'
        'esee'
        )
sha256sums=('SKIP'
            'SKIP'
            '6c4265143c0ff198634c31f04b15a0eb232cf332cadedac8b42aa12ff91886f2'
            )

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  cd "${_plug}"
  patch -p1 -i "${srcdir}/esee"

  git config submodule.include/lodepng.url "${srcdir}/lodepng"
  git submodule update --init include/lodepng
}

build() {
  cd build

  cmake "../${_plug}" \
   -DCMAKE_BUILD_TYPE=None \
   -DCMAKE_INSTALL_PREFIX=/usr \
   -DAVISYNTHPLUS_HDR=/usr/include/avisynth/avisynth.h

  make
}

package(){
  make -C build DESTDIR="${pkgdir}" install
}
