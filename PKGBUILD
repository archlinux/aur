# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=dctfilter
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r10.b311e2e
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?t=171039'
license=('MIT')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/VFR-maniac/VapourSynth-DCTFilter.git")
sha1sums=('SKIP')

pkgver() {
  cd "${_plug}"
  #echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  rm -fr "${_plug}/src/"{VapourSynth,VSHelper}.h
}

build() {
  cd "${_plug}"
  ./configure \
    --prefix=/usr \
    --extra-cflags="${CFLAGS} $(pkg-config --cflags vapoursynth)" \
    --extra-ldflags="${LDFLAGS}"
  make
}

package(){
  cd "${_plug}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 README "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"
}
