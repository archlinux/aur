# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani at gmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=krita-git
pkgver=3.0.91.829.g6b9630657c
pkgrel=1
pkgdesc="A free digital painting application. Digital Painting, Creative Freedom! (GIT Version)"
arch=('i686' 'x86_64')
url='http://www.krita.org'
license=('GPL2')
depends=('kio'
         'fftw'
         'gsl'
         'libraw'
         'opencolorio'
         'boost-libs'
         'exiv2'
         'openexr'
         'poppler-qt5'
         'hicolor-icon-theme'
	 'curl'
	 'libpng'
	 'qt5-multimedia'
         )

makedepends=('extra-cmake-modules'
             'git'
             'boost'
             'vc'
             'python'
             'eigen'
             'kitemmodels'
             'ki18n'
             'kitemviews'
             'kwindowsystem'
             'pngcrush'
             )
provides=('krita' 'calligra-krita')
conflicts=('krita' 'calligra-krita')
source=('git+https://github.com/KDE/krita.git')
sha1sums=('SKIP')
options=('!makeflags')

pkgver() {
  cd krita
  git describe --tags |sed 's+-+.+g'|sed 's+^v++'
}

prepare() {
  mkdir -p build

  msg2 "Stripping PNG's"
  export IFS=$'\n'
  for i in $(find . -name '*.png' -type f); do
    pngcrush -e "${i}" &> /dev/null
  done
  export IFS=' '
}

build() {
  cd build
  CXXFLAGS=' -std=c++11' cmake ../krita \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF 
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
