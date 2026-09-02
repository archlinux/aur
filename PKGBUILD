# $Id$
# Maintainer: unit73e <unit73e@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: kfgz <kfgz@interia.pl>
# Contributor: Lorenzo Ferrillo <lorenzofer at live dot it>
# Contributor: Alexandre Demers <alexandre.f.demers@gmail.com>

pkgname=lib32-x265
pkgver=4.2
pkgrel=2
epoch=1
pkgdesc='Open Source H265/HEVC video encoder. 32bit libraries.'
arch=('x86_64')
url='https://www.x265.org/'
license=('GPL-2.0-or-later')
depends=(
  'x265'
  'lib32-glibc'
  'lib32-libnuma'
  'libgcc'
  'libstdc++'
)
makedepends=(
  'cmake'
  'git'
  'nasm'
  'ninja'
)
provides=('libx265.so')
source=(
  "git+https://github.com/Multicorewareinc/x265.git#tag=${pkgver}"
  "0001-Fix-build-with-GCC-15.patch"
)
b2sums=(
  '1ad111130a64ca822b5b78dc84e0078e30bbadb67a9db16bdd6a860a4210c17701ae5681930e10ec3e6335ea767ac01391fc1a68ce5ca72450c4a075b664a348'
  'af2ee0460c0c2f6f36e4f124a9ac16610e3884001262a6f08043fa1de4a85e2b5fd4fb12c64b8c94cfb59c3031bb7a1324e307fa2049e3378e2add9a58f5bd9e'
)

prepare() {
  cd x265

  # Fix build with GCC 15
  git apply -3 ../0001-Fix-build-with-GCC-15.patch

}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  local common_options=(
    -S x265/source
    -G Ninja
    -D CMAKE_INSTALL_PREFIX=/usr
    -D LIB_INSTALL_DIR=lib32
    -D ENABLE_HDR10_PLUS=TRUE
    -D ENABLE_ASSEMBLY=OFF
    -W no-dev
  ) hdr_options=(
    "${common_options[@]}"
    -D ENABLE_CLI=FALSE
    -D ENABLE_SHARED=FALSE
    -D EXPORT_C_API=FALSE
    -D HIGH_BIT_DEPTH=TRUE
  ) final_options=(
    "${common_options[@]}"
    -D ENABLE_SHARED=TRUE
    -D EXTRA_LIB='x265_main10.a;x265_main12.a'
    -D EXTRA_LINK_FLAGS='-L .'
    -D LINKED_10BIT=TRUE
    -D LINKED_12BIT=TRUE
  )

  echo "Building build-10"
  cmake -B build-10 "${hdr_options[@]}"
  cmake --build build-10

  echo "Building build-12"
  cmake -B build-12 "${hdr_options[@]}" -D MAIN12=TRUE
  cmake --build build-12

  echo "Building build"
  cmake -B build "${final_options[@]}"
  ln -sr build-10/libx265.a build/libx265_main10.a
  ln -sr build-12/libx265.a build/libx265_main12.a
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  rm "${pkgdir}"/usr/bin  "${pkgdir}"/usr/include -Rf
}

