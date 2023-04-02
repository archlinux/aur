# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=wxmaxima-git
pkgver=2023.04.01.r3.g940d4c51b
pkgrel=1
pkgdesc="A document based interface for the computer algebra system Maxima."
arch=('i686' 'x86_64')
url="https://wxmaxima-developers.github.io/wxmaxima/"
license=('GPL2')
depends=('maxima' 'wxwidgets-common' 'openmp')
makedepends=('git' 'texi2html' 'cmake' 'po4a' 'perl-syntax-keyword-try')
optdepends=('gnuplot: for plotting'
	    'bash-completion: for completion when using bash'
	    'man-db: manual pages for wxMaxima')
conflicts=('wxmaxima')
provides=('wxmaxima')
source=("git+https://github.com/wxMaxima-developers/wxmaxima.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags --long | cut -c15- | sed 's+-+.r+' |tr - . |tr _ .
}

build() {
  cd ${pkgname%-git}
  [ -d build ] || mkdir build
  cd build
  
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr \
	-DCMAKE_BUILD_TYPE=None \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_CXX_STANDARD=14 \
	-DCMAKE_CXX_COMPILER=g++ \
	-DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config \
	-Wno-dev ..
  cmake --build .
}

package() {
  cd ${pkgname%-git}/build
  make DESTDIR="$pkgdir" install
}
