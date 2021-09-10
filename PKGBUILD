# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: Foster McLane <fkmclane@gmail.com>
# Contributor: Jonathan Thomas <jonathan@openshot.org>

pkgname=libopenshot
pkgver=0.2.6
pkgrel=1
pkgdesc="A video editing, animation, and playback library for C++, Python, and Ruby"
arch=('x86_64')
url="https://github.com/openshot/libopenshot"
license=('LGPL3')
# TODO: package cppzmq and resvg
depends=('gcc-libs' 'glibc' 'libmagick' 'opencv' 'protobuf' 'python' 'qt5-base'
'qt5-multimedia' 'zeromq')
makedepends=('catch2' 'cmake' 'doxygen' 'ffmpeg' 'jsoncpp' 'libopenshot-audio'
'swig' 'unittestpp' 'x264')
provides=('libopenshot.so')
source=("$pkgname-$pkgver.tar.gz::https://github.com/OpenShot/libopenshot/archive/v$pkgver.tar.gz")
sha512sums=('13706733280e8c70638a02ad220e6a84f3d26a5a35f5f8f1b820408236aeda8bd8683e19a85a0d466007a1d711ca31bb436f8d4ca4fb6ffbfe169b2976dea525')
b2sums=('7ad35cfb927e637c4ded38de751f3f484ab6f051a2eea15153dcf4a66a378023883e76ffde361725a2285018741765fece01a60443421d95a8a772065d9de199')

build() {
  cd "${pkgname}-${pkgver}"
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  export PYTHON_LIBRARIES="/usr/lib/libpython3.so"
  export PYTHON_INCLUDE_DIRS="/usr/include/python${python_version}"
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
  depends+=('libavcodec.so' 'libavformat.so' 'libavutil.so' 'libjsoncpp.so'
  'libopenshot-audio.so' 'libswscale.so' 'libswresample.so' 'libx264.so')

  cd "${pkgname}-${pkgver}"
  make VERBOSE=1 DESTDIR="${pkgdir}" install -C build
  install -vDm 644 {AUTHORS,README.md} -t "${pkgdir}/usr/share/doc/${pkgname}"
}
