# Maintainer: NewYearPrism

pkgname=aria2-next-pro
_pkgname=aria2-next
pkgver=2.5.9
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
    '0001-options-unlock-connection-per-server-limit.patch'
    '0002-download-retry-on-slow-speed-and-conection-close.patch'
    '0003-option-add-option-to-retry-on-http-400-403-406-or-un.patch'
)
sha512sums=(
    '8fa4a72ba58ceeec713c5e38458cbecc0eb6e58c0ef57a054b6304e4e167d1f916cdee6c43e444cc318a3b6c9eccb85c1431979c0a78aece2ca9184d82f110e0'
    'c6d257f2cf53e778f1f2fb5c3d2accb013b61e01b123806ea2b1ebbe0c8a085b4c4dbc43c44e1624a64ce353192adb2e5febfbe7581aa5580793cdb54b476e11'
    '014346d373604eb1c4ed77aa4eae33089d2d15de04a633c127e62e63869c77db4f012bd1fa5d4f60b8458a7a846b0c911c3ffbfcc954666c799a778995325e40'
    'fd0a7af20d140c6481a568c642771562b29ddfe0f49630bf1f101c3285a037bfb314a0f0a6673d4714526e10f6e9ffc799ac430eeb7da7ba185cfe706318a725'
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
    -DBUILD_TESTING=OFF \
    -DARIA2_SUPERBUILD=ON \
    -DARIA2_ENABLE_LIBARIA2=ON \
    -DARIA2_RELEASE_LTO=ON
  cmake --build build
}

package() {
  # The inner (non-superbuild) project lives in build/source and is configured
  # with CMAKE_INSTALL_PREFIX=<build>/dependencies, hence the --prefix override.
  DESTDIR="${pkgdir}" cmake --install build/source --prefix /usr

  # libaria2.pc is generated with the vendored dependency prefix baked in
  sed -i 's|^prefix=.*|prefix=/usr|' \
    "${pkgdir}/usr/lib/pkgconfig/libaria2.pc"

  ln -s "aria2-next" "${pkgdir}/usr/bin/aria2c"
}
