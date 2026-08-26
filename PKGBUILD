# Maintainer: NewYearPrism

pkgname=aria2-next-pro
_pkgname=aria2-next
pkgver=2.6.4
pkgrel=2
pkgdesc='Maintained aria2 fork with extensive bug fixes and modernized architecture (with Aria2 Pro patches)'
arch=('x86_64' 'aarch64')
url='https://github.com/AnInsomniacy/aria2-next'
license=('GPL-2.0-or-later')
depends=(
    glibc
    libstdc++
    libgcc
)
makedepends=(
    cmake
    ninja
    patch
    make
    perl
)
provides=('aria2-next' 'aria2')
conflicts=('aria2-next' 'aria2')
source=(
    "${_pkgname}-${pkgver}.tar.gz::https://github.com/AnInsomniacy/aria2-next/archive/refs/tags/v${pkgver}.tar.gz"
    '0001-option-add-option-to-retry-on-http-400-403-406-or-un.patch'
    '0002-options-unlock-piece-length-limit.patch'
)
sha512sums=(
    '18daff74e96bc59a2a68120d6dbca2c396d4d9b88664088b46df6670017450cf4a9c14ab7d200a45ca8e23669cee6ce36a4f3d6e5a87c6105a93c0b1e6742656'
    '87b18ad4550110eb31de0886529b1910a7947cc0afe6d9b9b136e240392a8c96337205894244131ecae43f7dd72993e2d0fbe473e843813ac4d0fd9e19651752'
    'c5da8e6418a65d72e302d1eb90e22339891054873497e6841020952ac7c8e40e5f144194ea0ff1fb96414fddf12121a35012d47c86a69ddb0682183d851c3da5'
)
options=(
    lto
    !debug
)

prepare() {
  cd "${_pkgname}-${pkgver}"

  local src
  for src in "${source[@]:1}"; do
    src="${src%%::*}"
    src="${src##*/}"
    patch -Np1 <"../${src}"
  done
}

build() {
  CFLAGS+=" -ffile-prefix-map=${srcdir}=."
  CXXFLAGS+=" -ffile-prefix-map=${srcdir}=."

  # Superbuild mode: all dependencies (zlib/expat/sqlite/c-ares/openssl/libssh2/
  # libtorrent) are built statically from third_party/ and linked into aria2,
  # which is why they are neither in depends nor makedepends.
  # Note: ARIA2_SUPERBUILD does not forward BUILD_SHARED_LIBS, so libaria2 is
  # built and installed as a static library; CMAKE_INTERPROCEDURAL_OPTIMIZATION
  # is not forwarded either, LTO is enabled via ARIA2_RELEASE_LTO instead.
  cmake -S "${_pkgname}-${pkgver}" -B build -G Ninja \
    -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DARIA2_ENABLE_LIBARIA2=OFF
  cmake --build build
}

package() {
  # The inner (non-superbuild) project lives in build/source and is configured
  # with CMAKE_INSTALL_PREFIX=<build>/dependencies, hence the --prefix override.
  DESTDIR="${pkgdir}" cmake --install build/source --prefix /usr

  ln -s "aria2-next" "${pkgdir}/usr/bin/aria2c"
}
