# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Hugo Doria <hugo@archlinux.org>

pkgname=lib32-libcap
_name=${pkgname#lib32-}
pkgver=2.75
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
sha512sums=('58184111d432c1eac832de78766ae7c0d6dabf561eada2a03a5a958abaaad62f6a8232105685d6e8bdbb90815d4e30fe3ee9ba7205a76f3ca3b4361ad339c0a9')
b2sums=('965d56b16763ac8489128c20e1679ce4fb8a62e0a1cc901de361292ed450888fa004dc4ddc7f1f60d9f90af9bde294bb47f38c29b69daf7c0166f54a5f0a3dc3')
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
