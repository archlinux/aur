# Maintainer: Guillaume Quintard <guillaume.quintard@varnish-software.com>

pkgname=vmod-cfg
pkgver=9.0.3
pkgrel=2
_srcver=9.0_21.0
_srcver="${_srcver//_/-}"
pkgdesc="Config VMOD for Varnish"
arch=('x86_64')
url="https://github.com/carlosabalde/libvmod-cfg"
license=('BSD-2-Clause')
depends=("varnish=$pkgver-$pkgrel" 'curl' 'luajit')
makedepends=('autoconf' 'automake' 'libtool' 'autoconf-archive' 'pkg-config' 'python-docutils' 'jemalloc' 'xxd')
source=("$pkgname-${_srcver}.tar.gz::https://github.com/carlosabalde/libvmod-cfg/archive/refs/tags/${_srcver}.tar.gz")
sha512sums=('21a2907fe4d864da96602fa735d8b385396bda55737eec4979b74c83697417f2c643880225c91f467f939eb5f303e013365e7be597ba2b68955cc617f64145fc')

build() {
    cd "libvmod-cfg-${_srcver}"
    ./autogen.sh
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var/lib \
        --disable-flush-jemalloc-tcache
    make
}

check() {
    cd "libvmod-cfg-${_srcver}"
    make check VERBOSE=1
}

package() {
    cd "libvmod-cfg-${_srcver}"
    make DESTDIR="$pkgdir" install
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
