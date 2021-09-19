# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Hugo Doria <hugo@archlinux.org>

_name=libcap
pkgname=lib32-libcap
pkgver=2.58
pkgrel=1
pkgdesc="POSIX 1003.1e capabilities (32-bit)"
arch=('x86_64')
url="https://sites.google.com/site/fullycapable/"
license=('GPL2')
depends=("libcap=${pkgver}" 'lib32-glibc' 'lib32-pam')
makedepends=('linux-api-headers')
provides=('libcap.so' 'libpsx.so')
source=("https://kernel.org/pub/linux/libs/security/linux-privs/${_name}2/${_name}-$pkgver.tar."{xz,sign}
)
sha512sums=('092e45f82113293e1c2db7e51dca7298496c2a3af08eb41107e8c2b4798c25d3c9059e152181dc048b232fe0e59c4c3beaa158da2e5798cd6e1013d85226a9cf'
            'SKIP')
b2sums=('9f160c08e7e8bcb9eb49ab6a7a0805145461613a946ccfebeadc269b26331eadc9f467437b2f5b022e9a545b034ea4fd8fed4d5893e84d9a48dd85318810b974'
        'SKIP')
validpgpkeys=('38A644698C69787344E954CE29EE848AE2CCF3F4') # Andrew G. Morgan <morgan@kernel.org>

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
  rm -r "${pkgdir}/usr/"{include,share/man,bin}
}
