# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=torrentzip-svn
pkgver=0.9.r9
pkgrel=1
pkgdesc='Create identical zip archives over multiple systems (svn version)'
arch=('x86_64')
url='https://sourceforge.net/projects/trrntzip/'
license=('GPL')
depends=('zlib')
optdepends=('python2: for purgecruft utility')
makedepends=('subversion' 'dos2unix')
provides=('torrentzip')
conflicts=('torrentzip')
source=('torrentzip'::'svn+https://svn.code.sf.net/p/trrntzip/code/'
        'torrentzip-svn-fix-comment.patch')
sha256sums=('SKIP'
            'e5ebb5a77a57bd852c2697c9ea8f451844170f0764710e5850d6c8afef739f4c')

prepare() {
    cd torrentzip
    
    patch --binary -Np1 -i "${srcdir}/torrentzip-svn-fix-comment.patch"
    
    chmod a+x autogen.sh
    dos2unix autogen.sh
    ./autogen.sh
}

pkgver() {
    cd torrentzip
    
    # subversion
    printf '%s.%s' \
        "$(grep '#define[[:space:]]TZ_VERSION' ./src/trrntzip.c | awk '{ gsub("\042", "", $3); print $3 }' | tr -d '\r')" \
        "$(printf 'r%s' "$(svnversion | tr -d 'A-z')")"
        
}

build() {
    cd torrentzip
    
    ./configure --prefix='/usr'
    
    make
}

check() {
    cd torrentzip
    
    make check
}

package() {
    cd torrentzip
    
    make DESTDIR="$pkgdir" install
    
    ln -s trrntzip "${pkgdir}/usr/bin/torrentzip"
    
    install -D -m755 util/purgecruft.py -t "${pkgdir}/usr/bin"
    dos2unix "${pkgdir}/usr/bin/purgecruft.py"
    sed -i '1s/$/2/' "${pkgdir}/usr/bin/purgecruft.py"
}
