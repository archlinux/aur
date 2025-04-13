# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Hugo Doria <hugo@archlinux.org>

pkgname=lib32-libcap
_name=${pkgname#lib32-}
pkgver=2.76
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
sha512sums=('27824e220e33eb1075e07649c50b774ad37d96f85d67f41c928c3da6b87a750b0b614767fce08300bb88449f9d15a555a38dad75a867d44b512c4c6f853ad74d')
b2sums=('baf649813cd56ca8561a2d5906d653e8c72ca4f2701c675ef14102802f08858ffe4acc4eadff80618d5dce78babce82e5854ada4bca56edca240a14dde3d7544')
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
