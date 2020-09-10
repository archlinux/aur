# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Darwin Bautista <djclue917@gmail.com>
# Contributor: Mark Lee <mark@markelee.com>

pkgname=liblinphone-git
_pkgname=linphone
pkgver=4.5.0.alpha.r112.g868bee338
pkgrel=1
pkgdesc="A Voice-over-IP phone library and CLI"
arch=('x86_64')
url="http://www.linphone.org"
license=('GPL')
depends=('belcard>=4.3' 'belle-sip>=4.3' 'bzrtp>=4.3' 'ffmpeg' 'lime>=4.3'
    'mediastreamer>=4.4.0' 'ortp>=4.4.0' 'soci>=4.0' 'xerces-c')
makedepends=('cmake' 'doxygen' 'git' 'graphviz' 'python-pystache' 'xsd')
optdepends=('pulseaudio')
options=('!emptydirs')
provides=("liblinphone=$pkgver")
conflicts=('liblinphone')
install=linphone.install
source=("git+https://github.com/BelledonneCommunications/linphone.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
  cd $_pkgname
  CXXFLAGS="$CXXFLAGS -Wno-deprecated -Wimplicit-fallthrough=0 -Wno-unused-function"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
      -DENABLE_STATIC=NO \
      -DENABLE_CXX_WRAPPER=YES \
      -DENABLE_DOC=NO \
      -DENABLE_LIME=YES \
      -DENABLE_UNIT_TESTS=NO \
      -DENABLE_STRICT=NO \
      -DCMAKE_INSTALL_RPATH=NO .
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
}
