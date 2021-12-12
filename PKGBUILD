# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Hugo Doria <hugo@archlinux.org>

_name=libcap
pkgname=lib32-libcap
pkgver=2.62
pkgrel=1
pkgdesc="POSIX 1003.1e capabilities (32-bit)"
arch=(x86_64)
url="https://sites.google.com/site/fullycapable/"
license=(GPL2)
depends=("libcap=${pkgver}" lib32-glibc lib32-pam)
makedepends=(linux-api-headers)
provides=(libcap.so libpsx.so)
source=("https://kernel.org/pub/linux/libs/security/linux-privs/${_name}2/${_name}-$pkgver.tar."{xz,sign}
)
sha512sums=('61ac004920c5cd3382a5443db2eacfc2041b7a8c0814b27084c1d111125639fe3950dea4325d0f7fb6bfb0d5de114452c3a62230cc958edb05ffdb83b213f9b3'
            'SKIP')
b2sums=('e3c86a5b88b9be932802ec8612f79e5f04912bf3e66f673eae2add85362292f4737c544d21b9e5adfd1a7a33c073568301b6532cdf0ea6c8b834d895b84323f1'
        'SKIP')
validpgpkeys=(38A644698C69787344E954CE29EE848AE2CCF3F4) # Andrew G. Morgan <morgan@kernel.org>

prepare() {
  mv "${_name}-$pkgver" "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  make DYNAMIC=yes KERNEL_HEADERS='/usr/include' CC="gcc -m32" lib='lib32' prefix='/usr' sbindir='bin'
}

check() {
  cd "$pkgname-$pkgver"
  make -k test CC="gcc -m32"
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" RAISE_SETFCAP='no' lib='lib32' prefix='/usr' sbindir='bin' install

  # docs
  install -vDm 644 {CHANGELOG,README} -t "${pkgdir}/usr/share/doc/${pkgname}/"
  # remove files provided by libcap
  rm -rv "${pkgdir}/usr/"{include,share/man,bin}
}
