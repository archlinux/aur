# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Darwin Bautista <djclue917@gmail.com>
# Contributor: Mark Lee <mark@markelee.com>

pkgname=linphone-git
_pkgname=linphone
pkgver=3.12.0.r2949.g175375918
pkgrel=1
pkgdesc="A Voice-over-IP phone library and CLI"
arch=('x86_64')
url="http://www.linphone.org"
license=('GPL')
depends=('alsa-lib' 'bctoolbox-git' 'belcard-git' 'belle-sip-git' 'belr-git'
    'bzrtp-git' 'ffmpeg' 'libnotify' 'libpulse' 'libsoup' 'libv4l' 'libxv'
    'mediastreamer-git' 'ortp-git' 'soci-git' 'speex' 'v4l-utils' 'xsd')
makedepends=('cmake' 'doxygen' 'graphviz' 'pkg-config' 'python-pystache')
optdepends=('pulseaudio')
options=('!emptydirs')
provides=('linphone')
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
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DENABLE_STATIC=NO \
      -DENABLE_CXX_WRAPPER=YES \
      -DENABLE_DOC=NO \
      -DENABLE_ROOTCA_DOWNLOAD=NO \
      -DENABLE_LIME=YES \
      -DENABLE_UNIT_TESTS=NO \
      -DENABLE_STRICT=NO .
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
}
