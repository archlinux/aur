# Maintainer:  Joshua Holmer <jholmer.in@gmail.com>

_plug=misc
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=R2.0.gd945b6b
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/vapoursynth/vs-miscfilters-obsolete'
license=('MIT')
depends=('vapoursynth')
makedepends=('git'
  'meson'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/vapoursynth/vs-miscfilters-obsolete.git" 'https://raw.githubusercontent.com/vapoursynth/vapoursynth/R56/src/core/filtershared.h')
sha256sums=('SKIP' '4e80389d055b636d29b8cc9ad9916547f2aab206b2535b59c1d571da1e52be71')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
  mkdir -p include
  cp filtershared.h "include/filtershared.h"
}

build() {
  gcc -I/usr/include/vapoursynth -I./include -c -Wall -fPIC ${CXXFLAGS} -o build/miscfilters.o "${_plug}/src/miscfilters.cpp"
  gcc -L/usr/lib -shared ${LDFLAGS} -o build/libmiscfilters.so build/miscfilters.o
}

package() {
  install -Dm644 build/libmiscfilters.so "${pkgdir}/usr/lib/vapoursynth/${_plug}.so"
  install -Dm644 "${_plug}/docs/misc.rst" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.rst"
}
