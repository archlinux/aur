# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=colorbars
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=R2.1.g5250820
pkgrel=2
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/ifb/vapoursynth-colorbars'
license=('GPL')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/ifb/vapoursynth-${_plug}.git"
        'https://patch-diff.githubusercontent.com/raw/ifb/vapoursynth-colorbars/pull/8.diff'
        )
sha256sums=('SKIP'
            'SKIP'
            )

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  patch -d "${_plug}" -p1 -i "${srcdir}/8.diff"
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

  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
