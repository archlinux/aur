# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: Foster McLane <fkmclane@gmail.com>
# Contributor: Jonathan Thomas <jonathan@openshot.org>

pkgname=libopenshot
pkgver=0.3.2
pkgrel=1
pkgdesc="A video editing, animation, and playback library for C++, Python, and Ruby"
arch=(x86_64)
url="https://github.com/openshot/libopenshot"
license=(LGPL3)
# TODO: package cppzmq and resvg
depends=(
  babl
  gcc-libs
  glibc
  libmagick
  opencv
  python
  qt5-base
  qt5-multimedia
  qt5-svg
)
makedepends=(
  catch2
  cmake
  doxygen
  ffmpeg
  jsoncpp
  libopenshot-audio
  protobuf
  swig
  unittestpp
  xorg-server-xvfb
  zeromq
)
provides=(libopenshot.so)
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('8891077af28a4db6bc3a7cd078ce5570a8f62e0795c13b0fff795eba60c3e977ece70247033ee4017c9785592355b7421655246a5d6807a5790bd18927739795')
b2sums=('5bc371481ddf69b5de909963cb83d1128066280e1259ae8b23f7ef5450f3da00ef1137dcefe2978e10d1a51931529f104aebdf0601be4b066c7ed371ea43439e')

build() {
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D ENABLE_RUBY=OFF
    -D MAGICKCORE_HDRI_ENABLE=1
    -D MAGICKCORE_QUANTUM_DEPTH=16
    -D PYTHON_INCLUDE_DIRS=/usr/include/python$python_version
    -D PYTHON_LIBRARIES=/usr/lib/libpython3.so
    -D USE_SYSTEM_JSONCPP=ON
    -S $pkgname-$pkgver
    -W no-dev
  )

  cmake "${cmake_options[@]}"
  cmake --build build
}

check() {
  # disable broken test: https://github.com/OpenShot/libopenshot/issues/922
  xvfb-run ctest --test-dir build --output-on-failure -E '(Caption:caption effect)'
}


package() {
  depends+=(
    ffmpeg libavcodec.so libavformat.so libavutil.so libswscale.so libswresample.so
    jsoncpp libjsoncpp.so
    libopenshot-audio libopenshot-audio.so
    protobuf libprotobuf.so
    zeromq libzmq.so
  )

  DESTDIR="$pkgdir" cmake --install build
  install -vDm 644 $pkgname-$pkgver/{AUTHORS,README.md} -t "$pkgdir/usr/share/doc/$pkgname/"
}
