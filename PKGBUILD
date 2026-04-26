# Contributor: t3kk3n <corp[at]hush[dot]ai>
# Contributor: Bakasura <bakasura[at]protonmail[dot]ch>
# Contributor: tee < teeaur at duck dot com >

pkgname=fatx
pkgver=1.19
pkgrel=1
pkgdesc="XBox filesystem support for linux"
arch=('x86_64')
url="https://sourceforge.net/projects/fatx"
license=('GPL-3.0-or-later')
makedepends=('boost' 'cmake' 'doxygen' 'graphviz')
depends=('fuse3' 'boost-libs')
source=("$url/files/${pkgname}-${pkgver}.tar.gz")
sha256sums=('5cc962ffeef1b67c5e8aebad523693de1fbb0380c386872921d05d07faced12f')

build() {
    sed -i 's/SBIN/BIN/g' "${srcdir}/CMakeLists.txt"
    sed -i 's/sbin/bin/g' "${srcdir}/CMakeLists.txt"
    cmake -B build -S "$srcdir" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX='/usr' -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build --prefix /usr
    install man8/*.gz "$pkgdir/usr/share/man/man8"
}
