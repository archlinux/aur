# Maintainer: Aleksy Grabowski <hurufu@gmail.com>

pkgname=libsocket-git
pkgver=2.5.0.r25.g706649c
pkgrel=1
pkgdesc='Library with a C part and a C++ part making sockets usage easy and clean'
arch=('i686' 'x86_64')
url='http://dermesser.github.io/libsocket/doc/'
license=('BSD-2-Clause')

makedepends=(
    git
    cmake
)
provides=(
    libsocket
    libsocket++.so=libsocket++.so-64
    libsocket.so=libsocket.so-64
)
conflicts=(
    libsocket
)

source=(
    'git+https://github.com/dermesser/libsocket.git'
)
md5sums=(
    'SKIP'
)

pkgver() {
    git -C "$srcdir/libsocket" describe | awk -F - '{ print substr($1,2)".r"$2"."$3 }'
}

build() {
    mkdir -p libsocket/build
    cd libsocket/build
    cmake \
        -Wno-dev \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_STATIC_LIBS=ON \
        ..
    make
}

package() {
    make -C libsocket/build DESTDIR="$pkgdir" install
    install -Dm644 "$srcdir/libsocket/LICENSE" "$pkgdir/usr/share/licenses/libsocket/LICENSE"
    mkdir -p "$pkgdir/usr/share/doc/libsocket"
    cp -rt "$pkgdir/usr/share/doc/libsocket" "$srcdir"/libsocket/examples*
}
