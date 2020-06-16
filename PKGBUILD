# Maintainer: Gustavo alvarez <sl1pkn07@gmail.com>

pkgname=kwave-git
pkgver=20.07.70.r3687.4d1e0c1a
pkgrel=1
pkgdesc="A sound editor for KDE. (GIT version)"
arch=('x86_64')
url='https://kde.org/applications/en/multimedia/org.kde.kwave'
license=('GPL')
depends=('qt5-multimedia'
         'kio'
         'audiofile'
         'libsamplerate'
         'hicolor-icon-theme'
         )
makedepends=('git'
             'cmake'
             'extra-cmake-modules'
             'kdoctools'
             'doxygen'
             'python'
             'librsvg'
             'opus'
             'fftw'
             'id3lib'
             'libmad'
             )
optdepends=('libmad: MP3 plugin'
            'id3lib: MP3 ID3 tag plugin'
            'opus: OGG plugin'
            'fftw: Sonagram plugin')
conflicts=('kwave')
provides=('kwave')
source=('git+https://invent.kde.org/multimedia/kwave.git')
sha256sums=('SKIP')

pkgver() {
  cd kwave
  _ver="$(cat CMakeLists.txt | grep -m3 -e MAJOR -e MINOR -e VERSION_MICRO | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build

  cd build
  cmake ../kwave \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF \
    -DWITH_MP3=ON

}

build() {
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
