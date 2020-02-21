# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

_name=alsa-oss
pkgname=lib32-alsa-oss
pkgver=1.1.8
pkgrel=2
pkgdesc="OSS compatibility library (32 bit)"
arch=('x86_64')
license=('GPL2')
url="https://www.alsa-project.org"
depends=('lib32-glibc' 'alsa-oss')
makedepends=('lib32-alsa-lib')
provides=('libaoss.so' 'libalsatoss.so')
source=("https://www.alsa-project.org/files/pub/oss-lib/${_name}-$pkgver.tar.bz2")
sha512sums=('42966af0ca1be33b4ab1e20b2e3320056ad6caf6ecc5ecde3ae19571809a2fa924dd91d9b2a5d5b6f345b29d937b079400d2a165dbe2b8a33b857cd406c4ac7c')

prepare() {
  mv -v "${_name}-$pkgver" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  autoreconf -vfi
}

build() {
  cd "$pkgname-$pkgver"
  export CC='gcc -m32'
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig
  ./configure --prefix=/usr \
              --libdir=/usr/lib32
  make
}

package() {
  depends+=('libasound.so')
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  # Clean up lib32 package
  rm -rvf "$pkgdir"/usr/{bin,include,share}
}
