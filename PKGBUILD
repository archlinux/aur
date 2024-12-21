# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: carstene1ns <arch.carsten@teibes.de>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jon Nordby <jononor@gmail.com>

pkgname=lib32-libwebp
pkgver=1.5.0
pkgrel=1
pkgdesc="WebP library (32-bit)"
url="https://developers.google.com/speed/webp/"
arch=(x86_64)
license=(BSD-3-Clause)
depends=(
  lib32-gcc-libs
  lib32-glibc
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
)
sha256sums=('7d6fab70cf844bf6769077bd5d7a74893f8ffd4dfb42861745750c63c2a5c92c'
            'SKIP')
b2sums=('68e94f5592556ac4b57011a94abc651a187b23ca7cddd6791aec3f62bede7a7c176d4a67f8170a83990a6ff290a6716011bdb117818657b63bd3e21a8d5ed59e'
        'SKIP')
validpgpkeys=(
  6B0E6B70976DE303EDF2F601F9C3D6BDB8232B5D # WebP release signing key
)

prepare() {
  cd libwebp-$pkgver
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
  ctest --test-dir build --output-on-failure --stop-on-failure -j$(nproc)
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  rm -r "$pkgdir"/usr/{bin,include,share}

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 \
    libwebp-$pkgver/COPYING
}

# vim:set sw=2 sts=-1 et:
