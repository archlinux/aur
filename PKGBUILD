# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Hugo Doria <hugo@archlinux.org>

pkgname=lib32-libcap
_name=${pkgname#lib32-}
pkgver=2.77
pkgrel=1
pkgdesc="POSIX 1003.1e capabilities (32-bit)"
arch=(x86_64)
url="https://sites.google.com/site/fullycapable/"
_url=https://git.kernel.org/pub/scm/libs/libcap/libcap.git
license=('BSD-3-Clause OR GPL-2.0-only')
depends=(
  lib32-glibc
  lib32-pam
)
makedepends=(
  git
  linux-api-headers
)
provides=(
  libcap.so
  libpsx.so
)
# NOTE: we rely on a specific tagging scheme to verify with the latest signing key: https://bugzilla.kernel.org/show_bug.cgi?id=218860#c3
source=(git+$_url?signed#tag=sig-$_name-$pkgver)
sha512sums=('0b141758aa723be0ac266e3b4d9ed9b74b0bea595474352226a7b85bc669ca6b37a3130049031799166eb80ece3cbaa043a52aa1fb6755e193b57289cc45fa13')
b2sums=('28e1b5f827c0a91182d85469c51d80cdbc2906bbdb17d144d518c5a77369cda9ecb3c88a3fbd5d975cd5b225b46ce4fb44010238f5f6ec4a697b9623f7cff8bb')
validpgpkeys=(
  38A644698C69787344E954CE29EE848AE2CCF3F4  # Andrew G. Morgan <morgan@kernel.org>
  0D23D34C577B08C4082CFD76430C5CFF993116B1  # Andrew G. Morgan (2024+ libcap signing key) <morgan@kernel.org>
)

build() {
  local make_options=(
    CC="gcc -m32"
    DYNAMIC=yes
    KERNEL_HEADERS=/usr/include
    lib=lib32
    prefix=/usr
    sbindir=bin
    -C $_name
  )

  make "${make_options[@]}"
}

check() {
  make test CC="gcc -m32" -k -C $_name
}

package() {
  local make_options=(
    DESTDIR="$pkgdir"
    RAISE_SETFCAP=no
    lib=lib32
    prefix=/usr
    sbindir=bin
    install
    -C $_name
  )

  # NOTE: we add a specific libcap dependency here, because top-level it would not work as libcap is pulled in transitively via base
  depends+=(
    $_name=$pkgver
  )

  make "${make_options[@]}"
  install -vDm 644 $_name/{CHANGELOG,README} -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 $_name/License -t "$pkgdir/usr/share/licenses/$pkgname/"
  # remove files provided by libcap
  rm -rv "$pkgdir/usr/"{include,share/man,bin}
}
