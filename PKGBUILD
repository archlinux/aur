# Maintainer: open62541 Team <open62541-core@googlegroups.com>
# Maintainer: Samega7Cattac <sameg7acattac@gmail.com>
branch=1.3
pkgname=open62541
pkgver=v1.3_r11_g237ca65b7
pkgrel=1
pkgdesc="An open source and free implementation of OPC Unified Architecture written in the common subset of the C99 and C++98 languages."
arch=('any')
url="http://open62541.org/"
license=('MPL2')
makedepends=('cmake'
             'git')
optdepends=('openssl: OpenSSL encryption backend (set UA_ENABLE_ENCRYPTION=OPENSSL on environment variable OPEN62541_CMAKE_FLAGS)'
            'mbedtls: mbed TLS encryption backend (set UA_ENABLE_ENCRYPTION=MBEDTLS on environment variable OPEN62541_CMAKE_FLAGS)')
source=("git+https://github.com/open62541/open62541.git#branch=$branch")
md5sums=('SKIP')
sha256sums=('SKIP')

prepare() {
    # Install the libraries to lib instead of lib64
    # Install to /usr/ instead of /usr/local/
    OPEN62541_CMAKE_FLAGS_DEFAULT=\
"-DBUILD_SHARED_LIBS=ON"\
" -DUA_NAMESPACE_ZERO=FULL"\
" -DUA_ENABLE_AMALGAMATION=OFF"\
" -DCMAKE_BUILD_TYPE=RelWithDebInfo"\
" -DCMAKE_INSTALL_PREFIX=$pkgdir/usr/"\
" -DCMAKE_INSTALL_LIBDIR=$pkgdir/usr/lib/"

    # OPEN62541_CMAKE_FLAGS is an environment variable which can be
    # set in order to specify custom compilation flags for open62541.
    # This allows integrating further features. Please review the wiki
    # for more information.

    OPEN62541_CMAKE_FLAGS="$OPEN62541_CMAKE_FLAGS_DEFAULT $OPEN62541_CMAKE_FLAGS"

    cd "$srcdir/$pkgname"
    git submodule init
    git config submodule.UA-Nodeset.url "$srcdir/UA-Nodeset"
    git config submodule.mdnsd "$srcdir/mdnsd"
    git submodule update
}

pkgver() {
     cd "$srcdir/$pkgname"
     git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/_/g'
}

build() {
    cd "$srcdir/$pkgname"

    mkdir -p build
    cd build

    cmake $OPEN62541_CMAKE_FLAGS ..
    make
}

package() {
    cd "$srcdir/$pkgname/build"

    make install
    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
