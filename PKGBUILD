# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=fluxsmooth
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=v1.0.4.g8f81346
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url="https://github.com/dubhater/vapoursynth-${_plug}"
license=('GPL')
depends=('vapoursynth')
makedepends=('git')
makedepends_x86_64=('yasm')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/dubhater/vapoursynth-${_plug}.git")
sha1sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cd "${_plug}"

  export LDFLAGS="${LDFLAGS},-z,noexecstack"

  ./autogen.sh
}

build() {
  cd "${_plug}"
  ./configure --libdir=/usr/lib/vapoursynth
  make
}

package(){
  cd "${_plug}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 readme.rst "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/readme.rst"
}
