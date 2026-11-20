# Maintainer: Dae Euhwa <daedaevibin@ik.me>

_pkgname=svt-av1
pkgname=lib32-svt-av1
pkgver=4.3.1
pkgrel=1
pkgdesc='Scalable Video Technology AV1 encoder and decoder. (32-bits)'
arch=('x86_64')
url="https://github.com/AOMediaCodec/SVT-AV1"
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
source=("git+https://github.com/AOMediaCodec/SVT-AV1.git#tag=v${pkgver}")
b2sums=('658d37c615a1fdc69efd95e85c6c62b2e291e6725df4ace5c000b06ba0ed2e9ac9d883f7053c1414b41de877b8f16ef3a6bd097a16745e534c8c2772bfa6b2ce')

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
