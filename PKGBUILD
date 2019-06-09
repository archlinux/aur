# Maintainer: Daniel Bermond < gmail-com: danielbermond >

_srcname=autotrace
pkgname=autotrace-nomagick
pkgver=0.31.1
pkgrel=8
pkgdesc='A program for converting bitmap to vector graphics (no ImageMagick dependency)'
arch=('x86_64')
url='http://autotrace.sourceforge.net/'
license=('GPL' 'LGPL')
depends=('libpng' 'ming' 'pstoedit-nomagick')
provides=('autotrace')
conflicts=('autotrace')
source=("http://sourceforge.net/projects/autotrace/files/AutoTrace/${pkgver}/${_srcname}-${pkgver}.tar.gz"
        'autotrace-0.31.1-CVE-2013-1953.patch'
        'autotrace-0.31.1-CVE-2016-7392.patch'
        'autotrace-0.31.1-libpng-1.5.patch'
        'autotrace-0.31.1-pstoedit-detection-fix.patch'
        'autotrace-0.31.1-swf-output.patch'
        'autotrace-0002-Fixed-underquoted-AM_PATH_AUTOTRACE-definition.patch')
sha256sums=('5a1a923c3335dfd7cbcccb2bbd4cc3d68cafe7713686a2f46a1591ed8a92aff6'
            'abf827ece23ace1074ca9408e52b0e9d3a3c24a25bc35ebdf25f46edad29a961'
            '2b997a9647250c3e1be2cd03d0bb4d8ac7b2788ca9af7bc901e40d187848c254'
            '3e6140014ba1c3d3bb4bd2474a3f95c148ee68192b5c22ab7f6928761d3e4eba'
            '962f9968b95321c2238e9a7aa59106b74c7345d860fe987038e48997381e7a7a'
            'd4089185e2a89d75a897012cde91bd88953914cc52ce545999999114da2cb485'
            '666193c7b9d8d085de6c774d90262f9df2f5f2f75a4acdc7ae2167b4fc179bad')

prepare() {
    cd "${_srcname}-${pkgver}"
    
    patch -Np1 -i "${srcdir}/autotrace-0.31.1-CVE-2013-1953.patch"
    patch -Np1 -i "${srcdir}/autotrace-0.31.1-CVE-2016-7392.patch"
    patch -Np0 -i "${srcdir}/autotrace-0.31.1-libpng-1.5.patch"
    patch -Np1 -i "${srcdir}/autotrace-0.31.1-pstoedit-detection-fix.patch"
    patch -Np0 -i "${srcdir}/autotrace-0.31.1-swf-output.patch"
    patch -Np1 -i "${srcdir}/autotrace-0002-Fixed-underquoted-AM_PATH_AUTOTRACE-definition.patch"
    
    autoreconf -fis
}

build() {
    cd "${_srcname}-${pkgver}"
    
    ./configure \
        --prefix='/usr' \
        --mandir='/usr/share' \
        --enable-static='no' \
        --enable-shared='yes' \
        --without-magick \
        --with-pstoedit
        
    make
}

package() {
    cd "${_srcname}-${pkgver}"
    
    make DESTDIR="$pkgdir" install
}
