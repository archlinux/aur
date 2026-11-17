# Maintainer: Dae Euhwa <daedaevibin@ik.me>

_pkgname=svt-av1
pkgname=lib32-svt-av1
pkgver=4.3.0
pkgrel=2
pkgdesc='Scalable Video Technology AV1 encoder and decoder. (32-bits)'
arch=('x86_64')
url="https://gitlab.com/AOMediaCodec/SVT-AV1"
license=(
  'BSD-3-Clause'
  'LicenseRef-AOMPL-1.0'
)
depends=(
  # Deliberately not version-locked: this is an AUR package, so an exact pin
  # makes it unbuildable whenever the repo copy of svt-av1 lags upstream.
  # What must actually match the 64-bit package is the soname (libSvtAv1Enc.so.4);
  # bump that in lockstep if upstream ever breaks ABI.
  'svt-av1'
  'lib32-glibc'
  'lib32-gcc-libs'
)
makedepends=(
  'cmake'
  'git'
  'nasm'
  'ninja'
)
provides=('libSvtAv1Enc.so')
source=("git+https://gitlab.com/AOMediaCodec/SVT-AV1.git#tag=v${pkgver}")
b2sums=('42c2367abb2134833c332cc93b6d3f6a202fb085adeaa1dedf2afa47fbf353a8fde42e1c884f5ec6fd37b12a26c97b435ac12cf59d65188f842ca380ac60f2bf')

pkgver() {
  cd SVT-AV1
  echo "$(git describe --tags | tr -d v)"
}

prepare() {
  sed '/CMAKE_BUILD_TYPE Release/d' -i SVT-AV1/CMakeLists.txt
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG='/usr/bin/i686-pc-linux-gnu-pkg-config'
  export LDFLAGS="$LDFLAGS -Wl,-z,noexecstack"

  cmake -S SVT-AV1 -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib32 \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_APPS=OFF \
    -DNATIVE=OFF

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  rm -fr "${pkgdir}/usr/include"
  install -Dm644 SVT-AV1/{LICENSE,PATENTS}.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
