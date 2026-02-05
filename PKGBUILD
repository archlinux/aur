# Maintainer: Masato TOYOSHIMA <phoepsilonix@phoepsilonix.love>

pkgname=libaegis
pkgver=0.9.1
pkgrel=1
pkgdesc="Portable C implementations of the AEGIS family of high-performance authenticated encryption algorithms. "
arch=('i686' 'x86_64' 'aarch64')
makedepends=('cmake' 'git')
url="https://github.com/aegis-aead/libaegis.git"
license=('MIT')
options=('!lto')

_commit=b6ab782144f466d47f1ecc05918653bd127f723c
source=("git+https://github.com/aegis-aead/libaegis.git#commit=${_commit}?signed/")
# mruby-Rakefile.patch
# h2o-libressl-3.6.2.patch
sha256sums=('f0ae83c93c6f0bc5ee4fe8994fdb70f0f4094d26139e250306a44e2038e77bc0')
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
