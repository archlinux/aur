# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=zimg
pkgname="vapoursynth-plugin-${_plug}-git"
pkgver=1.1.1.g4c0fbfd
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url="http://forum.doom9.org/showthread.php?t=171334"
license=('custom:WTFPL')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/sekrit-twc/zimg.git")
sha1sums=('SKIP')
_gitname="${_plug}"

pkgver() {
  cd "${_gitname}"
  echo "$(git describe --long --tags | tr - . | sed 's|release.||g')"
}

prepare() {
  cd "${_gitname}"
  ./autogen.sh
}

build() {
  cd "${_gitname}"
  ./configure --prefix=/usr --enable-x86simd
  make
}

package(){
  make -C "${_gitname}" DESTDIR="${pkgdir}" install
  install -d "${pkgdir}/usr/lib/vapoursynth"
  ln -s ../zimg/vszimg.so "${pkgdir}/usr/lib/vapoursynth/libvszimg.so"

  install -Dm644 "${_gitname}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${_gitname}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"
}
