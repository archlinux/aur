# $Id$
# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=belle-sip-git
_pkgname=belle-sip
pkgver=1.6.3.r46.ga30ce5f1
pkgrel=1
pkgdesc="A Voice-over-IP phone"
arch=('i686' 'x86_64')
url="https://github.com/BelledonneCommunications/belle-sip/"
license=('GPL')
depends=('libantlr3c' 'gcc-libs' 'mbedtls' 'bctoolbox-git')
makedepends=('java-runtime')
provides=('belle-sip')
conflicts=('belle-sip')
options=('!emptydirs')
source=("git+https://github.com/BelledonneCommunications/belle-sip.git"
	"antlr.jar::https://github.com/antlr/website-antlr3/blob/gh-pages/download/antlr-3.4-complete.jar?raw=true")
noextract=('antlr.jar')
sha256sums=('SKIP'
            '9d3e866b610460664522520f73b81777b5626fb0a282a5952b9800b751550bf7')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/; s/-/./g'
}

prepare() {
  cd $_pkgname
  sed -i -e "s|/opt/local|../..|" cmake/FindAntlr3.cmake
}

build() {
  cd $_pkgname
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DENABLE_STATIC=NO .
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
}
