# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=autotrace
pkgver=0.31.10
pkgrel=2
pkgdesc='A program for converting bitmap to vector graphics'
arch=('x86_64')
url='https://github.com/autotrace/autotrace/'
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later')
depends=('glib2' 'imagemagick' 'libpng' 'ming' 'pstoedit')
makedepends=('intltool')
checkdepends=('procps-ng')
source=("https://github.com/autotrace/autotrace/archive/${pkgver}/autotrace-${pkgver}.tar.gz"
        '010-autotrace-fix-swf-output.patch')
sha256sums=('14627f93bb02fe14eeda0163434a7cb9b1f316c0f1727f0bdf6323a831ffe80d'
            'c0698678cb37b4a82d732f113ad4829d1b453d9db18001ffbe3044697b4852bc')

prepare() {
    cd "autotrace-${pkgver}"
    patch -Np1 -i "${srcdir}/010-autotrace-fix-swf-output.patch"
    ./autogen.sh
}

build() {
    cd "autotrace-${pkgver}"
    
    # fix build with gcc 14
    export CFLAGS+=' -Wno-incompatible-pointer-types'
    
    ./configure \
        --prefix='/usr' \
        --disable-static \
        --with-magick \
        --with-png \
        --with-pstoedit
    make
    sed -i "s|@MAGICK_LIBS@|$(pkg-config --libs ImageMagick)|" autotrace.pc
    sed -i "s|@MAGICK_CFLAGS@|$(pkg-config --cflags ImageMagick)|" autotrace.pc
}

check() {
    make -C "autotrace-${pkgver}" check
}

package() {
    make -C "autotrace-${pkgver}" DESTDIR="$pkgdir" install
}
