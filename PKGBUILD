# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: d'Ronin <daronin@2600.com>
# Contributor: Hexchain Tong <richard0053@gmail.com>
# Contributor: Jack Lloyd <jack@randombit.net>

pkgname=botan2
pkgver=2.19.3
pkgrel=1
pkgdesc='Crypto library written in C++ (legacy version)'
arch=(x86_64)
url='https://botan.randombit.net/'
license=(BSD)
depends=(xz sqlite)
makedepends=(python boost)
optdepends=('python: for using botan2.py')
source=(https://botan.randombit.net/releases/Botan-${pkgver}.tar.xz{,.asc})
sha256sums=('dae047f399c5a47f087db5d3d9d9e8f11ae4985d14c928d71da1aff801802d55'
            'SKIP')
validpgpkeys=('621DAF6411E1851C4CF9A2E16211EBF1EFBADFBC') # Botan Distribution Key

build() {
  cd Botan-$pkgver

  ./configure.py \
    --prefix=/usr \
    --with-bzip \
    --with-lzma \
    --with-zlib \
    --with-boost \
    --with-sqlite3 \
    --with-os-feature=getrandom \
    --build-targets=shared,tests
  make
}

check() {
  cd Botan-$pkgver

  LD_LIBRARY_PATH="$PWD" ./botan-test
}

package() {
  DESTDIR="$pkgdir" make -C Botan-$pkgver install
  install -Dm644 Botan-$pkgver/license.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
