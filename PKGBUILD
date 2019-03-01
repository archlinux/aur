# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=nnedi3
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=v12.0.g8c35822
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='http://forum.doom9.org/showthread.php?t=166434'
license=('GPL2')
depends=('vapoursynth'
         'vapoursynth-plugin-nnedi3_weights_bin'
         )
makedepends=('git'
             'yasm'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/dubhater/vapoursynth-${_plug}.git")
sha1sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  cd "${_plug}"
  ./autogen.sh
}

build() {
  cd build
  ../"${_plug}"/configure \
    --prefix=/usr \
    --libdir=/usr/lib/vapoursynth

  make
}

package(){
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 "${_plug}/readme.rst" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/readme.rst"

  rm -fr "${pkgdir}/usr/share/nnedi3"
}
