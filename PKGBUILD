# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libtorrent-rasterbar-git
pkgver=2.0.11.r529.g9eaa8522c
pkgrel=1
pkgdesc='An efficient and feature complete C++ BitTorrent library implementation (git version)'
url='https://www.rasterbar.com/products/libtorrent/'
arch=('x86_64')
license=('BSD-3-Clause')
depends=('openssl')
optdepends=(
    'boost-libs: for python bindings'
    'python: for python bindings')
makedepends=(
    'boost'
    'cmake'
    'git'
    'python-setuptools')
provides=('libtorrent-rasterbar')
conflicts=('libtorrent-rasterbar')
source=('libtorrent-rasterbar'::'git+https://github.com/arvidn/libtorrent.git#branch=master'
        'git+https://github.com/arvidn/try_signal.git'
        'git+https://github.com/paullouisageneau/libdatachannel.git'
        'json-vinniefalco'::'git+https://github.com/vinniefalco/json.git'
        '010-libtorrent-rasterbar-fix-for-fortify-source-3.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '609de12e3a562ff8d78371f7b22d056c07cfbf5d7090234b465193d5f189eedc')

prepare() {
    git -C libtorrent-rasterbar submodule init
    git -C libtorrent-rasterbar config --local submodule.simulation/libsimulator.update none
    git -C libtorrent-rasterbar config --local submodule.deps/try_signal.url "${srcdir}/try_signal"
    git -C libtorrent-rasterbar config --local submodule.deps/asio-gnutls.update none
    git -C libtorrent-rasterbar config --local submodule.deps/libdatachannel.url "${srcdir}/libdatachannel"
    git -C libtorrent-rasterbar config --local submodule.deps/json.url "${srcdir}/json-vinniefalco"
    git -C libtorrent-rasterbar -c protocol.file.allow='always' submodule update
    
    # https://github.com/arvidn/libtorrent/issues/7519
    # remove usage of malloc_usable_size() for _FORTIFY_SOURCE=3 compatibility
    patch -d libtorrent-rasterbar -Np1 -i "${srcdir}/010-libtorrent-rasterbar-fix-for-fortify-source-3.patch"
}

pkgver() {
    git -C libtorrent-rasterbar describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/_/./g;s/^libtorrent.//;s/^v//'
}

build() {
    export CFLAGS+=' -DNDEBUG'
    export CXXFLAGS+=' -DNDEBUG'
    cmake -B build -S libtorrent-rasterbar \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Dboost-python-module-name:STRING='python' \
        -Dpython-bindings:BOOL='ON' \
        -Dpython-egg-info:BOOL='ON' \
        -Wno-dev
    cmake --build build
}

package() {
    make -C build DESTDIR="$pkgdir" install
    install -D -m644 libtorrent-rasterbar/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
