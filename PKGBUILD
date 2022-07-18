# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Hugo Doria <hugo@archlinux.org>

_name=libcap
pkgname=lib32-libcap
pkgver=2.65
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
sha512sums=('de34cd7fecfe9b688ee08e56c71d4f39a3a05f6414f88577faaadfcd5111a0ae1824af3e76a5b8199131a8df6e87e47fdcb3570c364999e4626f2ab8fafb8671'
            'SKIP')
b2sums=('9417c5c22fa2fc03df08667dca802c2e190f17af3cda86021de175bd315cbef8607cff51ee2a9c0b6cee7a09c536dbdc43c01549e0540c335966f0afaf9268c3'
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
