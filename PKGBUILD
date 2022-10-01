# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libsndfile-git
pkgver=1.1.0.r30.g005a36b4
pkgrel=1
pkgdesc="A C library for reading and writing files containing sampled sound"
arch=('i686' 'x86_64')
url="https://libsndfile.github.io/libsndfile/"
license=('LGPL')
depends=('glibc' 'libFLAC.so' 'libogg.so' 'libvorbis.so' 'libvorbisenc.so' 'opus' 'speex')
makedepends=('git' 'alsa-lib' 'cmake' 'flac' 'sqlite' 'libogg' 'libvorbis' 'python' 'sqlite')
optdepends=('alsa-lib: for sndfile-play')
provides=("libsndfile=$pkgver" 'libsndfile.so')
conflicts=('libsndfile')
source=("git+https://github.com/libsndfile/libsndfile.git")
sha256sums=('SKIP')


pkgver() {
  cd "libsndfile"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libsndfile"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DBUILD_SHARED_LIBS="ON" \
    ./
  make -C "_build"
}

check() {
  cd "libsndfile"

  cmake \
    -B "_build_test" \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  make -C "_build_test"
  make -C "_build_test" test
}

package() {
  cd "libsndfile"

  make -C "_build" DESTDIR="$pkgdir" install
}
