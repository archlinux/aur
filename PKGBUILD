# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: Foster McLane <fkmclane@gmail.com>
# Contributor: Jonathan Thomas <jonathan@openshot.org>

pkgname=libopenshot
pkgver=0.2.5
pkgrel=10
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
            '2f3226bfe5970e7c5df665cded8b526e12e1385468a3213ed050a644cd50a946f8918e0efbe320d47c1f58286c37b99b2087f5398f4acc0f80cf71ff68f49402')
b2sums=('19205c4f02d8b863b48e920164302853c7a505893783161e6a146e7a9728cefa19d4e48bc82b862e920967f110988ac28f5f495912efabbbacc98f55ebb51856'
        '657e931b3171cbea410be2a2e175f192d2eabb03e36e7a23e0b6599e265dfd07dd6d8829772d0493367a10e8eb13c53c2f1a1dd6e926956f92b368209ae2d9ae')

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
  make -C build test || printf "Audio is broken with ffmpeg 4.4 https://github.com/OpenShot/libopenshot/issues/676\n"
}

package() {
  depends+=('libavcodec.so' 'libavformat.so' 'libavutil.so' 'libjsoncpp.so'
  'libopenshot-audio.so' 'libswscale.so' 'libswresample.so' 'libx264.so')
  cd "${pkgname}-${pkgver}"
  make -C build DESTDIR="${pkgdir}" install
  install -vDm 644 {AUTHORS,README.md} -t "${pkgdir}/usr/share/doc/${pkgname}"
}
