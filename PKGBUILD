# Maintainer: Florian Hülsmann <fh@cbix.de>

pkgbase=cadet-core
pkgname=(cadet-core cadet-core-docs)
pkgver=5.0.3
pkgrel=4
pkgdesc='Modeling and simulation framework for biotechnology processes – simulation backend'
arch=(aarch64 x86_64)
url='https://github.com/cadet/cadet-core'
license=(GPL-3.0-only)
depends=(blas gcc-libs glibc hdf5 lapack suitesparse)
makedepends=(cmake eigen git python-sphinx-sitemap python-sphinxcontrib-bibtex python-myst-parser
  python-sphinx-multiversion)
optdepends=('cadet-python: low-level python interface'
            'cadet-process: high-level python interface')
provides=(libcadet.so)
source=("git+https://github.com/cadet/$pkgname#tag=v$pkgver")
sha256sums=('19e8e2da426a95f12212b6e6a11e89a33cea9592d9adccccd08ec8f5e4f142a1')

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
  DESTDIR="$pkgdir" cmake --install build-$pkgbase
}

package_cadet-core-docs() {
  pkgdesc+=' (documentation)'
  arch=(any)
  install -d "$pkgdir"/usr/share/doc
  cp -a $pkgbase/doc/build/html "$pkgdir"/usr/share/doc/$pkgbase
}
