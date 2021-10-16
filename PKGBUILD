# Maintainer: Y7n05h <Y7n05h(aT)protonmail--d0t--com>
pkgname=mariadb-connector-cpp-git
pkgver=20211016
pkgrel=2
pkgdesc=" MariaDB Connector for C++ ."
arch=('x86_64')
url="https://github.com/mariadb-corporation/mariadb-connector-cpp"
license=("LGPL")
depends=('mariadb-libs')
makedepends=('cmake' 'git')
provides=('mariadb-connector-cpp')
source=("$pkgname::git+$url")
sha512sums=('SKIP')
pkgver() {
    date +%Y%m%d
}
prepare() {
    cd "$srcdir/$pkgname"
    sed -i "1i\INCLUDE_DIRECTORIES(\"/usr/include/mysql\")" ./CMakeLists.txt
    rm -rf build
    mkdir build
}

build() {
    rm "$srcdir/$pkgname/test/CMakeLists.txt"
    rmdir "$srcdir/$pkgname/libmariadb"
    cd "$srcdir/$pkgname/build"
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DINSTALL_LIB_SUFFIX=/usr/lib \
        -DUSE_SYSTEM_INSTALLED_LIB=TRUE \
        ..
    make
}

package() {
  cd "$srcdir/$pkgname/build"

  make DESTDIR="${pkgdir}" install
  mv "${pkgdir}"/usr/lib/mariadb/* "${pkgdir}"/usr/lib/
  rmdir "${pkgdir}"/usr/lib/mariadb/
}

