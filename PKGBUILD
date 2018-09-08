# Maintainer: Iraklis Karagkiozoglou <iraklisk@outlook.com>

pkgname=irony-mode
pkgver=1.2.0
pkgrel=1
pkgdesc="A C/C++ minor mode for Emacs powered by libclang"
arch=('x86_64')
url="https://github.com/Sarcasm/irony-mode"
license=('GPL3')
depends=('clang')
makedepends=('cmake')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/Sarcasm/irony-mode/archive/v$pkgver.tar.gz")
sha256sums=('294dea9b524bad66a0005675fb436c102cc047cf0768633c55e24dfa40fcc8b8')

build() {
    [ -d build ] && rm -rf build
    mkdir build

    cd build
    cmake ../$pkgname-$pkgver/server  \
      -DCMAKE_BUILD_TYPE=Release      \
      -DCMAKE_INSTALL_PREFIX=/usr

    make all
}

check() {
    cd build
    make test
}

package() {
    mkdir -p "${pkgdir}/usr/share/emacs/site-lisp/"
    mkdir -p "${pkgdir}/usr/bin"

    cp "${srcdir}/build/bin/irony-server" "${pkgdir}/usr/bin"
    cp -rp "$srcdir"/"$pkgname"-"$pkgver"/*.el \
           "${pkgdir}/usr/share/emacs/site-lisp/"
}