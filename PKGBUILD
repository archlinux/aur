# Maintainer : Daniel Bermond <dbermond@archlinux.org>

pkgname=libtorrent-rasterbar-git
pkgver=2.0.4.r297.gf0864b383
pkgrel=1
pkgdesc='A C++ BitTorrent library that aims to be a good alternative to all the other implementations around (git version)'
url='https://www.rasterbar.com/products/libtorrent/'
arch=('x86_64')
license=('BSD')
depends=('openssl')
makedepends=('git' 'cmake' 'boost' 'python' 'python-setuptools')
optdepends=('boost-libs: for python bindings'
            'python: for python bindings')
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
    git -C libtorrent-rasterbar submodule update
}

pkgver() {
    git -C libtorrent-rasterbar describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/_/./g;s/^libtorrent.//;s/^v//'
}

build() {
    # NOTE: needs -Dboost-python-module-name to specify the correct boost python cmake config file
    # https://github.com/arvidn/libtorrent/blob/f0864b3836ab82beaf819bf8cb07665a8afa9f7b/bindings/python/CMakeLists.txt#L3-L9
    
    cmake -B build -S libtorrent-rasterbar \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_SKIP_RPATH:BOOL='YES' \
        -Dpython-bindings:BOOL='ON' \
        -Dboost-python-module-name='python' \
        -Dpython-egg-info='ON' \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
    install -D -m644 libtorrent-rasterbar/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
