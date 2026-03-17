# Maintainer: Ľubomír 'the-k' Kučera <lubomir.kucera.jr at gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: d'Ronin <daronin@2600.com>
# Contributor: Hexchain Tong <richard0053@gmail.com>
# Contributor: Jack Lloyd <jack@randombit.net>

pkgname=botan2
pkgver=2.19.5
pkgrel=4
pkgdesc='Crypto library written in C++ (legacy version)'
arch=(x86_64)
url='https://botan.randombit.net/'
license=(BSD)
depends=(xz sqlite)
makedepends=(
  boost
  python
  python-setuptools
  python-sphinx
)
optdepends=('python: for using botan2.py')
source=(https://botan.randombit.net/releases/Botan-${pkgver}.tar.xz{,.asc}
        boost-fixes.patch
        CVE-2024-50382.patch
        CVE-2024-50383.patch
)
sha256sums=('dfeea0e0a6f26d6724c4af01da9a7b88487adb2d81ba7c72fcaf52db522c9ad4'
            'SKIP'
            '4d6e04836b934671b893b7df207159b7a945191f25c134a8ab95ff43bd6ae536'
            '34a34279260487a5f62859ba5abddb0cdcfdf0b62b1c49acf60117a941df0e07'
            '4493316d4d04e152f3dd980b4710741bd620db404af59fba846f269ce2efeaa1')
validpgpkeys=('621DAF6411E1851C4CF9A2E16211EBF1EFBADFBC') # Botan Distribution Key

prepare() {
  cd "Botan-${pkgver}"

  patch -p0 -i ../boost-fixes.patch

  patch -p1 -i ../CVE-2024-50382.patch
  patch -p1 -i ../CVE-2024-50383.patch
}

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
