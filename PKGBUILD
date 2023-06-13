# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libsndfile-git
pkgver=1.2.0.r19.gd97f4666
pkgrel=2
pkgdesc="A C library for reading and writing files containing sampled sound"
arch=('i686' 'x86_64')
url="https://libsndfile.github.io/libsndfile/"
license=('LGPL')
depends=('glibc' 'libFLAC.so' 'libmp3lame.so' 'libmpg123.so' 'libogg.so' 'libvorbis.so' 'libvorbisenc.so' 'opus')
makedepends=('git' 'alsa-lib' 'cmake' 'flac' 'sqlite' 'lame' 'libogg' 'libvorbis' 'mpg123' 'python' 'sqlite')
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
    -DBUILD_SHARED_LIBS=ON \
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
  install -Dm644 {AUTHORS,ChangeLog,README} -t "$pkgdir/usr/share/doc/libsndfile"
}
