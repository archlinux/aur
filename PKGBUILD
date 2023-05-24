# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: carstene1ns <arch.carsten@teibes.de>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jon Nordby <jononor@gmail.com>

pkgname=lib32-libwebp
pkgver=1.3.0
pkgrel=3
pkgdesc="WebP library (32-bit)"
url="https://developers.google.com/speed/webp/"
arch=(x86_64)
license=(BSD)
depends=(
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
  a486d800b60d0af4cc0836bf7ed8f21e12974129.patch
)
sha256sums=('64ac4614db292ae8c5aa26de0295bf1623dbb3985054cb656c55e67431def17c'
            'SKIP'
            '63042ea308dba0e7e2ae324e59b852c00f372975ae6bb31bf26cff14f263a8e5')
b2sums=('91ca9a2db3a80416a39ae81b47918e6c8b718eafba677b6976e344817a847e0ed55ffe1492d723decfa052a0f63f057f61fb24918b31f94d58835b50a4c3acf8'
        'SKIP'
        '28af8301d6761b76948a03752f0d6a181696cafa835bce792afaa1177c65cdee2a0133ff39f6951ee668f2742b7edec9a78493056cf53f359dc14ce8bcef8ec3')
validpgpkeys=(
  6B0E6B70976DE303EDF2F601F9C3D6BDB8232B5D # WebP release signing key
)

prepare() {
  cd libwebp-$pkgver

  # CVE-2023-1999
  patch -Np1 -i ../a486d800b60d0af4cc0836bf7ed8f21e12974129.patch
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
