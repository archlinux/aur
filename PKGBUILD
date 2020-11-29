# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=linphone-desktop-git
_pkgname=linphone-desktop
pkgver=4.3.0.alpha.r53.gc4f9aaff
pkgrel=1
pkgdesc="A Voice-over-IP phone"
arch=('x86_64')
url="http://www.linphone.org"
license=('GPL')
depends=('bctoolbox-git' 'liblinphone-git' 'mediastreamer-git' 'qt5-quickcontrols'
    'qt5-quickcontrols2' 'qt5-graphicaleffects' 'qt5-svg')
makedepends=('cmake' 'git' 'python-pystache' 'qt5-tools')
optdepends=('pulseaudio')
options=('!emptydirs')
provides=('linphone-desktop')
conflicts=('linphone-desktop')
source=('git+https://github.com/BelledonneCommunications/linphone-desktop.git'
    '0001-do-not-build-linphone-sdk.patch'
    'cmake.patch')
sha256sums=('SKIP'
            '6dc5d722a2495608811b1d1899b0b728231bdcff98e8ef0a5f8b094ea4a185e8'
            '6f92f10991d1705b719330efb468f141302179e52aa06f17dda16c6637d90b50')

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/; s/-/./g' 
}

prepare() {
    cd "${_pkgname}"
    patch -p1 -i ../0001-do-not-build-linphone-sdk.patch
    patch -p0 -i ../cmake.patch
}

build() {
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_PREFIX_PATH=/usr \
      -DCMAKE_BUILD_TYPE=Release ../$_pkgname
  make
  sed '/linphone-sdk/d' -i linphone-app/cmake_builder/linphone_package/cmake_install.cmake
  sed "s|$srcdir/build/OUTPUT|/usr|" -i cmake_install.cmake
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  rm "$pkgdir/usr/bin/qt.conf"
}
