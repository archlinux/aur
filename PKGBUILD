# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: carstene1ns <arch.carsten@teibes.de>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jon Nordby <jononor@gmail.com>

pkgname=lib32-libwebp
pkgver=1.4.0
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
sha256sums=('61f873ec69e3be1b99535634340d5bde750b2e4447caa1db9f61be3fd49ab1e5'
            'SKIP')
b2sums=('022cef190284b69af781718a82b28ee9806d7e6b1e642ee0833e608f64f691ef918a83e99db02335fb9f60d24d6f0cfc58e7e05e99a3f13d2118719d40a71722'
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
