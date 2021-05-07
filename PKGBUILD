# Maintainer: Frédéric Nadeau <fred.nadeau@gmail.com>

pkgname="cgreen"
pkgver="1.3.0"
pkgrel=1
pkgdesc="Unit Tests, Stubbing and Mocking for C and C++"
arch=('x86_64')
url="https://cgreen-devs.github.io/"
license=('ISC')
makedepends=('cmake>=2.8.5')
provides=('libcgreen.so')
source=("https://github.com/cgreen-devs/cgreen/archive/refs/tags/${pkgver}.tar.gz"
        "0001-Remove-use-of-get_filename_component-if-no-.git-foun.patch")

sha256sums=('57ebad149a8b2e1c331bf576132306eb0bc7c2bac1ee55c47eafae1657a38b2d'
            '128eae71a5df2c477a76b6afcea02977bf53ecadc59bd25f8af92a4e5c87672e')

prepare() {
    cd cgreen-${pkgver}
    patch -p1 < ../0001-Remove-use-of-get_filename_component-if-no-.git-foun.patch
}

build() {
    export GIT_CEILING_DIRECTORIES="${PWD}"
    cd cgreen-${pkgver}
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX:PATH="/usr" \
          -DCMAKE_INSTALL_LIBDIR="lib"       \
          ..
    make
}

check() {
    cd cgreen-${pkgver}/build
    make test
}

package() {
    cd cgreen-${pkgver}/build
    make DESTDIR="$pkgdir/" install
    install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 ..//contrib/completion/cgreen_bash_completion "${pkgdir}/usr/share/bash-completion/completions/cgreen"
}
