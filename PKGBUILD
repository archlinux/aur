# Maintainer: tytan652 <tytan652@tytanium.xyz>

_pluginname=spectralizer
pkgname=obs-$_pluginname
pkgver=1.3.4
pkgrel=5
pkgdesc="Audio visualization for obs-studio using fftw, based on cli-visualizer"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/spectralizer.861/"
license=(GPL-2.0-or-later)
depends=("obs-studio>=28" "glibc" "gcc-libs" "fftw")
makedepends=("cmake")
conflicts=("obs-plugin-spectralizer-bin")
options=('debug')
source=("$_pluginname-$pkgver.tar.gz"::"https://github.com/univrsal/$_pluginname/archive/v$pkgver.tar.gz")
sha256sums=("f257feff9e4da7df9e9c580a99b3c7d6052a641bb5cb1fdabc95c7c0f7db85d6")

prepare() {
  cd "$_pluginname-$pkgver"
  sed -i -e 's/LibObs/libobs/g' \
         -e 's/${LIBOBS_LIBRARIES}/OBS::libobs/g' CMakeLists.txt
  sed -i '13 a #include <string>' src/source/visualizer_source.hpp
  sed -i '24 a #include <string>' src/util/audio/obs_internal_source.hpp
}

build() {
  cmake -B build -S "$_pluginname-$pkgver" \
  -DCMAKE_BUILD_TYPE=None \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DGLOBAL_INSTALLATION=ON \
  -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
 
