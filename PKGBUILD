# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=cmedian
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=1.0.gc19dd5c
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/4re/vapoursynth-cmedian'
license=('LGPL2.1')
depends=('vapoursynth')
makedepends=('git'
             'meson'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}-hg"
           "vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/4re/vapoursynth-cmedian.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  arch-meson "../${_plug}" \
    --libdir /usr/lib/vapoursynth

  ninja
}

package(){
  DESTDIR="${pkgdir}" ninja -C build install

  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
