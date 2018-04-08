# Maintainer: Gustavo alvarez <sl1pkn07@gmail.com>

pkgname=kwave-git
pkgver=18.07.70.r3567.bfdc6db6
pkgrel=1
pkgdesc="A sound editor for KDE. (GIT version)"
arch=('i686' 'x86_64')
url='http://kwave.sourceforge.net'
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
source=('git://anongit.kde.org/kwave.git')
sha256sums=('SKIP')

pkgver() {
  cd kwave
  _ver="$(cat CMakeLists.txt | grep -m3 -e '_VERSION_MAJOR' -e '_VERSION_MINOR' -e '_VERSION_MICRO' | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kwave \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF \
    -DWITH_MP3=ON

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
