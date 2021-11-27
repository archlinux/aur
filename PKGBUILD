# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=elemental-gmp-git
pkgver=3801.cc51ddb0f
pkgrel=2
pkgdesc="Fork of elemental which bypasses MPFR to use GMP directly"
arch=(i686 x86_64)
license=('BSD')
url="http://arxiv.org/abs/1502.02033"
depends=('gmp' 'lapack' 'metis' 'openblas' 'openmpi')
makedepends=('cmake' 'git')
source=('git+https://gitlab.com/bootstrapcollaboration/elemental.git'
        '0001-Find-LAPACK-more-easily.patch')

pkgver() {
        cd "$srcdir"/elemental
        echo `git rev-list --count master`.`git rev-parse --short master`
}

build () {
        cd "$srcdir"/elemental
        git apply ../0001-Find-LAPACK-more-easily.patch

        mkdir -p build
        cd build
        cmake ../ \
                -DCMAKE_INSTALL_PREFIX=/usr \
                -DCMAKE_C_COMPILER=mpicc \
                -DCMAKE_CXX_COMPILER=mpicxx \
                -DCMAKE_Fortran_COMPILER=gcc
        make -j4
}

package() {
        cd "$srcdir"/elemental/build

        make DESTDIR="$pkgdir" install
        mv "$pkgdir"/usr/CMake "$pkgdir"/usr/lib/cmake
        mv "$pkgdir"/usr/conf "$pkgdir"/usr/share/elemental/
        rm -rf "$pkgdir"/usr/python
}

sha256sums=('SKIP'
            'c28b868b5b8c1d946d5ede5539e7aeb7a7b63c85f8555f707aa05617defb8720')
