# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: Foster McLane <fkmclane@gmail.com>
# Contributor: Jonathan Thomas <jonathan@openshot.org>

pkgname=libopenshot
pkgver=0.3.0
pkgrel=2
pkgdesc="A video editing, animation, and playback library for C++, Python, and Ruby"
arch=(x86_64)
url="https://github.com/openshot/libopenshot"
license=(LGPL3)
# TODO: package cppzmq and resvg
depends=(babl gcc-libs glibc libmagick opencv python qt5-base qt5-multimedia
qt5-svg)
makedepends=(catch2 cmake doxygen ffmpeg jsoncpp libopenshot-audio
protobuf swig unittestpp x264 zeromq)
provides=(libopenshot.so)
options=(debug)
source=($pkgname-$pkgver.tar.gz::https://github.com/OpenShot/$pkgname/archive/v$pkgver.tar.gz)
sha512sums=('5c72db9c39d2afaecb1c4ebf3192cd8795d4683f2b1210029b99657baf853515b92f392c25b65ea652a71d204a1b172123d264c95f1c3676a612e21f9ca38d2e')
b2sums=('65cadf634b6b7c6da35af64ba96c92fa32ee075966ba3d7f1711210dc784f7e263b01eecdc0c613e529cc501072b8b4a0ee6b297df62fa323ed1fddfc844f874')

build() {
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=None \
        -DENABLE_RUBY=OFF \
        -DMAGICKCORE_HDRI_ENABLE=1 \
        -DMAGICKCORE_QUANTUM_DEPTH=16 \
        -DPYTHON_LIBRARIES=/usr/lib/libpython3.so \
        -DPYTHON_INCLUDE_DIRS=/usr/include/python$python_version \
        -DUSE_SYSTEM_JSONCPP=ON \
        -Wno-dev \
        -B build \
        -S $pkgname-$pkgver
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}


package() {
  depends+=(
    ffmpeg libavcodec.so libavformat.so libavutil.so libswscale.so libswresample.so
    jsoncpp libjsoncpp.so
    libopenshot-audio libopenshot-audio.so
    protobuf libprotobuf.so
    x264 libx264.so
    zeromq libzmq.so
  )

  DESTDIR="$pkgdir" cmake --install build
  install -vDm 644 $pkgname-$pkgver/{AUTHORS,README.md} -t "$pkgdir/usr/share/doc/$pkgname/"
}
