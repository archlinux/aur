# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=pstoedit-nomagick
pkgver=4.00
pkgrel=1
pkgdesc='Translates PS/PDF graphics to other vector formats (no ImageMagick dependency)'
arch=('x86_64')
url='http://www.pstoedit.net/'
license=('GPL')
depends=('gd' 'ghostscript' 'ming' 'libemf' 'libzip' 'plotutils' 'zlib')
provides=('pstoedit')
conflicts=('pstoedit')
source=("https://sourceforge.net/projects/pstoedit/files/pstoedit/${pkgver}/pstoedit-${pkgver}.tar.gz"
        '010-pstoedit-fix-plain-c.patch'
        '020-pstoedit-fix-pkgconfig-includedir.patch')
sha256sums=('075a7daeaba75f3d1922beae680cc3662bb373c7e3826282229fda2733ac62ea'
            'ee60574e10d04e723d6b06ef33de45911e7515846182bb66ac56078dde3bace9'
            '1ad78e582d0f287f9a9ef545bb27fb50f0ef791ce539a73644a68ad3228a6267')

prepare() {
    patch -d "pstoedit-${pkgver}" -Np1 -i "${srcdir}/010-pstoedit-fix-plain-c.patch"
    patch -d "pstoedit-${pkgver}" -Np1 -i "${srcdir}/020-pstoedit-fix-pkgconfig-includedir.patch"
}

build() {
    cd "pstoedit-${pkgver}"
    ./configure \
        --prefix='/usr'\
        --enable-static='no' \
        --enable-shared='yes' \
        --with-emf \
        --without-magick \
        --with-libplot \
        --with-swf \
        --with-pptx
    make
}

check() {
    make -C "pstoedit-${pkgver}" check
}

package() {
    make -C "pstoedit-${pkgver}" DESTDIR="$pkgdir" install
}
