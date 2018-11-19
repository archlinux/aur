# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=frei0r-plugins-git
_srcname=frei0r
pkgver=1.6.1.r49.g07146e3
pkgrel=1
pkgdesc='A minimalistic plugin API for video effects (git version)'
arch=('i686' 'x86_64')
url='https://www.dyne.org/software/frei0r/'
license=('GPL')
depends=('cairo' 'gavl')
makedepends=('git' 'opencv')
optdepends=('opencv: for facebl0r and facedetect plugins')
provides=('frei0r-plugins')
conflicts=('frei0r-plugins')
source=('git+https://github.com/dyne/frei0r.git')
sha256sums=('SKIP')

prepare() {
    cd "$_srcname"
    
    ./autogen.sh
}

pkgver() {
    cd "$_srcname"
    
    printf '%s' "$(git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//')"
}

build() {
    cd "$_srcname"
    
    ./configure \
        --prefix='/usr' \
        --enable-static='no' \
        --enable-shared='yes' \
        --enable-fast-install='yes' \
        --enable-cpuflags
        
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    
    make
}

package() {
    cd "$_srcname"
    
    make DESTDIR="$pkgdir" install
}
