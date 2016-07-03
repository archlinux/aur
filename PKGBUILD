# Maintainer: Campbell Barton <ideasman42@gmail.com>

_pkgname=opentoonz
_version=git

pkgname=${_pkgname}-${_version}
# todo, extract from ./toonz/sources/toonz/main.cpp, applicationFullName
pkgver=1.0.3
pkgrel=1
pkgdesc="2D Animation software."
arch=('i686' 'x86_64')
url="https://github.com/${_pkgname}/${_pkgname}"
license=('BSD')
groups=()
depends=(
    'boost' 'boost-libs'
    'qt5-base' 'qt5-svg' 'qt5-script' 'qt5-tools'
    'lz4' 'libusb' 'lzo' 'libjpeg-turbo'
    'glew' 'freeglut' 'sdl2' 'freetype2'
    'blas' 'cblas')
makedepends=('cmake' 'make' 'git')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+${url}.git"
)
noextract=()
md5sums=(
'SKIP'
) #autofill using updpkgsums

build() {
  # make libtiff
  cd $_pkgname/thirdparty/tiff-4.0.3
  CFLAGS="-fPIC" ./configure && make $MAKEFLAGS
  cd -

  cmake -H$_pkgname/toonz/sources \
        -B$_pkgname-build \
        -DCMAKE_BUILD_TYPE:STRING=Release \
        -DCMAKE_INSTALL_PREFIX:PATH=/opt/opentoonz

  # Currently only single threaded builds working
  cd $_pkgname-build
  make $MAKEFLAGS -j 1
}

package() {
  cd $_pkgname-build
  make DESTDIR="$pkgdir/" install
}
