# Maintainer: Florian Hülsmann <fh@cbix.de>

pkgbase=cadet-core
pkgname=(cadet-core cadet-core-docs)
pkgver=5.1.2
pkgrel=1
pkgdesc='Modeling and simulation framework for biotechnology processes – simulation backend'
arch=(aarch64 x86_64)
url='https://github.com/cadet/cadet-core'
license=(GPL-3.0-only)
depends=(blas gcc-libs glibc hdf5 lapack suitesparse)
makedepends=(cmake eigen git python-sphinx-sitemap python-sphinxcontrib-bibtex python-myst-parser
  python-sphinx-multiversion)
optdepends=('cadet-python: low-level python interface'
            'cadet-process: high-level python interface')
source=("git+https://github.com/cadet/$pkgname#tag=v$pkgver")
sha256sums=('d8556abde460d5e15286772ae4c47e50c87167c88e35704bd9e2b9301eada3b9')

build() {
  cmake -B build-$pkgbase \
    -S $pkgname \
    -DENABLE_TESTS=On \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev

  cmake --build build-$pkgbase

  # build docs
  make -C $pkgbase/doc SPHINXBUILD=sphinx-build html
}

check() {
  ctest --test-dir build-$pkgbase
}

package_cadet-core() {
  provides=(libcadet.so)
  DESTDIR="$pkgdir" cmake --install build-$pkgbase
}

package_cadet-core-docs() {
  pkgdesc+=' (documentation)'
  arch=(any)
  install -d "$pkgdir"/usr/share/doc
  cp -a $pkgbase/doc/build/html "$pkgdir"/usr/share/doc/$pkgbase
}
