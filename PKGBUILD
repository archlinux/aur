# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=parallel-hashmap
pkgver=1.3.8
pkgrel=1
pkgdesc='A family of header-only, very fast and memory-friendly hashmap and btree containers.'
url='https://greg7mdp.github.io/parallel-hashmap/'
license=('Apache')
arch=('any')
makedepends=('cmake' 'make' 'git' 'gtest')
optdepends=('python: For Conan python package manager.')
source=("$pkgname-$pkgver.tar.gz::https://github.com/greg7mdp/parallel-hashmap/archive/refs/tags/v$pkgver.tar.gz"
        0001-makepkg-Use-system-gtest.patch)
sha256sums=('c4562ea360dc1dcaddd96a0494c753400364a52c7aa9750de49d8e6a222d28d3'
            'c857c96a74a2aa3f1753bac5978d9e8aef7fe16afc3f3ad900037de666d186a6')
b2sums=('b56bd2a8f958f69c400e8b736669f7bbe875823ca28370a6ce0f25a6de995a81b4ff8269f84eea3bbdcd62ec96d2a7613d8d414abcf2da6215e476f81927d4ad'
        '9b6ab3cfbb8c0ecc1eb81df4a7048c50a782de1da81737b6f7498b235c7db23fbbd9f525e42065f59a48862e4b210809443f20099439213b7db9e4a092693787')

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
