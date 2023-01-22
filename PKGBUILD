# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=turnstile
pkgname=avisynth-plugin-${_plug}-git
pkgver=1.0.0.0.g9174d07
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
            'ca3cff98459311e4f3e219a3a4122562e737624ef9026048dc89b19bcc3568ab'
            )

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  cd "${_plug}"
  patch -p1 -i "${srcdir}/esee"
  sed 's|8_H|9_H|g' \
    -i CMakeLists.txt

  git config submodule.include/lodepng.url "${srcdir}/lodepng"
  git -c protocol.file.allow=always submodule update --init \
    include/lodepng
}

build() {
  CXXFLAGS=" $(pkg-config --cflags avisynth)"

  cmake -S "${_plug}" -B build \
   -DCMAKE_BUILD_TYPE=None \
   -DCMAKE_INSTALL_PREFIX=/usr \
   -DAVISYNTHPLUS_HDR=/usr/include/avisynth/avisynth.h \
   -DTURNSTILE_TESTS=OFF

  cmake --build build
}

package(){
  DESTDIR="${pkgdir}" cmake --install build
}
