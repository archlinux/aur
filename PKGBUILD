# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=zcash
pkgver=1.0.7
pkgrel=1
pkgdesc='Permissionless financial system employing zero-knowledge security'
arch=('x86_64')
url='https://z.cash/'
license=('MIT')
depends=('boost-libs' 'miniupnpc' 'zeromq')
makedepends=('boost' 'wget')
checkdepends=('python' 'python2' 'python2-pyzmq')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zcash/zcash/archive/v${pkgver}.tar.gz"
        "boost-no-mt-suffix.patch"
        "use-system-libraries.patch")
sha256sums=('6254709ed0df4b635759158c46313206ab1d3ba6f96db0de94883223063c6ce4'
            '19c1a2f5f6623977c740322b0eb104766c72c5690fcf2bfefab956c81e80e583'
            'ef8ab26635bb2608f03ddf991da3581060670161938171fa2e413758fa4bad3f')

prepare() {
    cd ${pkgname}-${pkgver}

    patch -Np1 -i ../boost-no-mt-suffix.patch
    patch -Np1 -i ../use-system-libraries.patch
}

build() {
    cd ${pkgname}-${pkgver}

    cd depends
    libs=('bdb' 'googletest' 'googlemock' 'libsnark' 'openssl')
    for lib in "${libs[@]}"; do
        make ${lib}
    done
    for lib in "${libs[@]}"; do
        tar -xzf built/x86_64-unknown-linux-gnu/${lib}/${lib}-*.tar.gz \
            -C x86_64-unknown-linux-gnu
    done
    cd ..

    CPPFLAGS="${CPPFLAGS} -I$PWD/depends/x86_64-unknown-linux-gnu/include"
    LDFLAGS="${LDFLAGS} -L${PWD}/depends/x86_64-unknown-linux-gnu/lib"

    ./autogen.sh
    ./configure --prefix=/usr --with-gui=no
    make
}

check() {
    cd ${pkgname}-${pkgver}

    ./qa/zcash/full-test-suite.sh

    # Run the RPC tests
    ./zcutil/fetch-params.sh
    ./qa/pull-tester/rpc-tests.sh
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
