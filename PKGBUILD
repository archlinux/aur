# Maintainer : Daniel Bermond < gmail-com: danielbermond >

pkgname=libtorrent-rasterbar-git
pkgver=1.2.0.r24.g30b8a06bd
pkgrel=1
pkgdesc='A C++ BitTorrent library that aims to be a good alternative to all the other implementations around (git version)'
url='https://www.rasterbar.com/products/libtorrent/'
arch=('i686' 'x86_64')
license=('BSD')
makedepends=('git' 'cmake' 'boost' 'python2' 'python2-setuptools'
             'python' 'python-setuptools')
optdepends=('boost-libs: for python bindings'
            'python2: for python2 bindings'
            'python: for python3 bindings')
provides=('libtorrent-rasterbar')
conflicts=('libtorrent-rasterbar')
source=('libtorrent-rasterbar'::'git+https://github.com/arvidn/libtorrent.git'
        'git+https://github.com/arvidn/libsimulator.git'
        'git+https://github.com/arvidn/try_signal.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
    cd libtorrent-rasterbar
    
    mkdir -p py2 py3
    
    git submodule init
    git config --local "submodule.simulation/libsimulator.url" "${srcdir}/libsimulator"
    git config --local "submodule.deps/try_signal.url" "${srcdir}/try_signal"
    git submodule update
}

pkgver() {
    cd libtorrent-rasterbar
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/_/./g;s/^libtorrent\.//'
}

_build() {
    local _pyver="$1"
    local _pylibver="$1"
    
    [ "${_pyver%%.*}" -gt '2' ] && _pylibver+='m'
    
    cd "${srcdir}/libtorrent-rasterbar/py${_pyver%%.*}"
    
    printf '%s\n' "Building for python${_pyver%%.*}..."
    
    # force C++11 mode (needed by qBittorrent)
    # https://github.com/qbittorrent/qBittorrent/issues/5265#issuecomment-220007436
    
    cmake \
        -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS} -std=c++11 -DNDEBUG=1" \
        -DCMAKE_INSTALL_LIBDIR:PATH='lib' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_SKIP_RPATH:BOOL='YES' \
        -Dbuild_examples:BOOL='ON' \
        -Dbuild_tools:BOOL='ON' \
        -Dpython-bindings:BOOL='ON' \
        -DPYTHON_EXECUTABLE:FILEPATH="/usr/bin/python${_pyver}" \
        -DPYTHON_INCLUDE_DIR:PATH="/usr/include/python${_pylibver}" \
        -DPYTHON_LIBRARY:FILEPATH="/usr/lib/libpython${_pylibver}.so" \
        -Wno-dev \
        ..
        
    make
}

build() {
    local _py2ver
    local _py3ver
    
    _py2ver="$(python2 -c 'import sys; print("%s.%s" %sys.version_info[0:2])')"
    _py3ver="$(python -c 'import sys; print("%s.%s" %sys.version_info[0:2])')"
    
    _build "$_py2ver"
    _build "$_py3ver"
}

package() {
    cd libtorrent-rasterbar
    
    make -C py2 DESTDIR="$pkgdir" install
    make -C py3 DESTDIR="$pkgdir" install
    
    # binaries
    local _binary
    cd py3/examples
    for _binary in client_test connection_tester dump_torrent make_torrent \
                   simple_client stats_counters upnp_test
    do
        install -D -m755 "${_binary}" -t "${pkgdir}/usr/bin"
    done
    cd "${srcdir}/libtorrent-rasterbar/py3/tools"
    for _binary in dht session_log_alerts
    do
        install -D -m755 "${_binary}" -t "${pkgdir}/usr/bin"
    done
    
    # license
    cd "${srcdir}/libtorrent-rasterbar"
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
