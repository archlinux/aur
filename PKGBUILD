# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: Foster McLane <fkmclane@gmail.com>
# Contributor: Jonathan Thomas <jonathan@openshot.org>

pkgname=libopenshot
pkgver=0.2.5
pkgrel=4
pkgdesc="A video editing, animation, and playback library for C++, Python, and Ruby"
arch=('x86_64')
url="https://github.com/openshot/libopenshot"
license=('LGPL3')
# TODO: package cppzmq and resvg
depends=('gcc-libs' 'glibc' 'libmagick' 'python' 'qt5-base' 'qt5-multimedia'
'zeromq')
makedepends=('cmake' 'doxygen' 'ffmpeg' 'jsoncpp' 'libopenshot-audio' 'swig'
'unittestpp' 'x264')
provides=('libopenshot.so')
source=("$pkgname-$pkgver.tar.gz::https://github.com/OpenShot/libopenshot/archive/v$pkgver.tar.gz"
        "$pkgname-0.2.5-gcc10.patch::https://github.com/OpenShot/libopenshot/pull/512/commits/13290364e7bea54164ab83d973951f2898ad9e23.patch")
sha512sums=('b7cdf72897e6edaa8cc00e17dbe30f5b22a6b5d69aab64ddafb184458b41ef0332db1f3e2c6f039492bf7adb521d9758834d0bf6c24e6421a55970d8cf8caba7'
            'ec492cf09563671b79850035c8138df3bbc4b2f9bd1261aa410a85e0ed977e1a2fcc1299a855490f93fe677e6b9c232d323d3fbf56be8470b420280f352b18dc')

prepare() {
  cd "${pkgname}-${pkgver}"
  # fix build with gcc >= 10
  # https://github.com/OpenShot/libopenshot/pull/512
  patch -Np1 -i "../$pkgname-0.2.5-gcc10.patch"
}

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
  make -C build
}

check() {
  cd "${pkgname}-${pkgver}"
  make -C build test
}

package() {
  depends+=('libavcodec.so' 'libavformat.so' 'libavutil.so' 'libjsoncpp.so'
  'libopenshot-audio.so' 'libswscale.so' 'libswresample.so' 'libx264.so')
  cd "${pkgname}-${pkgver}"
  make -C build DESTDIR="${pkgdir}" install
  install -vDm 644 {AUTHORS,README.md} -t "${pkgdir}/usr/share/doc/${pkgname}"
}
