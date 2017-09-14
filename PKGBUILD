# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=zcash
pkgver=1.0.11
_commit=02dd675a2554db6c5af188ec2d70fb60e748300c
pkgrel=2
pkgdesc='Permissionless financial system employing zero-knowledge security'
arch=('x86_64')
url='https://z.cash/'
license=('MIT')
depends=('boost-libs' 'libevent' 'zeromq')
makedepends=('boost' 'cargo' 'cmake' 'git' 'python' 'wget')
checkdepends=('python' 'python2' 'python2-pyzmq')
source=("git+https://github.com/zcash/zcash.git#commit=${_commit}"
        "boost-no-mt-suffix.patch"
        "use-system-libraries.patch"
        "use-system-rust.patch")
sha256sums=('SKIP'
            '15389fe2741b8641d39b9fc0cd155e919d09e6d9317b79d0f4f1bcefb798766c'
            'ef8ab26635bb2608f03ddf991da3581060670161938171fa2e413758fa4bad3f'
            '065cd418ca7be72018c7fdada3012872bd079a254a95560312514594381b8028')

prepare() {
    cd ${pkgname}

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
    libs=('bdb' 'googletest' 'googlemock' 'librustzcash' 'libsnark' 'proton')
    for lib in "${libs[@]}"; do
        make ${lib}
    done
    for lib in "${libs[@]}"; do
        tar -xzf built/${CARCH}-unknown-linux-gnu/${lib}/${lib}-*.tar.gz \
            -C ${CARCH}-unknown-linux-gnu
    done
    cd ..

    CPPFLAGS="${CPPFLAGS} -I$PWD/depends/${CARCH}-unknown-linux-gnu/include"
    LDFLAGS="${LDFLAGS} -L${PWD}/depends/${CARCH}-unknown-linux-gnu/lib -L${PWD}/depends/x86_64-unknown-linux-gnu/lib64"

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
        install -Dm644 contrib/bitcoin${ext}.bash-completion \
            "${pkgdir}"/usr/share/bash-completion/completions/zcash${ext}
    done

    install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
}
