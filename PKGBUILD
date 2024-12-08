# Maintainer: Masato TOYOSHIMA <phoepsilonix@phoepsilonix.love>

pkgname=libaegis
pkgver=0.2.1
pkgrel=4
pkgdesc="Portable C implementations of the AEGIS family of high-performance authenticated encryption algorithms. "
arch=('i686' 'x86_64' 'aarch64')
makedepends=('cmake')
url="https://github.com/aegis-aead/libaegis.git"
license=('MIT')
options=('!lto')

_commit=bc12b21a42b568d1676e194cc0a6550460ec46c0
source=("git+https://github.com/aegis-aead/libaegis.git#commit=${_commit}?signed/")
# mruby-Rakefile.patch
# h2o-libressl-3.6.2.patch
sha256sums=('454d02b68dcb1fb70239e48d11bf7e2dd87d366ea3788a24cc74761d61c8ea6d')
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
