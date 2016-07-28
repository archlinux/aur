# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

_pkgname=glportal
pkgname=${_pkgname}-git
pkgver=0.1.pre.393.g32cd473
pkgrel=1
epoch=1
pkgdesc="OpenGL puzzle game inspired by portal."
arch=('i686' 'x86_64')
url="http://glportal.de/"
license=('custom')
depends=('assimp' 'sdl2_mixer' 'tinyxml2' 'libepoxy' 'bullet')
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
