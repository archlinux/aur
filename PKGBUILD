# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: orumin <dev@orum.in>

_basename=libsrtp
pkgname=lib32-libsrtp
pkgver=2.7.0
pkgrel=1
epoch=1
pkgdesc="Library for SRTP (Secure Realtime Transport Protocol) (32-bit)"
url="https://github.com/cisco/libsrtp"
arch=(x86_64)
license=(BSD-3-Clause)
depends=(
    lib32-glibc
    lib32-nss
    libsrtp
)
makedepends=(
    git
    lib32-libpcap
    meson
)
checkdepends=(procps-ng)
source=("git+https://github.com/cisco/libsrtp#tag=v$pkgver")
b2sums=('4e72d8ddb6ff1056331377001b575e59973acf27ac8fcdfe5d08e4f44f3702012e8af7da9970de3a0e4643aa1139fcce4af3df3c31258ac8c5b35420b67aa9dd')

prepare() {
    cd $_basename
}

build() {
    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG='/usr/bin/i686-pc-linux-gnu-pkg-config'

    local meson_options=(
        --libdir=lib32 \
        -D crypto-library=nss \
        -D crypto-library-kdf=disabled \
        -D doc=disabled
    )

    arch-meson libsrtp build "${meson_options[@]}"

    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
    meson install -C build --destdir "$pkgdir"

    install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 "$_basename/LICENSE"

    cd "$pkgdir"/usr

    rm -r include
}
