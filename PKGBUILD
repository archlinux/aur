# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# pstoedit compiled without ImageMagick dependency

_srcname=pstoedit
pkgname=pstoedit-nomagick
pkgver=3.71
pkgrel=1
pkgdesc='Translates PS/PDF graphics to other vector formats (no ImageMagick dependency)'
arch=('i686' 'x86_64')
url='http://www.pstoedit.net/'
license=('GPL')
depends=('gcc-libs' 'gd' 'ming' 'libzip' 'plotutils' 'ghostscript' 'libemf')
provides=('pstoedit' 'libpstoedit.so')
conflicts=('pstoedit')
source=("https://sourceforge.net/projects/pstoedit/files/pstoedit/${pkgver}/${_srcname}-${pkgver}.tar.gz"
        '02-errors-to-stderr.patch'
        '04-fix-obsolete-LIBPNG_LDFLAGS.patch')
sha256sums=('0589cd22cd9c23dee12d9bc9f26760f872185d8a1fb72a05bc58f6b824cfbc95'
            '3ab9c962cb70744f984083755eafcf6e62b3b603ad060b5a078bcc3bda389448'
            'c5a3fd24ff4d57ac7106ee4f9f19e0fb1cd94cbaf7ad53a8ff979bcfe7173139')

prepare() {
    cd "${_srcname}-${pkgver}"
    
    patch -Np1 -i "${srcdir}/02-errors-to-stderr.patch"
    patch -Np1 -i "${srcdir}/04-fix-obsolete-LIBPNG_LDFLAGS.patch"
}

build() {
    cd "${_srcname}-${pkgver}"
    
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

package() {
    cd "${_srcname}-${pkgver}"
    
    make DESTDIR="$pkgdir" install
}
