# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Hugo Doria <hugo@archlinux.org>

_name=libcap
pkgname=lib32-libcap
pkgver=2.67
pkgrel=1
pkgdesc="POSIX 1003.1e capabilities (32-bit)"
arch=(x86_64)
url="https://sites.google.com/site/fullycapable/"
license=(GPL2)
depends=(libcap=$pkgver lib32-gcc-libs lib32-glibc lib32-pam)
makedepends=(linux-api-headers)
provides=(libcap.so libpsx.so)
source=(https://kernel.org/pub/linux/libs/security/linux-privs/${_name}2/$_name-$pkgver.tar.{xz,sign})
sha512sums=('2e52c5a571cc1565e6829b0889f63216af10dfd9a86485f8ae7d0fcf4cc0db96aa21eb2ddea29e8dadf41a1194e91fb5961fe84ba07beb2ce950b6131be099d4'
            'SKIP')
b2sums=('bd9be22e439397a3c1726093cfee2410df93773b3139d50a1cdc10daecb666ddb9b64daded6e0ec9f2fd6defd16ea156dbd66bd55360ea266131f31ea0f0e989'
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
