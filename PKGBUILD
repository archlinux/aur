# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Maintainer: Geert Custers <geert.aj.custers@gmail.com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

_pkgname=glportal
pkgname=${_pkgname}-git
pkgver=0.4.0.188.g857969c
pkgrel=1
epoch=1
pkgdesc="OpenGL puzzle game inspired by portal."
arch=('i686' 'x86_64')
url="http://glportal.de/"
license=('custom')
depends=('assimp' 'sdl2_mixer' 'tinyxml2' 'libepoxy' 'bullet' 'freeimage')
makedepends=('git' 'cmake' 'unittestpp')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("git://github.com/${_pkgname}/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo $(git describe --always | sed 's/-/./g')
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  git submodule update --init --recursive
}

build() {
  cd "${srcdir}/${_pkgname}"

  [[ -d build ]] || mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
}

# Disabled as recommended by developer
# check() {
#   cd $srcdir/$_pkgname/build
#
#   make test
# }

package() {
  cd $srcdir/$_pkgname/build
  
  make install DESTDIR=$pkgdir
  install -Dm644 $srcdir/$_pkgname/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
