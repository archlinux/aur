# $Id$
# Maintainer: A Dubinsky <adubinsky@almson.net>
# Contributor: Nicola Squartini <tensor5@gmail.com>

pkgname=zencash
pkgver=2.0.10
_pkgname=zen
_commit=5ceedb5c8f9eb663add5f15bf5d2a49405641c19
pkgrel=1
pkgdesc='The zencash cryptocurrency daemon and tools.'
arch=('x86_64')
url='https://zensystem.io/'
license=('MIT')
conflicts=('zcash') # because of libzcashconsensus.so
depends=('boost-libs' 'libevent' 'miniupnpc' 'zeromq')
makedepends=('boost' 'cargo' 'cmake' 'git' 'python' 'wget')
# checkdepends=('python' 'python2' 'python2-pyzmq')
source=("git+https://github.com/ZencashOfficial/zen.git#commit=${_commit}"
        "boost-no-mt-suffix.patch"
        "use-system-libraries.patch"
        "use-system-rust.patch")
sha256sums=('SKIP'
            'a2ac906ac99757adaa7d5eb7e68d2a64c3d628e71c03264c31edcbb500990569'
            'ef8ab26635bb2608f03ddf991da3581060670161938171fa2e413758fa4bad3f'
            '065cd418ca7be72018c7fdada3012872bd079a254a95560312514594381b8028')

prepare() {
    cd ${_pkgname}

    # Set gitattributes on src/clientversion.cpp
    mkdir ../${pkgname}-${pkgver}
    git archive ${_commit} | tar -xC ../${pkgname}-${pkgver}
    cd ../${pkgname}-${pkgver}

    patch -Np1 -i ../boost-no-mt-suffix.patch
    patch -Np1 -i ../use-system-libraries.patch
    patch -Np1 -i ../use-system-rust.patch
}

build() {
    cd ${pkgname}-${pkgver}

    cd depends
    libs=('bdb' 'googletest' 'googlemock' 'librustzcash' 'libsnark')
    for lib in "${libs[@]}"; do
        make ${lib}
    done
    for lib in "${libs[@]}"; do
        tar -xzf built/x86_64-unknown-linux-gnu/${lib}/${lib}-*.tar.gz \
            -C x86_64-unknown-linux-gnu
    done
    cd ..

    CPPFLAGS="${CPPFLAGS} -I$PWD/depends/x86_64-unknown-linux-gnu/include"
    LDFLAGS="${LDFLAGS} -L${PWD}/depends/x86_64-unknown-linux-gnu/lib -L${PWD}/depends/x86_64-unknown-linux-gnu/lib64"

    ./autogen.sh
    ./configure --prefix=/usr
    make
}

check() {
    cd ${pkgname}-${pkgver}

    # ./qa/zcash/full-test-suite.sh

    # Run the RPC tests
    # ./zcutil/fetch-params.sh
    # ./qa/pull-tester/rpc-tests.sh
}

package() {
    cd ${pkgname}-${pkgver}

    make DESTDIR="${pkgdir}" install

    for ext in '-cli' '-tx' 'd'; do
        sed -i s/zcash/zen/g contrib/bitcoin${ext}.bash-completion
        install -Dm644 contrib/bitcoin${ext}.bash-completion \
            "${pkgdir}"/usr/share/bash-completion/completions/zen${ext}
    done

    rename zcash zen "${pkgdir}"/usr/share/man/man1/*

    install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
}
