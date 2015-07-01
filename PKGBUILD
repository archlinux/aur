# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

_pkgname=glportal
pkgname=${_pkgname}-git
pkgver=32cc39f
pkgrel=1
pkgdesc="OpenGL puzzle game inspired by portal."
arch=('i686' 'x86_64')
url="http://glportal.de/"
license=('custom')
depends=('glew' 'assimp' 'sdl2' 'sdl2_mixer' 'tinyxml')
makedepends=('git' 'cmake' 'unittestpp')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("git://github.com/${_pkgname}/${_pkgname}.git"
        "git://github.com/${_pkgname}/${_pkgname}_data.git")
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo $(git describe --always | sed 's/-/./g')
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  git submodule init
  git config submodule.data.url "${srcdir}/${_pkgname}_data"
  git submodule update
}

build() {
  cd "${srcdir}/${_pkgname}"

  [[ -d build ]] || mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make all tests
}

check() {
  cd $srcdir/$_pkgname/build

  make test
}

package() {
  cd $srcdir/$_pkgname/build
  
  make install DESTDIR=$pkgdir
  install -Dm644 "../LICENCE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
}
