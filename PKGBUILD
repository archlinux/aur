# Maintainer: mohachi <hachiassali15@gmail.com>

pkgname="php-openswoole-git"
pkgver="22.1.2.r72.gc9136395a"
pkgrel=1
pkgdesc="Programmatic Server for PHP with Async IO, Coroutines and Fibers"
arch=('any')
url="https://openswoole.com/"
license=("unkown")
depends=("linux>=2.3.32" "php>=8.1.0" "brotli" "glibc" "gcc-libs" "zlib")
makedepends=("git" "gcc>=4.8")
optdepends=("openssl" "c-ares" "gdb")
provides=("openswoole.so=$pkgver")
source=("$pkgname::git+https://github.com/openswoole/ext-openswoole.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --tags --long | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

build() {
    cd "$pkgname"
    phpize &&\
    ./configure --enable-openssl \
                --enable-mysqlnd \
                --enable-sockets \
                --enable-http2 \
                --enable-hook-curl \
                --with-postgres \
                --enable-cares && \
    make -j$(nproc)
}

package() {
    cd "$pkgname"
    make INSTALL_ROOT=${pkgdir} install
    echo "extension=openswoole.so" > openswoole.ini
    install -D -m644 openswoole.ini "${pkgdir}/etc/php/conf.d/openswoole.ini"
}
