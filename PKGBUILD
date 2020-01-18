# Maintainer : Daniel Bermond <dbermond@archlinux.org>

pkgname=libtorrent-rasterbar-git
pkgver=1.2.3.r319.g9dfff3677
pkgrel=1
pkgdesc='A C++ BitTorrent library that aims to be a good alternative to all the other implementations around (git version)'
url='https://www.rasterbar.com/products/libtorrent/'
arch=('x86_64')
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
    git submodule init
    git config --local "submodule.simulation/libsimulator.url" "${srcdir}/libsimulator"
    git config --local "submodule.deps/try_signal.url" "${srcdir}/try_signal"
    git submodule update
}

pkgver() {
    cd libtorrent-rasterbar
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/_/./g;s/^libtorrent\.//'
}

_build_common() {
    local _pyver="$1"
    
    printf '%s\n' "Building for python${_pyver%%.*}..."
    
    # NOTE: needs -Dboost-python-module-name to specify the correct boost python cmake config file
    # https://github.com/arvidn/libtorrent/blob/9dfff3677f1a7291e03febc4724511da5b6a89b9/bindings/python/CMakeLists.txt#L1-L8
    
    cmake -B "build-py${_pyver%%.*}" -S libtorrent-rasterbar \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_SKIP_RPATH:BOOL='YES' \
        -Dbuild_examples:BOOL='ON' \
        -Dbuild_tools:BOOL='ON' \
        -Dpython-bindings:BOOL='ON' \
        -Dboost-python-module-name='python' \
        -DPYTHON_EXECUTABLE:FILEPATH="/usr/bin/python${_pyver}" \
        -DPYTHON_INCLUDE_DIR:PATH="/usr/include/python${_pyver}" \
        -DPYTHON_LIBRARY:FILEPATH="/usr/lib/libpython${_pyver}.so" \
        -Wno-dev
    make -C "build-py${_pyver%%.*}"
}

build() {
    local _py2ver
    local _pyver
    
    _py2ver="$(python2 -c 'import sys; print("%s.%s" %sys.version_info[0:2])')"
    _pyver="$(python -c 'import sys; print("%s.%s" %sys.version_info[0:2])')"
    
    _build_common "$_py2ver"
    _build_common "$_pyver"
}

package() {
    local _py2ver
    local _pyver
    
    _py2ver="$(python2 -c 'import sys; print("%s.%s" %sys.version_info[0:2])')"
    _pyver="$(python -c 'import sys; print("%s.%s" %sys.version_info[0:2])')"
    
    make -C "build-py${_py2ver%%.*}" DESTDIR="$pkgdir" install
    make -C "build-py${_pyver%%.*}" DESTDIR="$pkgdir" install
    
    # binaries
    local _bin
    while read -r -d '' _bin
    do
        install -D -m755 "$_bin" -t "${pkgdir}/usr/bin"
    done < <(find "build-py${_pyver%%.*}/examples" "build-py${_pyver%%.*}/tools" \
                 -maxdepth 1 -type f ! -name '*_test*' ! -name 'simple_client' \
                 ! -name 'stats_counters' -executable -print0)
    
    # license
    install -D -m644 libtorrent-rasterbar/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
