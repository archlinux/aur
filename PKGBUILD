# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=zcash
pkgver=1.0.8_1
pkgrel=1
pkgdesc='Permissionless financial system employing zero-knowledge security'
arch=('x86_64')
url='https://z.cash/'
license=('MIT')
depends=('boost-libs' 'libevent' 'miniupnpc' 'zeromq')
makedepends=('boost' 'cargo' 'wget')
checkdepends=('python' 'python2' 'python2-pyzmq')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zcash/zcash/archive/v1.0.8-1.tar.gz"
        "boost-no-mt-suffix.patch"
        "use-system-libraries.patch"
        "use-system-rust.patch")
sha256sums=('dce487b2f31e25952c7663c8ebc4379fd7ecfc5c88ebadc7137f6365360e8270'
            'c318e12a9d48a50cf254d2a58c24dd0cbbf1dc969e3afeecadd0756425ea5b07'
            'ef8ab26635bb2608f03ddf991da3581060670161938171fa2e413758fa4bad3f'
            '065cd418ca7be72018c7fdada3012872bd079a254a95560312514594381b8028')

prepare() {
    # cd ${pkgname}-${pkgver}
    cd ${pkgname}-1.0.8-1

    patch -Np1 -i ../boost-no-mt-suffix.patch
    patch -Np1 -i ../use-system-libraries.patch
    patch -Np1 -i ../use-system-rust.patch
}

build() {
    # cd ${pkgname}-${pkgver}
    cd ${pkgname}-1.0.8-1

    cd depends
    libs=('bdb' 'googletest' 'googlemock' 'librustzcash' 'libsnark' 'openssl')
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
    ./configure --prefix=/usr
    make
}

check() {
    # cd ${pkgname}-${pkgver}
    cd ${pkgname}-1.0.8-1

    ./qa/zcash/full-test-suite.sh

    # Run the RPC tests
    ./zcutil/fetch-params.sh
    ./qa/pull-tester/rpc-tests.sh
}

package() {
    # cd ${pkgname}-${pkgver}
    cd ${pkgname}-1.0.8-1

    make DESTDIR="${pkgdir}" install

    for ext in '-cli' '-tx' 'd'; do
        install -Dm644 contrib/bitcoin${ext}.bash-completion \
            "${pkgdir}"/usr/share/bash-completion/completions/zcash${ext}
    done

    install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
}
