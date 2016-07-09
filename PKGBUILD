# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani at gmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=krita-git
pkgver=3.1.89.r41005.d28dbf2
pkgrel=1
pkgdesc="A free digital painting application. Digital Painting, Creative Freedom!. (GIT Version)"
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
             'imagemagick'
             )
provides=('krita' 'calligra-krita')
conflicts=('krita' 'calligra-krita')
source=('git://anongit.kde.org/krita.git')
sha1sums=('SKIP')

pkgver() {
  cd krita
  _ver="$(cat CMakeLists.txt | grep -m3 -e KRITA_STABLE_VERSION_MAJOR -e KRITA_STABLE_VERSION_MINOR -e KRITA_VERSION_RELEASE | cut -d ')' -f1 | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build

  msg2 "Stripping PNG's"
  export IFS=$'\n'
  for i in $(find . -name '*.png' -type f); do
    mogrify "${i}" &> /dev/null
  done
  export IFS=' '
}

build() {
  cd build
  cmake ../krita \
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
