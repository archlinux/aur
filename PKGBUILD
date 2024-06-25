# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: Foster McLane <fkmclane@gmail.com>
# Contributor: Jonathan Thomas <jonathan@openshot.org>

pkgname=libopenshot
pkgver=0.3.3
pkgrel=1
pkgdesc="A video editing, animation, and playback library for C++, Python, and Ruby"
arch=(x86_64)
url="https://github.com/openshot/libopenshot"
license=(LGPL-3.0-or-later)
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
  cppzmq
  doxygen
  ffmpeg4.4
  jsoncpp
  libopenshot-audio
  protobuf
  python-setuptools
  swig
  unittestpp
  xorg-server-xvfb
  zeromq
)
provides=(libopenshot.so)
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('c8ac8e14296a69d7989e8bd6d259a802b7d436df144d9f9e3024f19f137f1b3081cc2e93cbd46ed5dd45cb0cef6cfde634fa532ff485517b72b1113a8cc8892d')
b2sums=('b82f79666c386e69630f2be60ed1771cea6ece83592ac29c30e05a97b289b0281d23b51b0e320eb208d09535882c5e2acb122b29852bb1bf75d9d821891d9047')

prepare() {
# protobuf 23 requiers C++17
  sed -e 's|CMAKE_CXX_STANDARD 14|CMAKE_CXX_STANDARD 17|' -i $pkgname-$pkgver/CMakeLists.txt
}

build() {
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D ENABLE_RUBY=OFF
    -D PYTHON_INCLUDE_DIRS=/usr/include/python$python_version
    -D PYTHON_LIBRARIES=/usr/lib/libpython3.so
    -D USE_SYSTEM_JSONCPP=ON
    -S $pkgname-$pkgver
    -W no-dev
  )

  export PKG_CONFIG_PATH='/usr/lib/ffmpeg4.4/pkgconfig'
  cmake "${cmake_options[@]}"
  cmake --build build
}

check() {
  # disable broken tests: https://github.com/OpenShot/libopenshot/issues/922 https://github.com/OpenShot/libopenshot/issues/948
  xvfb-run ctest --test-dir build --output-on-failure -E '(Caption:caption effect|FFmpegWriter:Options_Overloads)'
}


package() {
  depends+=(
    ffmpeg4.4 libavcodec.so libavformat.so libavutil.so libswscale.so libswresample.so
    jsoncpp libjsoncpp.so
    libopenshot-audio libopenshot-audio.so
    protobuf libprotobuf.so
    zeromq libzmq.so
  )

  DESTDIR="$pkgdir" cmake --install build
  install -vDm 644 $pkgname-$pkgver/{AUTHORS,README.md} -t "$pkgdir/usr/share/doc/$pkgname/"
}
