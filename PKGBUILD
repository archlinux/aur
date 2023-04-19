# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: Foster McLane <fkmclane@gmail.com>
# Contributor: Jonathan Thomas <jonathan@openshot.org>

pkgname=libopenshot
pkgver=0.3.1
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
sha512sums=('8e0f606c76ed88740577e399065aba021d6d8c5a34b66705c9755252d5a5bb9b8361c074b3810fc23927d4e89670d9ba5329fd39425ec1080356e7140239147b')
b2sums=('b1d35246507b91690d1da5b0d79af4ee26ad62b1683ad8cc20d28abeb16b1b89770553034595b8f936263fa86f4091dc6d6d883a13c2bb92461d3935b8c20238')

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
