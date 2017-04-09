# Maintainer : Daniel Bermond < yahoo-com: danielbermond >

pkgname=libtorrent-rasterbar-git
pkgver=1.1.2.r975.g09274842f
pkgrel=1
pkgdesc="A C++ BitTorrent library that aims to be a good alternative to all the other implementations around (git version)"
url="http://www.rasterbar.com/products/libtorrent/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('boost-libs')
makedepends=('git' 'boost' 'python2' 'python')
optdepends=('python2: for python2 bindings'
            'python: for python3 bindings')
provides=('libtorrent-rasterbar')
conflicts=('libtorrent-rasterbar')
source=("$pkgname"::"git+https://github.com/arvidn/libtorrent.git")
# use this source line to build deluge-git AUR package:
# source=("$pkgname"::"git+https://github.com/arvidn/libtorrent.git#commit=a42d4390c")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/_/./g;s/^libtorrent\.//'
}

build() {
    cd "$pkgname"
    ./autotool.sh
    
    # force C++11 mode (needed by qBittorrent)
    # https://github.com/qbittorrent/qBittorrent/issues/5265#issuecomment-220007436
    CXXFLAGS="${CXXFLAGS} -std=c++11" \
    ./configure \
        --prefix=/usr \
        --enable-shared=yes \
        --enable-static=no \
        --enable-fast-install=yes \
        --enable-largefile \
        --enable-logging \
        --disable-debug \
        --enable-dht \
        --enable-encryption \
        --enable-deprecated-functions \
        --enable-examples \
        --disable-tests \
        --enable-python-binding \
        --with-libiconv
    make
    
    # build python2 bindings (python3 bindings are built during 'make')
    python2 setup.py build
}

package() {
    cd "$pkgname"
    
    # standard install
    make DESTDIR="$pkgdir" install
    
    # python2 bindings (python3 bindings are installed during 'make install')
    python2 setup.py install --root="$pkgdir" --optimize=1
    
    # license
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    # remove most example binaries
    rm "$pkgdir"/usr/bin/{*_test,*_tester,simple_client,stats_counters}
} 
