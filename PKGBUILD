# Maintainer: mohachi <hachiassali15@gmail.com>

pkgname="php-openswoole-git"
pkgver="v26.2.0.r1.g45573e1b7"
pkgrel=1
pkgdesc="High-performance network framework based on an event-driven, asynchronous, non-blocking I/O coroutine programming model for PHP."
arch=("x86_64" "aarch64")
url="https://github.com/openswoole/ext-openswoole"
license=("Apache-2.0")
depends=("php>=8.3.0" "openssl" "curl" "postgresql-libs" "c-ares" ""liburing"" "glibc>=2.17" "gcc-libs" "zlib>=1.2.11" "brotli>=1.0.7")
makedepends=("git" "gcc>=4.8")
optdepends=("gdb")
provides=("php-openswoole")
source=("$pkgname::git+$url.git")
sha256sums=("SKIP")

pkgver() {
    cd "$pkgname"
    git describe --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

build() {
    cd "$pkgname"
    phpize &&\
    ./configure --enable-openssl \
                --enable-http2 \
                --enable-hook-curl \
                --with-postgres \
                --enable-cares \
                --enable-mysqlnd \
                --enable-io-uring
    make -j$(nproc)
}

package() {
    cd "$pkgname"
    make INSTALL_ROOT=${pkgdir} install
    echo "extension=openswoole.so" > openswoole.ini
    install -D -m644 openswoole.ini "${pkgdir}/etc/php/conf.d/openswoole.ini"
}
