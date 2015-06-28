# Contributor: forest76 <forestt@poczta.onet.pl>
# Contributor: Tilman Blumenbach <tilman@ax86.net>
# Contributor: Christian Neukirchen <chneukirchen@gmail.com>

pkgname=autotrace
pkgver=0.31.1
pkgrel=12
pkgdesc='An utility to trace bitmaps: convert bitmaps to vector graphics'
arch=('i686' 'x86_64')
url='http://autotrace.sourceforge.net/'
license=('GPL' 'LGPL')
depends=('pstoedit' 'imagemagick>=6.5.3.10')
makedepends=('pkg-config' 'autoconf')
options=('!libtool')
source=(http://downloads.sourceforge.net/autotrace/$pkgname-$pkgver.tar.gz
        build-fixes.patch
        libpng-1.5.patch)

build() {
    _configure_args='--prefix=/usr'
    if [ `/usr/bin/pacman -Q pstoedit | cut -d ' ' -f 2` = '3.50-3' ]; then
        # This version of the pstoedit package is broken (FS #19221).
        warning \
            'Broken pstoedit package found, disabling pstoedit support in AutoTrace.'
        _configure_args="${_configure_args} --without-pstoedit"
    fi

    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -Np 1 -i "${srcdir}/build-fixes.patch"
    patch -Np 0 -i "${srcdir}/libpng-1.5.patch"

    autoreconf -fi
    ./configure ${_configure_args}
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make "DESTDIR=${pkgdir}" install
}

md5sums=('54eabbb38d2076ded6d271e1ee4d0783'
         '7ff7b76e3a2c722863e00e1ee4a55386'
         '55881b817aeae6b3bd6dfca9b2320ca3')
