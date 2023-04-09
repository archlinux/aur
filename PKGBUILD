# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: orumin <dev at orum.in>

pkgname=lib32-zvbi
_basename=zvbi
pkgver=0.2.41
pkgrel=1
pkgdesc="VBI capture and decoding library  (32-bit)"
url="http://zapping.sourceforge.net/cgi-bin/view/ZVBI/WebHome"
arch=('x86_64')
depends=('lib32-libpng' 'zvbi')
makedepends=('git' 'lib32-libx11')
license=('BSD' 'GPL2' 'LGPL2.1' 'MIT')
_tag=74016b7aef2f52f44920a04f9bcfe52ed72905d1
source=(git+https://github.com/zapping-vbi/zvbi.git#tag=${_tag})
b2sums=(SKIP)

prepare() {
  cd zvbi

  NOCONFIGURE=1 ./autogen.sh
}

pkgver() {
    cd zvbi

    git describe --tags | sed 's/^v//'
}

build() {
    cd zvbi

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    ./configure \
        --prefix=/usr \
        --sbindir=/usr/bin \
        --libdir=/usr/lib32 \
        --build=i686-pc-linux-gnu

    make
}

package() {
    cd zvbi

    make DESTDIR="${pkgdir}" install

    rm -r "${pkgdir}/usr/bin"
    rm -r "${pkgdir}/usr/include"
    rm -r "${pkgdir}/usr/share"

    install -Dm 644 COPYING.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
