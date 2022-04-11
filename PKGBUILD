# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Hugo Doria <hugo@archlinux.org>

_name=libcap
pkgname=lib32-libcap
pkgver=2.64
pkgrel=1
pkgdesc="POSIX 1003.1e capabilities (32-bit)"
arch=(x86_64)
url="https://sites.google.com/site/fullycapable/"
license=(GPL2)
depends=(libcap=$pkgver lib32-gcc-libs lib32-glibc lib32-pam)
makedepends=(linux-api-headers)
provides=(libcap.so libpsx.so)
options=(debug)
source=(https://kernel.org/pub/linux/libs/security/linux-privs/${_name}2/$_name-$pkgver.tar.{xz,sign})
sha512sums=('3c5cf478cef249585ee1a0dfd75c6b41b0daf4e1ecb59dce894eac5523841aa79ca499be4161f73193dd8e7363edcd51063f3e281930cee939ebd50983eecbaf'
            'SKIP')
b2sums=('078ce2505a79c1bd4ca0a8eaf3444178bc19a566f0505d28c6959f86fbbac2fe2fc88c06fd0d988087a6e20e8ec66a2633146cea957f0f3fd92eaff4f81d7c66'
        'SKIP')
validpgpkeys=(38A644698C69787344E954CE29EE848AE2CCF3F4) # Andrew G. Morgan <morgan@kernel.org>

build() {
  make DYNAMIC=yes KERNEL_HEADERS=/usr/include CC="gcc -m32" lib=lib32 prefix=/usr sbindir=bin -C $_name-$pkgver
}

check() {
  make test CC="gcc -m32" -k -C "${_name}-$pkgver"
}

package() {
  make DESTDIR="$pkgdir" RAISE_SETFCAP=no lib=lib32 prefix=/usr sbindir=bin install -C $_name-$pkgver
  install -vDm 644 $_name-$pkgver/{CHANGELOG,README} -t "$pkgdir/usr/share/doc/$pkgname/"
  # remove files provided by libcap
  rm -rv "$pkgdir/usr/"{include,share/man,bin}
}
