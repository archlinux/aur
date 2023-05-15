# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Hugo Doria <hugo@archlinux.org>

_name=libcap
pkgname=lib32-libcap
pkgver=2.69
pkgrel=1
pkgdesc="POSIX 1003.1e capabilities (32-bit)"
arch=(x86_64)
url="https://sites.google.com/site/fullycapable/"
license=(GPL2)
depends=(
  libcap=$pkgver
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
sha512sums=('647c307dc451517da9d089495ab959b4a6fbbe41c79f4e1e9bb663569dad630ead0c2e413dfb393319e3ea14dc9848c81b392107fe3382ce1813d278c3394a7f'
            'SKIP')
b2sums=('94d1fef7666a1c383a8b96f1f6092bd242164631532868b628d2f5de71b42a371d041a978ef7fbadfee3eeb433165444995d1078cd790275bc0433a7875a697e'
        'SKIP')
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

  make "${make_options[@]}"
  install -vDm 644 $_name-$pkgver/{CHANGELOG,README} -t "$pkgdir/usr/share/doc/$pkgname/"
  # remove files provided by libcap
  rm -rv "$pkgdir/usr/"{include,share/man,bin}
}
