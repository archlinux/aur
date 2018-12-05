# Maintainer : Daniel Bermond < gmail-com: danielbermond >

pkgname=libtorrent-rasterbar-git
pkgver=1.2.RC2.r32.g3e582100d
pkgrel=1
pkgdesc='A C++ BitTorrent library that aims to be a good alternative to all the other implementations around (git version)'
url='https://www.rasterbar.com/products/libtorrent/'
arch=('i686' 'x86_64')
license=('BSD')
depends=('boost-libs')
makedepends=('git' 'boost' 'python2' 'python')
optdepends=('python2: for python2 bindings'
            'python: for python3 bindings')
provides=('libtorrent-rasterbar')
conflicts=('libtorrent-rasterbar')
source=('libtorrent-rasterbar'::'git+https://github.com/arvidn/libtorrent.git')
sha256sums=('SKIP')

prepare() {
    cd libtorrent-rasterbar
    
    mkdir -p py2 py3
    
    # avoid depending on newer processors
    sed -i 's/-msse4.2//' configure.ac
    
    ./autotool.sh
}

pkgver() {
    cd libtorrent-rasterbar
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/_/./g;s/^libtorrent\.//'
}

_build() {
    cd "${srcdir}/libtorrent-rasterbar/py${1}"
    
    printf '%s\n' "Building for python${1}..."
    
    # FS#50745
    [ "$1" -eq '2' ] && local _boost='boost_python'
    [ "$1" -eq '3' ] && local _boost='boost_python3'
    
    # force C++11 mode (needed by qBittorrent)
    # https://github.com/qbittorrent/qBittorrent/issues/5265#issuecomment-220007436
    export CXXFLAGS="${CXXFLAGS} -std=c++11"
    
    export PYTHON="/usr/bin/python${1}"
    
    ../configure \
        --prefix='/usr' \
        --enable-python-binding \
        --enable-examples \
        --disable-static \
        --with-libiconv \
        --with-boost-python="${_boost}"
        
    make
}

build() {
    _build 2
    _build 3
}

package() {
    cd libtorrent-rasterbar
    
    make -C py2 DESTDIR="$pkgdir" install
    make -C py3 DESTDIR="$pkgdir" install
    
    # license
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    # remove most example binaries
    rm "$pkgdir"/usr/bin/{*_test,*_tester,simple_client,stats_counters}
} 
