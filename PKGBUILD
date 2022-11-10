# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=quilc
pkgver=1.26.0
pkgrel=3
pkgdesc="The high-performance and featureful Quil simulator."
arch=('x86_64')
url="https://github.com/quil-lang/quilc"
license=('Apache')
depends=(gcc-fortran quicklisp sbcl zeromq)
conflicts=(rigetti-quilc-git)
options=(!strip)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('d811258c40b037522069cdd3edc7c2f403baf659d4d7182f47716355af771249877b8073c2272946bc76d8ddc9d60c1836069e2eb17048c215657181f4d3e850')

prepare() {
    cd $pkgname-$pkgver
    sed -i 's/$(HOME)/./' Makefile # use local directory instead of home
    sed -i 's/$(SBCL_BIN)/$(SBCL_BIN) --dynamic-space-size 4096/' Makefile # edit this in case you get heap exhaustion
}

build() {
    cd $pkgname-$pkgver
    make -j1 quilc-sdk-barebones
}

check() {
    cd $pkgname-$pkgver
    make -j1 test
}

package() {
    cd $pkgname-$pkgver
    mkdir -p "$pkgdir/usr/bin"
    make -j1 DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 doc/man/quilc.1 "$pkgfdir/usr/share/man/man1/quilc.1"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

