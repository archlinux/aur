# $Id$
# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=mingw-w64-unixodbc
pkgver=2.3.7
pkgrel=1
pkgdesc="ODBC is an open specification for providing application developers with a predictable API with which to access Data Sources (mingw-w64)"
arch=('any')
license=('GPL2' 'LGPL2.1')
url="http://www.unixodbc.org/"
backup=('usr/i686-w64-mingw32/etc/odbc.ini' 'usr/i686-w64-mingw32/etc/odbcinst.ini'
    'usr/x86_64-w64-mingw32/etc/odbc.ini' 'usr/x86_64-w64-mingw32/etc/odbcinst.ini')
depends=('mingw-w64-readline' 'mingw-w64-libtool')
makedepends=('mingw-w64-configure')
source=(ftp://ftp.unixodbc.org/pub/unixODBC/unixODBC-$pkgver.tar.gz)
md5sums=('274a711b0c77394e052db6493840c6f9')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
    cd unixODBC-${pkgver}
    for _arch in ${_architectures}; do
        mkdir -p build-${_arch} && pushd build-${_arch}
        ${_arch}-configure ..
        make
        popd
    done
}

check() {
    for _arch in ${_architectures}; do
        cd "${srcdir}/unixODBC-$pkgver/build-${_arch}"
        make -k check
    done
}

package() {
    for _arch in ${_architectures}; do
        cd "${srcdir}/unixODBC-$pkgver/build-${_arch}"
        make DESTDIR="${pkgdir}" install
        touch "$pkgdir"/usr/${_arch}/etc/{odbc,odbcinst}.ini
        
	rm "$pkgdir"/usr/${_arch}/include/{odbcinst,sql,sqlext,sqltypes,sqlucode}.h
	${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
        ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    done
}
