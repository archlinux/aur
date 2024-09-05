# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: Alim Gokkaya <alimgokkaya@gmail.com>
# Contributor: Seth Girvan <snth@snthhacks.com>

pkgname=librdkafka-git
pkgver=2.5.3.r0.9416dd8
pkgrel=1
pkgdesc='The Apache Kafka C/C++ library'
arch=(x86_64)
url='https://github.com/confluentinc/librdkafka'
license=('BSD-2-Clause')
depends=('curl'
         'gcc-libs'
         'glibc'
         'libsasl'
         'lz4'
         'openssl'
         'zlib'
         'zstd')
makedepends=('git'
             'python'
             'rapidjson')
conflicts=('librdkafka')
provides=("${pkgname%-git}=${pkgver}")
source=("${pkgname%-git}::git+$url")
changelog="CHANGELOG.md"
b2sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "${pkgname%-git}"
    ./configure --prefix=/usr
    make
}

check() {
    cd "${pkgname%-git}"
    make -k check
}

package() {
    cd "${pkgname%-git}"
    make DESTDIR="$pkgdir" install
    install -vDm644 README.md -t "$pkgdir/usr/share/${pkgname%-git}/"
    install -vDm644 CONFIGURATION.md -t "$pkgdir/usr/share/${pkgname%-git}/"
    install -vDm644 CONTRIBUTING.md -t "$pkgdir/usr/share/${pkgname%-git}/"
    install -vDm644 CODE_OF_CONDUCT.md -t "$pkgdir/usr/share/${pkgname%-git}/"
    for license in $(ls ./LICENSE*);
    do
        install -vDm644 "$license" -t "$pkgdir/usr/share/licenses/${pkgname%-git}/"
    done 
}
