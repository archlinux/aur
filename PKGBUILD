# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: rich_o <aurua@riseup.net>

pkgname=ncmpcpp-git
pkgver=0.8.2.r2.g81cb7a4f
pkgrel=1
epoch=2
pkgdesc='An almost exact clone of ncmpc with some new features (git version)'
arch=('i686' 'x86_64')
url='http://rybczak.net/ncmpcpp/'
license=('GPL')
depends=('curl' 'libmpdclient' 'taglib' 'ncurses' 'fftw' 'boost-libs')
makedepends=('git' 'boost')
provides=('ncmpcpp')
conflicts=('ncmpcpp')
source=("$pkgname"::'git+https://github.com/arybczak/ncmpcpp.git')
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "$pkgname"
    
    export BOOST_LIB_SUFFIX=''
    
    # http://site.icu-project.org/download/61#TOC-Migration-Issues
    export CPPFLAGS="${CPPFLAGS} -DU_USING_ICU_NAMESPACE=1"
    
    ./autogen.sh
    
    ./configure \
        --prefix='/usr' \
        --enable-shared='yes' \
        --enable-static='no' \
        --enable-fast-install='yes' \
        --enable-outputs \
        --enable-visualizer \
        --enable-clock \
        --enable-outputs \
        --with-fftw \
        --with-taglib
        
    make
    make -C extras
}

package() {
    cd "$pkgname"
    
    make DESTDIR="$pkgdir" install
    
    install -D -m755 extras/artist_to_albumartist -t "${pkgdir}/usr/bin"
}
