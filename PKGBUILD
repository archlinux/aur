# Maintainer : Daniel Bermond <dbermond@archlinux.org>

pkgname=libtorrent-rasterbar-git
pkgver=2.0.7.r503.g5e9b0fabb
pkgrel=1
pkgdesc='A C++ BitTorrent library that aims to be a good alternative to all the other implementations around (git version)'
url='https://www.rasterbar.com/products/libtorrent/'
arch=('x86_64')
license=('BSD')
depends=('gcc-libs' 'openssl')
makedepends=('git' 'cmake' 'boost') # 'python' 'python-setuptools'
#optdepends=('boost-libs: for python bindings'
#            'python: for python bindings')
provides=('libtorrent-rasterbar')
conflicts=('libtorrent-rasterbar')
source=('libtorrent-rasterbar'::'git+https://github.com/arvidn/libtorrent.git#branch=master'
        'git+https://github.com/arvidn/libsimulator.git'
        'git+https://github.com/arvidn/try_signal.git'
        'git+https://github.com/paullouisageneau/boost-asio-gnutls.git'
        'git+https://github.com/paullouisageneau/libdatachannel.git'
        'json-vinniefalco'::'git+https://github.com/vinniefalco/json.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
    git -C libtorrent-rasterbar submodule init
    git -C libtorrent-rasterbar config --local submodule.simulation/libsimulator.url "${srcdir}/libsimulator"
    git -C libtorrent-rasterbar config --local submodule.deps/try_signal.url "${srcdir}/try_signal"
    git -C libtorrent-rasterbar config --local submodule.deps/asio-gnutls.url "${srcdir}/boost-asio-gnutls"
    git -C libtorrent-rasterbar config --local submodule.deps/libdatachannel.url "${srcdir}/libdatachannel"
    git -C libtorrent-rasterbar config --local submodule.deps/json.url "${srcdir}/json-vinniefalco"
    git -C libtorrent-rasterbar -c protocol.file.allow='always' submodule update
}

pkgver() {
    git -C libtorrent-rasterbar describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/_/./g;s/^libtorrent.//;s/^v//'
}

build() {
    # NOTE: needs -Dboost-python-module-name to specify the correct boost python cmake config file
    # https://github.com/arvidn/libtorrent/blob/5e9b0fabb3a4117b8848fbab5bd153dfa51bf70f/bindings/python/CMakeLists.txt#L3-L9
    
    # NOTE: python bindings fails to build at the time of the last package update, disabling it
    
    cmake -B build -S libtorrent-rasterbar \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_SKIP_RPATH:BOOL='YES' \
        -Dpython-bindings:BOOL='OFF' \
        -Dboost-python-module-name='python' \
        -Dpython-egg-info='ON' \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
    install -D -m644 libtorrent-rasterbar/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
