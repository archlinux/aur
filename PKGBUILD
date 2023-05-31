# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Mikuro Kagamine <mikurok@forgecrushing.com>

_plug=edgefixer
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=2.2.g562e06d
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/sekrit-twc/EdgeFixer'
license=('GPL')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/sekrit-twc/EdgeFixer.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d r)"
}

prepare() {
  cd "${_plug}"

  echo "all:
	  gcc -c -fPIC ${CXXFLAGS} ${CPPFLAGS} -I./EdgeFixer $(pkg-config --cflags vapoursynth) -o vsplugin.o EdgeFixer/vsplugin.c
	  gcc -c -fPIC ${CXXFLAGS} ${CPPFLAGS} -I./EdgeFixer $(pkg-config --cflags vapoursynth) -o edgefixer.o EdgeFixer/edgefixer.c

	  gcc -shared -fPIC ${LDFLAGS} -o lib${_plug}.so vsplugin.o edgefixer.o"> Makefile
}

build() {
  make -C "${_plug}"
}

package(){
  install -Dm755 "${_plug}/lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/libvs${_plug}.so"

  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
