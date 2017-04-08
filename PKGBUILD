# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# pstoedit compiled without ImageMagick dependency

_srcname="pstoedit"
pkgname=pstoedit-nomagick
pkgver=3.70
pkgrel=5
pkgdesc="Translates PS/PDF graphics to other vector formats (no ImageMagick dependency)"
arch=('i686' 'x86_64')
url="http://www.pstoedit.net/"
license=('GPL2')
depends=('gd' 'ming' 'libzip' 'plotutils' 'ghostscript' 'libemf')
provides=('pstoedit' 'libpstoedit.so')
conflicts=('pstoedit')
source=("https://sourceforge.net/projects/pstoedit/files/pstoedit/${pkgver}/${_srcname}-${pkgver}.tar.gz"
        "02-errors-to-stderr.patch"
        "04-fix-obsolete-LIBPNG_LDFLAGS.patch"
        "05-fix-plugin-loading.patch"
)
sha256sums=('06b86113f7847cbcfd4e0623921a8763143bbcaef9f9098e6def650d1ff8138c'
            '66cd2bd3f92aa4ba57c916f721acd8c42c07fffea5fbc81f075853dab845d6d8'
            '3320bbcf6ba33d70213897f41c31c158d4bb4284e17b061ed8d1c38c1ee5a8b8'
            'edec8010f6f05126047ce8f9facf1c36a2c0480a0bac14469b8ffb31a7722625')

prepare() {
    cd "${_srcname}-${pkgver}"
    patch -Np1 -i ../02-errors-to-stderr.patch
    patch -Np1 -i ../04-fix-obsolete-LIBPNG_LDFLAGS.patch
    patch -Np1 -i ../05-fix-plugin-loading.patch
}

build() {
    cd "${_srcname}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --enable-static=no \
        --enable-shared=yes \
        --with-emf \
        --without-magick \
        --with-libplot \
        --with-swf \
        --with-pptx
    make
}

package() {
    cd "${_srcname}-${pkgver}"
    make DESTDIR="$pkgdir" install
}
