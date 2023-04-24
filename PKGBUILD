# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=parallel-hashmap
pkgver=1.3.11
_pkgrev=be6a2c79857c9ea76760ca6ce782e1609713428e
pkgrel=1
pkgdesc='A family of header-only, very fast and memory-friendly hashmap and btree containers.'
url='https://greg7mdp.github.io/parallel-hashmap/'
license=('Apache')
arch=('any')
makedepends=('cmake' 'make' 'git' 'gtest')
optdepends=('python: For Conan python package manager.')
source=("$pkgname-$pkgver.tar.gz::https://github.com/greg7mdp/parallel-hashmap/archive/$_pkgrev.tar.gz"
        0001-makepkg-Use-system-gtest.patch)
sha256sums=('3844b03a34316c93461f799d3a0ec748661edd3366c88d6b88dff1256ccea8b2'
            'ea86c04fcb31005826500c57672d74234792c1d1a6bbe482758597bbeffc0ceb')
b2sums=('4acd3d8842941ba5f7dd61422f7955a01a3851d0113dbc8f497ee16af27e0d2f43993e214654ccb1ce7e5cd0fc31282c34e7f2619616f28e66691d0d04ff7062'
        '29df10b97cfcc8987c4fba3eb747fc3fb8cedc742431de8e59af5ef0e543d6f00458a0f55fe37cb9199051326ce2d95a394daed31e039419b38faaee3cccfa35')

prepare() {
  cd "$pkgname-$_pkgrev"

  patch -Np1 -i "$srcdir/0001-makepkg-Use-system-gtest.patch"
}

build() {
  rm -rf build
  cmake -B build -S "$pkgname-$_pkgrev" \
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
