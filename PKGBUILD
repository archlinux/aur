# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: carstene1ns <arch.carsten@teibes.de>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jon Nordby <jononor@gmail.com>

pkgname=lib32-libwebp
pkgver=1.3.0
pkgrel=2
pkgdesc="WebP library (32-bit)"
url="https://developers.google.com/speed/webp/"
arch=(x86_64)
license=(BSD)
depends=(lib32-glibc libwebp)
makedepends=(cmake ninja)
provides=(libwebp{,decoder,demux,mux}.so libsharpyuv.so)
source=(https://storage.googleapis.com/downloads.webmproject.org/releases/webp/libwebp-$pkgver.tar.gz{,.asc})
sha256sums=('64ac4614db292ae8c5aa26de0295bf1623dbb3985054cb656c55e67431def17c'
            'SKIP')
validpgpkeys=('6B0E6B70976DE303EDF2F601F9C3D6BDB8232B5D') # WebP release signing key

build() {
  local cmake_options=(
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_INSTALL_LIBDIR=/usr/lib32
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_SKIP_INSTALL_RPATH=ON
    -DBUILD_SHARED_LIBS=ON
    -DWEBP_BUILD_{C,D,GIF2,IMG2,V}WEBP=OFF
    -DWEBP_BUILD_EXTRAS=OFF
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
