# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Hugo Doria <hugo@archlinux.org>

_name=libcap
pkgname=lib32-libcap
pkgver=2.57
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
sha512sums=('5c70b3c6a1248ca0de92538614f0d0d516d72f6f25b135c92738c377b67533662e6fd6b0b61cb051ec99f406387d3334fcc7ddb54789626e4c387bcf46ebffbf'
            'SKIP')
b2sums=('e0c004f3d11caf824d907315e6102707bb34c0ef3e9d430f23c191d711f073267ef6dc44463e2ce8041b8d13658b0c20560f7f3c6387f770ff9e66b81ff9f5d3'
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
