# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=linphone-desktop-git
_pkgname=linphone-desktop
pkgver=4.1.1.r655.g95245907
pkgrel=1
pkgdesc="A Voice-over-IP phone"
arch=('x86_64')
url="http://www.linphone.org"
license=('GPL')
depends=('bcg729-git' 'belcard-git' 'belle-sip-git' 'belr-git' 'bzrtp-git'
    'linphone-git' 'libpulse' 'libxv' 'mediastreamer-git' 'minizip2=2.3.3'
    'ortp-git' 'libsoup' 'libnotify' 'qt5-svg' 'qt5-quickcontrols'
    'qt5-quickcontrols2' 'qt5-graphicaleffects' 'qt5-tools')
makedepends=('cmake' 'pkg-config' 'python-pystache')
optdepends=('pulseaudio')
options=('!emptydirs')
provides=('linphone-desktop')
conflicts=('linphone-desktop')
source=("git+https://github.com/BelledonneCommunications/linphone-desktop.git"
    "linker.patch")
sha256sums=('SKIP'
            '02c3d9dd31f7369cdbb2871c11cc46c7c86867b2b220c6ca1390ead320b6dcd0')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/; s/-/./g' 
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    patch -p1 < ../linker.patch
}

build() {
  cd $_pkgname
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DMINIZIP_INCLUDE_DIRS=/usr/include/minizip2 \
      -DMINIZIP_LIBRARIES=/usr/lib/minizip2/libminizip.so .
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
}
