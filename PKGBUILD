# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=zcash
pkgver=1.0.4
pkgrel=1
pkgdesc='Permissionless financial system employing zero-knowledge security'
arch=('x86_64')
url='https://z.cash/'
license=('MIT')
depends=('bash' 'boost-libs' 'gmp' 'libsodium')
makedepends=('boost' 'wget')
checkdepends=('python' 'python2')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zcash/zcash/archive/v${pkgver}.tar.gz"
        "boost-no-mt-suffix.patch"
        "use-system-libraries.patch")
sha256sums=('18df95b1958e71c9dc773b4d3953df2b6d7b5fbfcd2677be1190c9e03eff5d44'
            '3476e5fc227ada40cfbd126fc2c4d85a0951163dc57d92c294b0716f6030b774'
            '4a386d9f407b589fd2df9dd9ba0ddf99def2f9bb88fac4ec602fa29af317fc0d')

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
