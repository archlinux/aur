# Maintainer: quietvoid <tcChlisop0@gmail.com>

_plug=fpng
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r3.6c49a7a
pkgrel=1
pkgdesc="Plugin for VapourSynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/Mikewando/vsfpng'
license=('LGPL')
depends=('vapoursynth')
makedepends=('git' 'meson')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Mikewando/vsfpng.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${_plug}"
    
    arch-meson --buildtype=release builddir
}

build() {
    cd "${_plug}"
    ninja -C builddir
}

package(){
  cd "${_plug}"
  
  DESTDIR="${pkgdir}" ninja -C builddir install

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
