# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: Foster McLane <fkmclane@gmail.com>
# Contributor: Jonathan Thomas <jonathan@openshot.org>

pkgname=libopenshot
pkgver=0.2.3
pkgrel=5
pkgdesc="A video editing, animation, and playback library for C++, Python, and Ruby"
arch=('x86_64')
url="https://openshot.org/"
license=('LGPL3')
depends=('gcc-libs' 'glibc' 'libavcodec.so' 'libavformat.so' 'libavutil.so'
'libswscale.so' 'libswresample.so' 'libmagick6' 'libopenshot-audio' 'python'
'libjsoncpp.so' 'qt5-base' 'qt5-multimedia' 'x264' 'zeromq')
makedepends=('cmake' 'doxygen' 'swig' 'unittestpp')
provides=('libopenshot.so')
source=("$pkgname-$pkgver.tar.gz::https://github.com/OpenShot/libopenshot/archive/v$pkgver.tar.gz"
        "$pkgname-find-juce.patch::https://github.com/OpenShot/libopenshot/pull/209.patch")
sha256sums=('8536b0a790b0d98ed4c3b10e11d1b34ae68ccbc710887e3703a5143d95598746'
            '038b945763dc035ecffe0968a9f0f7a29bb86a3919f4192901d5f152eb5c7f89')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -p1 -i "../${pkgname}-find-juce.patch"
  # fix hardcoded cmake module to find python3.8:
  # https://bugs.archlinux.org/task/64463
  sed -e 's/3.7/3.7 3.8/' \
      -i cmake/Modules/FindPythonLibs.cmake
  mkdir -vp build
}

build() {
  cd "${pkgname}-${pkgver}"
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  export PYTHON_LIBRARIES="/usr/lib/libpython3.so"
  export PYTHON_INCLUDE_DIRS="/usr/include/python${python_version}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DMAGICKCORE_HDRI_ENABLE=1 \
        -DMAGICKCORE_QUANTUM_DEPTH=16 \
        -DUSE_SYSTEM_JSONCPP=ON \
        -DPYTHON_LIBRARIES="/usr/lib/libpython3.so" \
        -DPYTHON_INCLUDE_DIRS="/usr/include/python${python_version}" \
        -DENABLE_RUBY=OFF \
        -B build
  make -C build
}

check() {
  cd "${pkgname}-${pkgver}"
  make -C build test
}

package() {
  cd "${pkgname}-${pkgver}"
  make -C build DESTDIR="${pkgdir}" install
}
