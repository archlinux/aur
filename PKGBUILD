# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Hugo Doria <hugo@archlinux.org>

_name=libcap
pkgname=lib32-libcap
pkgver=2.66
pkgrel=1
pkgdesc="POSIX 1003.1e capabilities (32-bit)"
arch=(x86_64)
url="https://sites.google.com/site/fullycapable/"
license=(GPL2)
depends=(libcap=$pkgver lib32-gcc-libs lib32-glibc lib32-pam)
makedepends=(linux-api-headers)
provides=(libcap.so libpsx.so)
source=(https://kernel.org/pub/linux/libs/security/linux-privs/${_name}2/$_name-$pkgver.tar.{xz,sign})
sha512sums=('ac005b622f6e065f30ce282a5c87240e7b9da75366ee537aa4835bc501b44bc242c10a4ba4dc070e2415fc7f635d1c3c4e45fbeeaf962cf7973dda82bf6377f0'
            'SKIP')
b2sums=('e79bf10c6a3dbffe96dc97aad0bed67caa0b3805d9dcaff1e4a8a833396ee5c6da4f7f0d321b254e99a00073bc39021b9f3a4b350d93094d0df4d74889b3ca56'
        'SKIP')
validpgpkeys=(38A644698C69787344E954CE29EE848AE2CCF3F4) # Andrew G. Morgan <morgan@kernel.org>

build() {
  make DYNAMIC=yes KERNEL_HEADERS=/usr/include CC="gcc -m32" lib=lib32 prefix=/usr sbindir=bin -C $_name-$pkgver
}

check() {
  make test CC="gcc -m32" -k -C $_name-$pkgver
}

package() {
  make DESTDIR="$pkgdir" RAISE_SETFCAP=no lib=lib32 prefix=/usr sbindir=bin install -C $_name-$pkgver
  install -vDm 644 $_name-$pkgver/{CHANGELOG,README} -t "$pkgdir/usr/share/doc/$pkgname/"
  # remove files provided by libcap
  rm -rv "$pkgdir/usr/"{include,share/man,bin}
}
