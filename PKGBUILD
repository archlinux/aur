# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Hugo Doria <hugo@archlinux.org>

_name=libcap
pkgname=lib32-libcap
pkgver=2.68
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
sha512sums=('ede3e1356aef22e18a46dc8ff0727500ab023bea698cf2bb822abb06625e272940afea52ad6457d0cd8cf1c7f435f1b568baf0a6bf0a08ae96fbf6d7502f9de2'
            'SKIP')
b2sums=('659ee2b0f92ab7490e7f4c9ccd6aafa02ae36c509654fdb53a0b9da4d5ba8be2d1b5afd2073b2b1c75f9585a0593a9d3e70af59fe0c213e178782bbd11cd3b3d'
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
