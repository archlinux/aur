# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: josephgbr <rafael.f.f1 at gmail dot com>
# Contributor: escoand <passtschu at freenet.de>

_basename=faad2
pkgname=lib32-faad2
pkgver=2.10.1
pkgrel=1
pkgdesc="Freeware Advanced Audio (AAC) Decoder"
arch=('x86_64')
url="https://github.com/knik0/faad2"
license=('GPL2')
depends=('lib32-glibc' 'faad2')
source=($_basename-$pkgver.tar.gz::https://github.com/knik0/faad2/archive/$pkgver.tar.gz)
sha512sums=('8df69278350c68dd770c4bc482e42bc95eb04cd784eeea3f3fc58d615833c8b07dc3c72029bb7e5bfed612b7c1b8daefc9cb57be9789befb587120ef115e55b3')
b2sums=('f25bf9242675250b910bd5540487cf708d6e195e1ddca0b27588678e5fbf2bedf9d41e6bc607aa34bb2dbff95a8a4071e74e2f9bd9493ccb7ef040ce9bf81b4c')

prepare() {
    cd $_basename-$pkgver

    autoreconf -vfi
}

build() {
    cd $_basename-$pkgver

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    ./configure \
        --build=i686-pc-linux-gnu \
        --prefix=/usr \
        --libdir=/usr/lib32

    make
}

check() {
    make -k check -C $_basename-$pkgver
}

package() {
    cd $_basename-$pkgver

    make DESTDIR="$pkgdir" install

    rm -rf "${pkgdir}/usr"/{bin,include,share}

    install -vDm 644 {AUTHORS,ChangeLog,NEWS,README*,TODO} -t "$pkgdir/usr/share/doc/$pkgname/"
}
