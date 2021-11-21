# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Hugo Doria <hugo@archlinux.org>

_name=libcap
pkgname=lib32-libcap
pkgver=2.61
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
sha512sums=('40096bf511d1c45e36f5d7f24e49c709528f3f01fcadd47b6ac40a7e8d5f1705b29b4cc56356b030639f67d0641b9f4e7c19449c3c7f4f77a4070c35745b465c'
            'SKIP')
b2sums=('50874d3510ab2476aaceb775314d98744736aacd7364a23827756caa160c101e8bc890b7c33b5e19df8b30bb6b3b1c2be323e4b6a963f97e9ee557e86b4f13a0'
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
