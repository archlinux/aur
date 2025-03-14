# Maintainer: Masato TOYOSHIMA <phoepsilonix@phoepsilonix.love>

pkgname=libaegis
pkgver=0.4.0
pkgrel=1
pkgdesc="Portable C implementations of the AEGIS family of high-performance authenticated encryption algorithms. "
arch=('i686' 'x86_64' 'aarch64')
makedepends=('cmake')
url="https://github.com/aegis-aead/libaegis.git"
license=('MIT')
options=('!lto')

_commit=2124d6be8b8572e79267354740c5d10954f12126
source=("git+https://github.com/aegis-aead/libaegis.git#commit=${_commit}?signed/")
# mruby-Rakefile.patch
# h2o-libressl-3.6.2.patch
sha256sums=('f41975944bee0ceb7effc8f20a5d792371aea9a8ea496f9bade3ca1465c444bd')
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
