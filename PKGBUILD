# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: Foster McLane <fkmclane@gmail.com>
# Contributor: Jonathan Thomas <jonathan@openshot.org>

pkgname=libopenshot
pkgver=0.4.0
pkgrel=2
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
sha512sums=('e5aa91e2ec3f64952a60e069e3c843d3ac59c3f896d81dccd789e52244f442ceed2e62374b6aeeb2514a8b88557edd60faca33cadb06c297ff400aebc83f98a6')
b2sums=('faf2bcabb484a167667c0b2191d8b51ee972d2c204ae7edebbfaa7500542eebdce2dc6c4a8134bc8490e5254190ebda1521e3f437d874df18a8c40dfb48ffed2')

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
  # disable broken tests, upstream output expectations do not track dependency changes:
  # - https://github.com/OpenShot/libopenshot/issues/922
  # - https://github.com/OpenShot/libopenshot/issues/948
  local excluded_tests=(
    'Caption:caption effect'
    'FFmpegWriter:DisplayInfo'
    'FFmpegWriter:Options_Overloads'
    'FFmpegWriter:Webm'
  )
  local IFS='|'
  xvfb-run ctest --test-dir build --output-on-failure -E "(${excluded_tests[*]})"
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
