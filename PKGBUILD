# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=autotrace-nomagick
_date=20200219
_build=65
pkgver="0.40.0.${_date}.${_build}"
pkgrel=1
pkgdesc='A program for converting bitmap to vector graphics (no ImageMagick dependency)'
arch=('x86_64')
url='https://github.com/autotrace/autotrace/'
license=('GPL' 'LGPL')
depends=('glib2' 'libpng' 'ming' 'pstoedit-nomagick')
makedepends=('intltool')
provides=('autotrace')
conflicts=('autotrace')
source=("autotrace-${pkgver}.tar.gz"::"https://github.com/autotrace/autotrace/archive/travis-${_date}.${_build}.tar.gz"
        '010-autotrace-fix-swf-output.patch')
sha256sums=('74ca2555aff1a968290f13602a90f836872e08d37ecaf80c5296ad223f6cd69a'
            'd4089185e2a89d75a897012cde91bd88953914cc52ce545999999114da2cb485')

prepare() {
    cd "autotrace-travis-${_date}.${_build}"
    patch -d src -Np0 -i "${srcdir}/010-autotrace-fix-swf-output.patch"
    ./autogen.sh
}

build() {
    cd "autotrace-travis-${_date}.${_build}"
    ./configure \
        --prefix='/usr' \
        --disable-static \
        --without-magick \
        --with-png \
        --with-pstoedit
    make
}

check() {
    make -C "autotrace-travis-${_date}.${_build}" check
}

package() {
    make -C "autotrace-travis-${_date}.${_build}" DESTDIR="$pkgdir" install
}
