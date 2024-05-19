# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Hugo Doria <hugo@archlinux.org>

_name=libcap
pkgname=lib32-libcap
pkgver=2.70
pkgrel=1
pkgdesc="POSIX 1003.1e capabilities (32-bit)"
arch=(x86_64)
url="https://sites.google.com/site/fullycapable/"
license=('BSD-3-Clause OR GPL-2.0-only')
depends=(
  lib32-gcc-libs
  lib32-glibc
  lib32-pam
)
makedepends=(
  linux-api-headers
)
provides=(
  libcap.so
  libpsx.so
)
source=(https://kernel.org/pub/linux/libs/security/linux-privs/${_name}2/$_name-$pkgver.tar.{xz,sign})
sha512sums=('4e0bf0efeccb654c409afe9727b2b53c1d4da8190d7a0a9848fc52550ff3e13502add3eacde04a68a5b7bec09e91df487f64c5746ba987f873236a9e53b3d4e8'
            'SKIP')
b2sums=('77b72acee53032117ea481e3380d1b497f9264b6193b9523542508c7c3e46070248ca4ed910d35809ce6e52caa60cbb31edb125c47221627eeda35c61bd0914b'
        'SKIP')
# NOTE: contacted upstream on 2024-05-19 about unsafe (and differing) key for signed git tags and use of SHA-1 binding signatures in key used for custom source tarballs in the hopes of them using a new key in the future
validpgpkeys=(38A644698C69787344E954CE29EE848AE2CCF3F4) # Andrew G. Morgan <morgan@kernel.org>

build() {
  local make_options=(
    CC="gcc -m32"
    DYNAMIC=yes
    KERNEL_HEADERS=/usr/include
    lib=lib32
    prefix=/usr
    sbindir=bin
    -C $_name-$pkgver
  )

  make "${make_options[@]}"
}

check() {
  make test CC="gcc -m32" -k -C $_name-$pkgver
}

package() {
  local make_options=(
    DESTDIR="$pkgdir"
    RAISE_SETFCAP=no
    lib=lib32
    prefix=/usr
    sbindir=bin
    install
    -C $_name-$pkgver
  )

  depends+=(
    libcap=$pkgver
  )

  make "${make_options[@]}"
  install -vDm 644 $_name-$pkgver/{CHANGELOG,README} -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 $_name-$pkgver/License -t "$pkgdir/usr/share/licenses/$pkgname/"
  # remove files provided by libcap
  rm -rv "$pkgdir/usr/"{include,share/man,bin}
}
