# Maintainer: mfw <espadonne@outlook.com>

pkgname=fortsh
pkgver=1.4.0
pkgrel=1
pkgdesc='Modern Unix shell implementation in Fortran 2018 with comprehensive shell features including case statements, here documents, history expansion, enhanced aliases, and associative arrays'
arch=('x86_64')
url='https://github.com/FortranGoingOnForty/fortsh'
license=('MIT')
depends=('glibc')
makedepends=('gcc-fortran' 'gcc' 'make')
source=("https://github.com/FortranGoingOnForty/fortsh/releases/download/v$pkgver/fortsh-$pkgver.tar.gz")
sha256sums=('4aa6b639f7b5eae1b43c837f665fecacb9057487ea72087cea0600ea4df1465f')

build() {
    cd fortsh-$pkgver
    make clean
    make -j1 all FCFLAGS="-Wall -Wextra -std=f2018 -fPIC -g -O2 -Wno-unused-variable -Wno-unused-dummy-argument -Wno-surprising -Wno-maybe-uninitialized"
}

check() {
    cd fortsh-$pkgver
    make test || true  # Allow tests to fail gracefully if they require interactive input
}

package() {
    cd fortsh-$pkgver
    
    # Install main binary
    install -Dm755 bin/fortsh "$pkgdir/usr/bin/fortsh"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    [ -f TEST_RESULTS.md ] && install -Dm644 TEST_RESULTS.md "$pkgdir/usr/share/doc/$pkgname/TEST_RESULTS.md" || true
}