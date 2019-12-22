# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Darwin Bautista <djclue917@gmail.com>
# Contributor: Mark Lee <mark@markelee.com>

pkgname=linphone-git
_pkgname=linphone
pkgver=4.4.0.alpha.r7.gf232a2b7b
pkgrel=1
pkgdesc="A Voice-over-IP phone library and CLI"
arch=('x86_64')
url="http://www.linphone.org"
license=('GPL')
depends=('alsa-lib' 'bctoolbox>=4.3' 'belcard>=4.3' 'belle-sip>=4.3' 'belr>=4.3'
    'bzrtp>=4.3' 'ffmpeg' 'lime>=4.3' 'libpulse' 'libv4l'
    'libxv' 'mediastreamer>4.3.0' 'ortp>=4.3' 'soci>=4.0' 'speex' 'v4l-utils' 'xerces-c')
makedepends=('cmake' 'doxygen' 'git' 'graphviz' 'python-pystache' 'xsd')
optdepends=('pulseaudio')
options=('!emptydirs')
provides=("linphone=$pkgver")
conflicts=('linphone')
install=linphone.install
source=("git+https://github.com/BelledonneCommunications/linphone.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
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
