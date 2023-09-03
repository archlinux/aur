# Maintainer: Marcel Hasler <mahasler at gmail dot com>
pkgname=ifd
pkgver=1.0
_pkgname=FaceDetector-${pkgver}
pkgrel=1
pkgdesc="A library providing uniform access to popular face-detection implementations"
arch=('x86_64')
url="https://github.com/ISF-H-BRS/FaceDetector"
license=('LGPL3')
depends=('bash' 'glibc' 'gcc-libs' 'opencv' 'dlib' 'libglvnd' 'libjpeg-turbo' 'onetbb' 'lapack' 'qt6-base')
makedepends=('cmake' 'git' 'bazelisk-bin')
source=("${_pkgname}.tar.gz::https://github.com/ISF-H-BRS/FaceDetector/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3729dcaf709e260ddf8082e265e1505c9cf3607aff0939af8277bafa7f29face')

build() {
  cd ${_pkgname}

  if [[ -d build ]]; then
    rm -rf build
  fi

  mkdir build && cd build
  ln -s ../Scripts/* ./
  ./build-all.sh ..
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/lib/ifd"
  mkdir -p "${pkgdir}/usr/include/ifd"

  cd ${_pkgname}/build/out

  chmod 644 libmediapipe.so
  strip libmediapipe.so

  cp -R mediapipe FaceViewer *.so "${pkgdir}/usr/lib/ifd/"
  cp ifd.h "${pkgdir}/usr/include/ifd/"

  echo -e '#!/usr/bin/env bash\ncd /usr/lib/ifd\n'"LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:. ./FaceViewer" > ${pkgdir}/usr/bin/FaceViewer
  chmod +x ${pkgdir}/usr/bin/FaceViewer
}
