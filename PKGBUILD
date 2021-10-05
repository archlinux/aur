# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=d2vsource
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=v1.2.12.g5ddeb06
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=166399'
license=('LGPL2.1')
depends=('vapoursynth'
         'libavutil.so'
         'libavformat.so'
         'libavcodec.so'
         )
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/dwbuiten/${_plug}.git#branch=newffmpeg")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  cd "${_plug}"
}

build() {
  (cd "${_plug}"; ./autogen.sh)

  cd build
  ../"${_plug}"/configure \
    --prefix=/usr \
    --libdir=/usr/lib/vapoursynth

  make
}

package(){
  make -C build DESTDIR="${pkgdir}" install

  install -Dm644 "${_plug}/README" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"
}

