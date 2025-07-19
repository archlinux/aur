# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: dorphell <dorphell@archlinux.org>

_name=libao
pkgname=lib32-libao
pkgver=1.2.2
pkgrel=6
pkgdesc="A cross-platform audio output library and plugins (32-bit)"
url="https://www.xiph.org/ao/"
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(
  "libao=${pkgver}"
  lib32-glibc
  lib32-libpulse
)
makedepends=(
  lib32-alsa-lib
)
provides=(libao.so)
source=(
  https://gitlab.xiph.org/xiph/$_name/-/archive/$pkgver/$_name-$pkgver.tar.gz
  $pkgname-1.2.2-add-missing-time-include.patch::https://gitlab.xiph.org/xiph/libao/-/commit/1f998f5d6d77674dad01b181811638578ad68242.patch
)
sha512sums=('d2736d25b60862e7d7469611ce31b1df40a4366ab160e2ff1b46919ae91692d1596c8468e4f016303b306fc3ac1bddc7b727f535a362f403c3fe7c6532e9045a'
            '4d528f60bbbfed7f9569a6e6e5d22d74a8122aec624683c62fd17e4447eee7b79b2f722747c9e72ff1b948d7bebb56e233cdfac7a032db502c954ff4d2ccdb2e')
b2sums=('e5b5d87c4357ee113769732cb6a7e0afa28b2bc4923be8dacd1fa39ac5fb96d8a5e19bc45137ffc8ec63eef0382130ab9b311aad3a66be4566e0cb9761417b23'
        'f7e8f4ee69b435a639ecd0538d23fcc4a99cac82bc2dbba296d44a3470492b1cee6eba004bc0960e1d0b82d6b9821fd1b0e7a38d0516da3dffcec15de5b645e2')

prepare() {
  cd $_name-$pkgver
  # add missing `time.h` include
  patch -Np1 -i ../$pkgname-1.2.2-add-missing-time-include.patch
  autoreconf -fiv
}

build() {
  local configure_options=(
    --prefix=/usr
    --libdir=/usr/lib32
  )

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  CFLAGS+=" -Wno-implicit-function-declaration"

  cd $_name-$pkgver
  ./configure "${configure_options[@]}"
  make
}

package() {
  depends+=(
    lib32-alsa-lib libasound.so
  )

  make DESTDIR="$pkgdir/" install -C $_name-$pkgver
  rm -rf "$pkgdir"/usr/{include,share,bin}
}
# vim:set ts=2 sw=2 et:
