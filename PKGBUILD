# Contributor: t3kk3n <corp[at]hush[dot]ai>
# Contributor: Bakasura <bakasura[at]protonmail[dot]ch>
# Contributor: tee < teeaur at duck dot com >

pkgname=fatx
pkgver=1.20
pkgrel=1
pkgdesc="XBox filesystem support for linux"
arch=('x86_64')
url="https://sourceforge.net/projects/fatx"
license=('GPL-3.0-or-later')
makedepends=('boost' 'cmake' 'doxygen' 'graphviz')
depends=('fuse3' 'boost-libs')
source=("$url/files/${pkgname}-${pkgver}.tar.gz")
sha256sums=('b3a09f473c952c21ac590738d5b379e98362fec77487d8e16b865deb8694d291')
options=('!debug')

build() {
    sed -i 's/SBIN/BIN/g' "${srcdir}/${pkgname}-${pkgver}/CMakeLists.txt"
    sed -i 's/sbin/bin/g' "${srcdir}/${pkgname}-${pkgver}/CMakeLists.txt"
    cmake -B build -S "${srcdir}/${pkgname}-${pkgver}" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX='/usr' -Wno-author
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build --prefix /usr
    install -Dm644 "$srcdir/$pkgname-$pkgver"/man8/*.gz -t "$pkgdir/usr/share/man/man8"
}
