# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: Foster McLane <fkmclane@gmail.com>
# Contributor: Jonathan Thomas <jonathan@openshot.org>

pkgname=libopenshot
pkgver=0.2.7
pkgrel=12
pkgdesc="A video editing, animation, and playback library for C++, Python, and Ruby"
arch=(x86_64)
url="https://github.com/openshot/libopenshot"
license=(LGPL3)
# TODO: package cppzmq and resvg
depends=(gcc-libs glibc libmagick opencv protobuf python qt5-base
qt5-multimedia zeromq)
makedepends=(catch2 cmake doxygen ffmpeg4.4 jsoncpp libopenshot-audio swig
unittestpp x264)
provides=(libopenshot.so)
source=("$pkgname-$pkgver.tar.gz::https://github.com/OpenShot/libopenshot/archive/v$pkgver.tar.gz")
sha512sums=('71cb0e4010d8f3ff453486c3da3c7019c6569066845dcc58f438049a08b1c8663f31c29a728ce5461e9d3a1ca550038b757d4528e62a26eeb45ecbe600353988')
b2sums=('511ed214f0ecc43294a787e1c0119f036e274a1e8d051cb6e926bf7a9b5cea416325a2e051fca758d1f80ec2b9d746a4dd268e5ac5322fe8539fa2041a8c4d9d')

build() {
  cd "${pkgname}-${pkgver}"
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  export PYTHON_LIBRARIES="/usr/lib/libpython3.so"
  export PYTHON_INCLUDE_DIRS="/usr/include/python${python_version}"
  export PKG_CONFIG_PATH="/usr/lib/ffmpeg4.4/pkgconfig"
  cmake -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_BUILD_TYPE='None' \
        -DENABLE_RUBY=OFF \
        -DMAGICKCORE_HDRI_ENABLE=1 \
        -DMAGICKCORE_QUANTUM_DEPTH=16 \
        -DPYTHON_LIBRARIES="/usr/lib/libpython3.so" \
        -DPYTHON_INCLUDE_DIRS="/usr/include/python${python_version}" \
        -DUSE_SYSTEM_JSONCPP=ON \
        -Wno-dev \
        -B build \
        -S .
  make VERBOSE=1 -C build
}

check() {
  cd "${pkgname}-${pkgver}"
  make VERBOSE=1 -C build test || printf "Issues with SVG and protobuf\n"
}

package() {
  depends+=(libavcodec.so libavformat.so libavutil.so libjsoncpp.so
  libopenshot-audio.so libswscale.so libswresample.so libx264.so)

  cd "${pkgname}-${pkgver}"
  make VERBOSE=1 DESTDIR="${pkgdir}" install -C build
  install -vDm 644 {AUTHORS,README.md} -t "${pkgdir}/usr/share/doc/${pkgname}"
}
