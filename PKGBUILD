# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vsfilterscript
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r33.a2ea682
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=181027'
license=('GPL')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/IFeelBloated/vsFilterScript.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
#   echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
  cd "${_plug}"

  echo "all:
	  g++ -c -std=gnu++2a -fPIC ${CXXFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o EntryPoint.o EntryPoint.cxx
	  g++ -shared -fPIC ${LDFLAGS} -lstdc++ -o lib${_plug}.so EntryPoint.o" > Makefile
}

build() {
  make -C "${_plug}"
}

package() {
  cd "${_plug}"
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
