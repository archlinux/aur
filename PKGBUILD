# Maintainer: Daniel Mensinger <daniel@mensinger-ka.de>
pkgname=mesh-git
pkgver=r942.c5b954e
pkgrel=1
pkgdesc='A memory allocator that automatically reduces the memory footprint of C/C++ applications. '
arch=('x86_64')
url='https://github.com/plasma-umass/Mesh'
license=('Apache')
depends=(glibc)
makedepends=()
checkdepends=()
optdepends=()
provides=(mesh)
conflicts=()
replaces=()
options=()
source=("$pkgname::git+https://github.com/plasma-umass/Mesh.git"
        "hlayers::git+https://github.com/emeryberger/Heap-Layers.git"
        "gtest::git+https://github.com/google/googletest.git" )
sha256sums=('SKIP' 'SKIP' 'SKIP')

prepare() {
  cd "$pkgname"
  git submodule init
  git config submodule.hlayers.url $srcdir/Heap-Layers
  git config submodule.gtest.url   $srcdir/googletest
  git submodule update
}

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
	./configure --optimize
	make
}

package() {
	cd "$pkgname"
  mkdir -p "$pkgdir/usr/lib"
  mkdir -p "$pkgdir/usr/include/plasma"
  install -c -m 0755 libmesh.so "$pkgdir/usr/lib/libmesh.so"
  install -c -m 0755 src/plasma/mesh.h "$pkgdir/usr/include/plasma/mesh.h"
}
