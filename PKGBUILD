# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=parallel-hashmap
pkgver=1.3.10
_pkgrev=e4b6668d46183a7656490d279b26145667cff3a3
pkgrel=1
pkgdesc='A family of header-only, very fast and memory-friendly hashmap and btree containers.'
url='https://greg7mdp.github.io/parallel-hashmap/'
license=('Apache')
arch=('any')
makedepends=('cmake' 'make' 'git' 'gtest')
optdepends=('python: For Conan python package manager.')
source=("$pkgname-$pkgver.tar.gz::https://github.com/greg7mdp/parallel-hashmap/archive/$_pkgrev.tar.gz"
        0001-makepkg-Use-system-gtest.patch)
sha256sums=('a7b351617f21f64775c0077423aefb451c242456907a3f53f20fcf34e8017e02'
            'ea86c04fcb31005826500c57672d74234792c1d1a6bbe482758597bbeffc0ceb')
b2sums=('cac874ac25abc7ebcc2b8189045bbb774cb4df81d0d0264c4b7ed4a3c903e1025dd1d4e955c504295901953856bb78bc038888f95cd5bf9799eeed81ddc8d137'
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
