# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Hugo Doria <hugo@archlinux.org>

_name=libcap
pkgname=lib32-libcap
pkgver=2.53
pkgrel=1
pkgdesc="POSIX 1003.1e capabilities (32-bit)"
arch=('x86_64')
url="https://sites.google.com/site/fullycapable/"
license=('GPL2')
depends=("libcap=${pkgver}" 'lib32-glibc' 'lib32-pam')
makedepends=('linux-api-headers')
provides=('libcap.so' 'libpsx.so')
source=("https://kernel.org/pub/linux/libs/security/linux-privs/${_name}2/${_name}-$pkgver.tar."{xz,sign}
        "${_name}-2.53-makefile.patch"
        "${_name}-2.53-progs_ldflags.patch"
)
sha512sums=('d83ed9460658fa75a5c118d831534388ba92ddad59944088b0d81a64c86b67ed562c7be4c5a499065ec26b1baab34298da80c8d034b61759c7dd295c2455417c'
            'SKIP'
            '0df64fd6dcd50fbbb13fea962b169e7946079e58a8f5adf61cf664b08d29832a2d0b39f50441e4cf4adbb5f4f2925df7364eefff16dcb35b71726fb8324413e7'
            'eee1fa58b85f1a33b85dfcd6d6d3c56b5a1978d10d0af665a34163bfdefc448857d7eeaf41b06aa36d3dc9d1ef124edc653c0a55b477a820c274b96a890a19d2')
b2sums=('10ebecc930d8491c65c7fcaa3f9ee6a45b6722d1d5be327a891e8bf4532ee8aa0ae664672c15e88bf0f328b4cd8f2e7ea685da44e903781ca7048dbe88c388c6'
        'SKIP'
        '3105cd035b6b76727e6a634515b8cfa12051f9a78c9d9eba57203928cd52bafd29fd86f7a2234b686c21967952357ba54699e868fb8c1ad8dd4c489b914359d8'
        '6383899d6fac08e00ce6a4234e3a35eb4adc3c64b64070785397c228c01201eec10dd5ad96d8c12e5a5ceeadab9e65ae516d60f9652a10894894848a5e70b7d7')
validpgpkeys=('38A644698C69787344E954CE29EE848AE2CCF3F4') # Andrew G. Morgan <morgan@kernel.org>

prepare() {
  mv "${_name}-$pkgver" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  # SBINDIR is hardcoded to sbin. set to bin
  # add CPPFLAGS
  patch -Np1 -i ../"${_name}-2.53-makefile.patch"
  # add back LDFLAGS, so that executables are built with them
  patch -Np1 -i ../"${_name}-2.53-progs_ldflags.patch"
}

build() {
  cd "$pkgname-$pkgver"
  make KERNEL_HEADERS='/usr/include' CC="gcc -m32" lib='lib32' prefix='/usr' sbindir='bin'
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
