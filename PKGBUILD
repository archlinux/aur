# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Hugo Doria <hugo@archlinux.org>

_name=libcap
pkgname=lib32-libcap
pkgver=2.47
pkgrel=1
pkgdesc="POSIX 1003.1e capabilities (32-bit)"
arch=('x86_64')
url="https://sites.google.com/site/fullycapable/"
license=('GPL2')
depends=("libcap=${pkgver}" 'lib32-glibc' 'lib32-pam')
makedepends=('linux-api-headers')
provides=('libcap.so' 'libpsx.so')
source=("https://kernel.org/pub/linux/libs/security/linux-privs/${_name}2/${_name}-$pkgver.tar."{xz,sign}
        "${_name}-2.45-makefile.patch")
sha512sums=('cfa4aaa82b7dbb76e38cd207401603582343b14eb91d6df23e0ea6698d0ec0ab2b368fe0d08208a014a1b1a68d11316ecefa45c27983f9ad95e7b8184351fad8'
            'SKIP'
            '4f613f83198dfccb8b79e1b2c8764657a85300cb166d633d86b87f46567d51fa9395387caf33e82a8718f19e9a1fc65c11e7b6f63c3c4cde1b2a27f70671ec07')
b2sums=('745bd3ba9819a1582880dff81d94ccf198fcf3f89d776ac0ce3055535e5370a0be57c5efdf7287f99ed50189af14ee46e90805d0a324f92d394211ffc6d7002d'
        'SKIP'
        '6f50d5a03c3532e6e50506cd878b1c9ca5cee5f1758f9318d4cb5d1e319cbe5f31210ba46a81b1af30730e2329aed7921c11f1a468a596a3f210972ca0da9d64')
validpgpkeys=('38A644698C69787344E954CE29EE848AE2CCF3F4') # Andrew G. Morgan <morgan@kernel.org>

prepare() {
  mv "${_name}-$pkgver" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  # SBINDIR is hardcoded to sbin. set to bin
  # add CPPFLAGS
  patch -Np1 -i ../"${_name}-2.45-makefile.patch"
}

build() {
  cd "$pkgname-$pkgver"
  make KERNEL_HEADERS='/usr/include' CC="gcc -m32" lib='lib32' prefix='/usr'
}

check() {
  cd "$pkgname-$pkgver"
  make test
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" RAISE_SETFCAP='no' lib='lib32' prefix='/usr' install

  # docs
  install -vDm 644 {CHANGELOG,README} -t "${pkgdir}/usr/share/doc/${pkgname}/"
  rm -r "${pkgdir}/usr/"{include,share/man,bin}
}
