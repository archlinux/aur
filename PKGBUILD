# $Id$
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=qtav-git
pkgver=v1.13.0.r10.gb12a99e9
pkgrel=1
pkgdesc="A cross-platform multimedia playback framework based on Qt and FFmpeg"
arch=('x86_64')
url="http://www.qtav.org/"
license=('LGPL')
conflicts=('qtav')
provides=('qtav')
depends=('qt5-declarative' 'ffmpeg' 'libxv' 'openal' 'uchardet' 'desktop-file-utils'
         'qt5-quickcontrols' 'qt5-svg')
makedepends=('git' 'cmake' 'make')
source=("git+https://github.com/wang-bin/QtAV.git")
sha512sums=('SKIP')

pkgver(){
  cd "QtAV"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  mkdir build
  cd $srcdir/QtAV
  git submodule update --init --recursive
}
build() {
  cd build
   cmake ../QtAV \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build

  make DESTDIR="${pkgdir}" install
}
