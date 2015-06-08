# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=continuityfixer
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=v6.0.gf1bc9a9
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('i686' 'x86_64')
url="http://forum.doom9.org/showthread.php?t=171785"
license=('GPL')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/MonoS/VS-ContinuityFixer.git")
sha1sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr V v)"
}

prepare() {
  cd "${_plug}"
  echo "all:
	  g++ -shared ${CFLAGS} -msse2 -mfpmath=sse -Wall -fPIC -o lib${_plug}.so continuity.cpp -I. $(pkg-config --cflags vapoursynth)" > Makefile
}

build() {
  cd "${_plug}"
  make
}

package(){
  cd "${_plug}"
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"
}
