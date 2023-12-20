# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Daniel Bermond <dbermond@archlinux.org>
# Contributor: Thomas Schneider <maxmusterm@gmail.com>

_pkgname=svt-av1
pkgname=lib32-svt-av1
pkgver=1.8.0
pkgrel=1
pkgdesc='Scalable Video Technology AV1 encoder and decoder'
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
provides=(
  'libSvtAv1Dec.so'
  'libSvtAv1Enc.so'
)
_tag=59645eea34e2815b627b8293aa3af254eddd0d69
source=("git+https://gitlab.com/AOMediaCodec/SVT-AV1.git#tag=${_tag}")
b2sums=('SKIP')

prepare() {
  sed '/CMAKE_BUILD_TYPE Release/d' -i SVT-AV1/CMakeLists.txt
}

pkgver() {
  cd SVT-AV1
  echo "$(git describe --tags | tr -d v)"
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

  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
  rm -fr "${pkgdir}/usr/include"
  (
    cd "${pkgdir}/usr/bin"
    mv SvtAv1DecApp SvtAv1DecApp-32
    mv SvtAv1EncApp SvtAv1EncApp-32
  )
  install -Dm 644 SVT-AV1/{LICENSE,PATENTS}.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
