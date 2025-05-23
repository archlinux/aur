# Maintainer: quietvoid <tcChlisop0@gmail.com>

_plug=bore
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r45.cf48ee8
pkgrel=1
pkgdesc="Plugin for VapourSynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/OpusGang/bore'
license=('GPL-3.0')
depends=('gsl' 'vapoursynth')
makedepends=('git' 'meson')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/OpusGang/bore.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${_plug}"
    
    arch-meson --buildtype=release -Dlibtype=vapoursynth build
}

build() {
    cd "${_plug}"
    meson compile -C build
}

package(){
  cd "${_plug}"
  
  meson install -C build --destdir "${pkgdir}"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
