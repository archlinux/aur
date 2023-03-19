# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

_name=alsa-oss
pkgname=lib32-alsa-oss
pkgver=1.1.8
pkgrel=4
pkgdesc="OSS compatibility library (32 bit)"
arch=(x86_64)
url="https://www.alsa-project.org"
license=(GPL2)
depends=(
  alsa-oss=$pkgver
  lib32-glibc
)
makedepends=(
  lib32-alsa-lib
)
provides=(
  libaoss.so
  libalsatoss.so
)
source=(https://www.alsa-project.org/files/pub/oss-lib/$_name-$pkgver.tar.bz2{,.sig})
sha512sums=('42966af0ca1be33b4ab1e20b2e3320056ad6caf6ecc5ecde3ae19571809a2fa924dd91d9b2a5d5b6f345b29d937b079400d2a165dbe2b8a33b857cd406c4ac7c'
            'SKIP')
b2sums=('47124c4edd14878b202e6ff6866b5441ffa0991ac3011a3db1efcd1dd2a0c27c9f2b8b38c2a51e8b46cb5714a97393a462154cdfaf89f1238244f7b2635a7740'
        'SKIP')
validpgpkeys=(F04DF50737AC1A884C4B3D718380596DA6E59C91)  # ALSA Release Team (Package Signing Key v1) <release@alsa-project.org>

prepare() {
  cd $_name-$pkgver
  autoreconf -fiv
}

build() {
  local configure_options=(
    --prefix=/usr
    --libdir=/usr/lib32
  )

  export CC='gcc -m32'
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig
  # prevent static lib mangling with LTO
  CFLAGS+=" -ffat-lto-objects"

  cd $_name-$pkgver
  ./configure "${configure_options[@]}"
  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  depends+=(
    lib32-alsa-lib libasound.so
  )

  make DESTDIR="$pkgdir" install -C $_name-$pkgver
  # Clean up lib32 package
  rm -rvf "$pkgdir"/usr/{bin,include,share}
}
