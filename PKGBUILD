# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=parallel-hashmap
pkgver=1.3.12
pkgrel=1
pkgdesc='A family of header-only, very fast and memory-friendly hashmap and btree containers.'
url='https://greg7mdp.github.io/parallel-hashmap/'
license=('Apache-2.0')
arch=('any')
makedepends=('cmake' 'make' 'git' 'gtest')
optdepends=('python: For Conan python package manager.')
source=("$pkgname-$pkgver.tar.gz::https://github.com/greg7mdp/parallel-hashmap/archive/v$pkgver.tar.gz"
        0001-makepkg-Use-system-gtest.patch)
sha256sums=('0cc203144321924cfbfcc401f42d8204c0dd24e2760c7a1c091baa16d9777c08'
            '8bd643ef83f8b5681ca875da1aec361846d9262a4d038921333ff50240b75f51')
b2sums=('e26c6b70c3cf1b55a0c8a7f002899d5cf5f709b434939447800d551ccd9a9ff2d9ed50b52bd7f4ca0c1cae0d080c8294527894f220db1a01c726a79ede10f188'
        '3d6b8f54801b43f68f2ca224e4844dde1ed66ae51b145e79579eb2db123f8ae0e38fb7d16fbbadea237275d65a53d72bbb83621808d0c6facc5d61ead0771f3a')

prepare() {
  cd "$pkgname-$pkgver"

  patch -Np1 -i "$srcdir/0001-makepkg-Use-system-gtest.patch"
}

build() {
  rm -rf build
  cmake -B build -S "$pkgname-$pkgver" \
    -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D PHMAP_BUILD_TESTS=ON \
    -D PHMAP_BUILD_EXAMPLES=OFF

  make -C build
}

check() {
  cmake --build build --target test
}

package() {
  cmake --install build --prefix "$pkgdir/usr"
}
