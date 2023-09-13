# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: carstene1ns <arch.carsten@teibes.de>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jon Nordby <jononor@gmail.com>

pkgname=lib32-libwebp
pkgver=1.3.1
pkgrel=2
pkgdesc="WebP library (32-bit)"
url="https://developers.google.com/speed/webp/"
arch=(x86_64)
license=(BSD)
depends=(
  lib32-gcc-libs
  libwebp
)
makedepends=(
  cmake
  ninja
)
provides=(
  libsharpyuv.so
  libwebp{,decoder,demux,mux}.so
)
source=(
  https://storage.googleapis.com/downloads.webmproject.org/releases/webp/libwebp-$pkgver.tar.gz{,.asc}
  0001-Fix-OOB-write-in-BuildHuffmanTable.patch
)
sha256sums=('b3779627c2dfd31e3d8c4485962c2efe17785ef975e2be5c8c0c9e6cd3c4ef66'
            'SKIP'
            '0d141def8fd25fffd3b5a1625e6ed5691ff7cd48cbdd7e6b123c1ff8e77fdd0a')
b2sums=('e3f0b66f98fb5add22653b0f8d7f7f5fff9df4e60eff221da78dda1a13d3a5b9da684d37dd0756dff52b1225c5ee04a54be95c008c34033bbe9fa824cbab7cee'
        'SKIP'
        '7dddab3a29657f49ff5efae00e016997a549d51f09ca9b1e52b02166490e3a68b4939f31cdfdb5a602b38340cd5fa5a9752b0f11ff9c37fd481a0a3b60045113')
validpgpkeys=(
  6B0E6B70976DE303EDF2F601F9C3D6BDB8232B5D # WebP release signing key
)

prepare() {
  cd libwebp-$pkgver

  # CVE-2023-4863
  # https://github.com/webmproject/libwebp/commit/2af26267cdfcb63a88e5c74a85927a12d6ca1d76
  patch -Np1 -i ../0001-Fix-OOB-write-in-BuildHuffmanTable.patch
}

build() {
  local cmake_options=(
    -DBUILD_SHARED_LIBS=ON
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_LIBDIR=/usr/lib32
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_SKIP_INSTALL_RPATH=ON
    -DWEBP_BUILD_EXTRAS=OFF
    -DWEBP_BUILD_VWEBP=OFF
    -DWEBP_BUILD_{C,D,GIF2,IMG2}WEBP=OFF
  )

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

  # Mimic autotools build without --enable-asserts
  CFLAGS+=" -DNDEBUG"
  CXXFLAGS+=" -DNDEBUG"

  cmake -S libwebp-$pkgver -B build -G Ninja "${cmake_options[@]}"
  cmake --build build
}

check() {
  cd build
  ctest --output-on-failure --stop-on-failure -j$(nproc)
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  rm -r "$pkgdir"/usr/{bin,include,share}

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 \
    libwebp-$pkgver/COPYING
}

# vim:set sw=2 sts=-1 et:
