# Maintainer: Youngjae Lee <ls4154.lee@gmail.com>
# Contributor: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Christoph Bayer <chrbayer@criby.de>
# Contributor: James P. Harvey <jamespharvey20 at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Fredy García <frealgagu at gmail dot com>

pkgname=wiredtiger
pkgver=11.1.0
pkgrel=1
pkgdesc="High performance, scalable, NoSQL, extensible platform for data management"
arch=("x86_64")
url="https://github.com/wiredtiger/wiredtiger"
license=("GPL")
depends=("lz4" "snappy" "zlib" "zstd")
makedepends=("cmake" "swig")
source=("$pkgname-$pkgver.tar.gz::https://github.com/wiredtiger/$pkgname/archive/refs/tags/$pkgver.tar.gz"
        "include_optional.patch")
sha256sums=("0d988a8256219b614d855a2504d252975240171a633b882f19149c4a2ce0ec3d"
            "c90ae01194c0cdc11c3c967289605ba2ba6fc302ad79fbb7e0e85075b81b85a0")

prepare() {
    patch -d "$pkgname-$pkgver" -p1 < include_optional.patch
}

build() {
    cd "$pkgname-$pkgver"
    cmake -B build -DCMAKE_INSTALL_PREFIX=/usr \
        -DHAVE_BUILTIN_EXTENSION_LZ4=1 -DHAVE_BUILTIN_EXTENSION_SNAPPY=1 \
        -DHAVE_BUILTIN_EXTENSION_ZLIB=1 -DHAVE_BUILTIN_EXTENSION_ZSTD=1  .
    cmake --build build
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir" cmake --install build
}
