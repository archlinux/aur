# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: rich_o <aurua@riseup.net>

pkgname=ncmpcpp-git
_srcname=ncmpcpp
pkgver=0.8.2.r2.g81cb7a4f
pkgrel=2
epoch=2
pkgdesc='An almost exact clone of ncmpc with some new features (git version)'
arch=('i686' 'x86_64')
url='https://rybczak.net/ncmpcpp/'
license=('GPL')
depends=('curl' 'libmpdclient' 'taglib' 'ncurses' 'fftw' 'boost-libs')
makedepends=('git' 'boost')
provides=('ncmpcpp')
conflicts=('ncmpcpp')
source=('git+https://github.com/arybczak/ncmpcpp.git'
        'ncmpcpp-git-add-full-relro.patch')
sha256sums=('SKIP'
            '737f057f043b2cdc172c509797ee4ee441b69247e60a344544476cee59290d71')

prepare() {
    cd "$_srcname"
    
    patch -Np1 -i "${srcdir}/ncmpcpp-git-add-full-relro.patch"
    
    ./autogen.sh
}

pkgver() {
    cd "$_srcname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "$_srcname"
    
    export BOOST_LIB_SUFFIX=''
    
    # http://site.icu-project.org/download/61#TOC-Migration-Issues
    export CPPFLAGS="${CPPFLAGS} -DU_USING_ICU_NAMESPACE=1"
    
    ./configure \
        --prefix='/usr' \
        --enable-clock \
        --enable-outputs \
        --enable-visualizer \
        --with-fftw \
        --with-taglib
        
    make
    make -C extras
}

package() {
    cd "$_srcname"
    
    make DESTDIR="$pkgdir" install
    
    install -D -m755 extras/artist_to_albumartist -t "${pkgdir}/usr/bin"
}
