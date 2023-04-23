# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=parallel-hashmap
pkgver=1.3.9
_pkgrev=78071573aac62e34e76fe3e1ea1c747046e0a468
pkgrel=1
pkgdesc='A family of header-only, very fast and memory-friendly hashmap and btree containers.'
url='https://greg7mdp.github.io/parallel-hashmap/'
license=('Apache')
arch=('any')
makedepends=('cmake' 'make' 'git' 'gtest')
optdepends=('python: For Conan python package manager.')
source=("$pkgname-$pkgver.tar.gz::https://github.com/greg7mdp/parallel-hashmap/archive/78071573aac62e34e76fe3e1ea1c747046e0a468.tar.gz"
        0001-makepkg-Use-system-gtest.patch)
sha256sums=('86663d7fc7d037eff04c9bd645000ef3b8c33815e03d39477fbae462add6d090'
            'ea86c04fcb31005826500c57672d74234792c1d1a6bbe482758597bbeffc0ceb')
b2sums=('040980e697a4139a5cdd269afb8ff46585f924c66aed0ceafda25f146d7230a8d5d1d579db34451b453347b1e89150ef558a5053c4ca433c8e942ba767c9d76f'
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
