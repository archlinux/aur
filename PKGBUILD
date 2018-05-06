# Maintainer: Ernesto Castellotti <erny.castel@gmail.com>

_pkgname=protobuf
pkgname=lib32-lib${_pkgname}
_pkgver=3.5.2
pkgver=v${_pkgver}
pkgrel=2
pkgdesc="A language-neutral, platform-neutral extensible mechanism for 
serializing structured data."
url="https://developers.google.com/protocol-buffers/"
license=('custom')
arch=('x86_64')
depends=('lib32-zlib' 'lib32-gcc-libs')
makedepends=('gcc-multilib' 'curl' 'unzip')
source=("https://github.com/google/${_pkgname}/archive/v${_pkgver}.zip")
sha256sums=('7404d040865a031e80c2810cd9453eafefb2bbbf5f5f9a282b1d071d8e12c4bf')

build() {
    cd "${srcdir}/${_pkgname}-${_pkgver}"

    ./autogen.sh
    #autoreconf -i
    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
    ./configure --build=i386-pc-linux-gnu CFLAGS="-m32 -DNDEBUG" CXXFLAGS="-m32 -DNDEBUG" LDFLAGS=-m32 --prefix=/usr --libdir=/usr/lib32
    make -j4
}

package() {
    cd "${srcdir}/${_pkgname}-${_pkgver}"

    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir/usr/bin/"
    rm -r "$pkgdir/usr/include"
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
