# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=autotrace-nomagick
pkgver=0.31.9
pkgrel=1
epoch=1
pkgdesc='A program for converting bitmap to vector graphics (no ImageMagick dependency)'
arch=('x86_64')
url='https://github.com/autotrace/autotrace/'
license=('GPL' 'LGPL')
depends=('glib2' 'libpng' 'ming' 'pstoedit-nomagick')
makedepends=('intltool')
#checkdepends=('procps-ng')
provides=('autotrace')
conflicts=('autotrace')
BUILDENV+=('!check') # tests currently needs imagemagick for working
source=("https://github.com/autotrace/autotrace/archive/${pkgver}/autotrace-${pkgver}.tar.gz"
        '010-autotrace-fix-swf-output.patch')
sha256sums=('670d43797b37e067e0317e90e2c05eedeeb8ab630cf794c2abc1079a84120a68'
            'c0698678cb37b4a82d732f113ad4829d1b453d9db18001ffbe3044697b4852bc')

prepare() {
    cd "autotrace-${pkgver}"
    patch -Np1 -i "${srcdir}/010-autotrace-fix-swf-output.patch"
    ./autogen.sh
}

build() {
    cd "autotrace-${pkgver}"
    ./configure \
        --prefix='/usr' \
        --disable-static \
        --without-magick \
        --with-png \
        --with-pstoedit
    make
}

check() {
    make -C "autotrace-${pkgver}" check
}

package() {
    make -C "autotrace-${pkgver}" DESTDIR="$pkgdir" install
}
