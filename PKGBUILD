# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=sangnom
pkgname=vapoursynth-plugin-${_plug}-hg
pkgver=18.c4e2a8681c27
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (HG version)"
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?t=173752'
license=('GPL')
depends=('vapoursynth')
makedepends=('mercurial')
provides=("vapoursynth-plugin-${_plug}"
          'vapoursynth-plugin-sangnommod'
          'vapoursynth-plugin-sangnommod-git'
          )
conflicts=("vapoursynth-plugin-${_plug}"
           'vapoursynth-plugin-sangnommod'
           'vapoursynth-plugin-sangnommod-git'
           )
source=("${_plug}::hg+https://sl1pkn07@bitbucket.org/James1201/vapoursynth-sangnom")
sha1sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(hg log -r -1 --template '{rev}.{node|short}\n')"
}

prepare() {
  cd "${_plug}"
  echo "all:
	  g++ -o lib${_plug}.so -std=gnu++11 -msse4.1 ${CXXFLAGS} ${CPPFLAGS} ${LDFLAGS} $(pkg-config --cflags vapoursynth) sangnom_c.cpp -shared -fPIC" > Makefile
}

build() {
  make -C "${_plug}"
}

package(){
  cd "${_plug}"
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
