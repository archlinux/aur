# Maintainer: Maxim Kolesnikov <indev.src at gmail dot com>
pkgname=ppconsul
pkgver=0.2.3
pkgrel=1
pkgdesc="C++ client for Consul"
arch=('any')
url="https://github.com/oliora/ppconsul"
license=('Boost')
depends=('curl>7.00')
makedepends=('boost>1.55' 'cmake' 'git')
source=("${pkgname}::git+${url}#tag=v${pkgver}"
        "soversion.patch")
sha256sums=('SKIP'
            '481ec8de3ac3c80bc323b9dfea05d7d5564dca72c783a41812daefa817fe10d8')

prepare() {
    cd "$pkgname"
    patch --forward --strip=1 --input="${srcdir}/soversion.patch"
}

build() {
    cmake -S"${pkgname}" -Bbuild \
        -DBUILD_TESTS=OFF \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "${srcdir}/build"
    DESTDIR="${pkgdir}" cmake --build . --target install
}
