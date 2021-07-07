# Maintainer: Gabriel-Andrew Pollo-Guilbert <gabrielpolloguilbert@gmail.com>

pkgname=yactfr-git
pkgver=r75.a6b5f32
pkgrel=1
pkgdesc='yactfr is yet another common trace format (CTF) reader'
arch=('any')
license=('MIT')
makedepends=('git' 'cmake' 'boost' 'doxygen')
url='https://github.com/eepp/yactfr'
conflicts=('yactfr')
source=("$pkgname::git+https://github.com/eepp/yactfr"
        'add-missing-assert-include.patch'
        'use-c++17.patch')
md5sums=('SKIP'
         'fa3eff08a0d0fe7b68e28310ce9870ee'
         '60e4e2f9bb00eee6ce5eafe95a3ddcae')

pkgver() {
    cd "$srcdir/$pkgname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$pkgname"

    git apply "$srcdir/add-missing-assert-include.patch"
    git apply "$srcdir/use-c++17.patch"
}

build() {
    cd "$srcdir/$pkgname"

    cmake -B build \
          -DCMAKE_BUILD_TYPE=release \
          -DOPT_BUILD_DOC=YES \
          -DCMAKE_INSTALL_PREFIX="/usr"
    make -C build
}

package() {
    cd "$srcdir/$pkgname"

    make -C build DESTDIR="$pkgdir" install
    mkdir -p "$pkgdir/usr/share/doc/yactfr"
    cp -rv build/doc/api/output/html/* "$pkgdir/usr/share/doc/yactfr"
}
