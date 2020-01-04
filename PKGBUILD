# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: josephgbr <rafael.f.f1 at gmail dot com>
# Contributor: GordonGR <ntheo1979@gmail.com>

_basename=faac
pkgname=lib32-faac
pkgver=1.30
pkgrel=1
pkgdesc="An AAC audio encoder (32 bit)"
arch=(x86_64)
url="https://www.audiocoding.com/"
license=('GPL2' 'custom:FAAC')
depends=(lib32-glibc faac)
source=(${_basename}-${pkgver}.tar.gz::"https://github.com/knik0/faac/archive/${pkgver/./_}.tar.gz")
sha256sums=('adc387ce588cca16d98c03b6ec1e58f0ffd9fc6eadb00e254157d6b16203b2d2')

build() {
    cd ${_basename}-${pkgver/./_}

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    ./bootstrap

    ./configure \
        --build=i686-pc-linux-gnu \
        --prefix=/usr \
        --libdir=/usr/lib32

    make
}

package() {
    cd ${_basename}-${pkgver/./_}

    make DESTDIR="$pkgdir" install

    rm -rf "$pkgdir"/usr/{bin,include,share}

    install -Dm644 "${srcdir}"/${_basename}-${pkgver/./_}/COPYING \
     "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
