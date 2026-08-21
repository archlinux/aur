# Maintainer: Dae Euhwa <daedaevibin@ik.me>

_pkgname=svt-av1
pkgname=lib32-svt-av1
pkgver=4.2.0
pkgrel=1
pkgdesc='Scalable Video Technology AV1 encoder and decoder. (32-bits)'
arch=('x86_64')
url="https://gitlab.com/AOMediaCodec/SVT-AV1"
license=(
  'BSD'
  'custom: Alliance for Open Media Patent License 1.0'
)
depends=(
  "svt-av1=${pkgver}"
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
b2sums=('b217f854d8e97323bdc4327309a485c6821421e43d077be41ced99b0e4d2e4c46d4593a919afb0db8e89e35e23544bac22fe751e78996a62ef3d1ef8895509de')

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
    -DNATIVE=OFF

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  rm -fr "${pkgdir}/usr/include"
  (
    cd "${pkgdir}/usr/bin"
    mv SvtAv1EncApp SvtAv1EncApp-32
  )
  install -Dm644 SVT-AV1/{LICENSE,PATENTS}.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
