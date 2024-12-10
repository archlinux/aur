# Maintainer: Masato TOYOSHIMA <phoepsilonix@phoepsilonix.love>

pkgname=libaegis
pkgver=0.2.1
pkgrel=6
pkgdesc="Portable C implementations of the AEGIS family of high-performance authenticated encryption algorithms. "
arch=('i686' 'x86_64' 'aarch64')
makedepends=('cmake')
url="https://github.com/aegis-aead/libaegis.git"
license=('MIT')
options=('!lto')

_commit=edb44c8b9b44f28dfa5adf7ec985bdd0f749ea8c
source=("git+https://github.com/aegis-aead/libaegis.git#commit=${_commit}?signed/")
# mruby-Rakefile.patch
# h2o-libressl-3.6.2.patch
sha256sums=('546bb0e35d82b1c10d4337ddd913c605b38f441c30717944c0db0be664813d68')
provides=('libaegis')
conflicts=('libaegis')

pkgver() {
    cd "$srcdir/$pkgname"
        git describe --tags | sed -e 's/^v//g' -e 's/-g.*$//g' -e 's/-.*//g'
}

build() {
    cd "$srcdir/$pkgname"

        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX=/usr/ \
        -DCMAKE_C_FLAGS="$CFLAGS -DFAVOR_PERFORMANCE" \
        ..
        cmake --build . -j
}

package() {
    cd "$srcdir/$pkgname"

        install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
        cd build
        DESTDIR="$pkgdir" cmake --install .
}
