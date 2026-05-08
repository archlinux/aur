# Maintainer: Masato TOYOSHIMA <phoepsilonix@phoepsilonix.love>

pkgname=libaegis
pkgver=0.10.1
pkgrel=1
pkgdesc="Portable C implementations of the AEGIS family of high-performance authenticated encryption algorithms. "
arch=('i686' 'x86_64' 'aarch64')
makedepends=('cmake' 'git')
url="https://github.com/aegis-aead/libaegis.git"
license=('MIT')
options=('!lto')

_commit=45fcfd7af184e54064200a5dd1b78094a780773c
source=("git+https://github.com/aegis-aead/libaegis.git#commit=${_commit}?signed/")
# mruby-Rakefile.patch
# h2o-libressl-3.6.2.patch
sha256sums=('a3c1f12c82ab1c72c9111139a6f7e95201a4260b253408e2e33d0ec1c13fa481')
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
