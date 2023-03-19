# Maintainer: Maxime Gauduin <alucryd@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Xavius <xavierelf@gmail.com>

_name=portaudio
pkgname=lib32-portaudio
pkgver=19.7.0
pkgrel=2
epoch=1
pkgdesc='A free, cross-platform, open source, audio I/O library (32 bit)'
arch=(x86_64)
url="https://github.com/portaudio/portaudio/"
license=(MIT)
depends=(
  lib32-gcc-libs
  lib32-glibc
  "portaudio=$epoch:$pkgver"
)
makedepends=(
  lib32-alsa-lib
  lib32-jack
)
provides=(
  libportaudio.so
  libportaudiocpp.so
)
source=($url/archive/v$pkgver/$_name-v$pkgver.tar.gz)
sha512sums=('7e347a174109b661a685bcd617cc8fe00929c6fbf28f142fd7709a8ddbb9b5ed6e805be6647a44b4b9441b79e3474561de6f8e351b4ffc024952ed3e0e27ac1c')
b2sums=('db16882e97e60ab47b37c6d8851aa29e16e321531f3890f70390d89364aee2c1a9b42be09e7534f38d1c9ca48dd466b512874731049e42759a674571d6054220')

prepare() {
  cd $_name-$pkgver
  (
    cd bindings/cpp
    autoreconf -fiv
  )
  autoreconf -fiv
}

build() {
  local configure_options=(
    --prefix=/usr
    --enable-cxx
    --libdir=/usr/lib32
  )

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd $_name-$pkgver
  ./configure "${configure_options[@]}"
  # build breaks with multiple jobs when building C++ bindings:
  # https://github.com/PortAudio/portaudio/issues/540
  make -j1
}

package () {
  depends+=(
    lib32-alsa-lib libasound.so
    lib32-jack libjack.so
  )

  make DESTDIR="$pkgdir" install -C $_name-$pkgver
  rm -rf "$pkgdir/usr/include"
  install -vDm 644 $_name-$pkgver/LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 $_name-$pkgver/README.* -t "$pkgdir/usr/share/doc/$pkgname/"
}

# vim: ts=2 sw=2 et:
