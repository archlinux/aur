# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=zcash
pkgver=1.0.14
_commit=1ddecf644f6bab29545bb6333889fb059eb7970e
pkgrel=1
pkgdesc='Permissionless financial system employing zero-knowledge security'
arch=('x86_64')
url='https://z.cash/'
license=('MIT')
depends=('boost-libs' 'libevent' 'zeromq')
makedepends=('boost' 'cargo' 'cmake' 'git' 'gmock' 'python' 'wget')
checkdepends=('python' 'python2' 'python2-pyzmq')
source=("git+https://github.com/zcash/zcash.git#commit=${_commit}"
        "boost-no-mt-suffix.patch"
        "use-system-rust.patch")
sha512sums=('SKIP'
            'fa9ac59839ba6c6aabefb24296ae29914acf7089487377e7948fd684e32b1b499e8e15daccd10baf968905ec69ad2da8b91ff2c8d4724412d8143428ed4de23d'
            '3663373af04318aa72d877f399f0c9e956d289ac876583e70afa2933bf4171f7441a399e043b2d29b1df6d19d29390bb69d4053cad4b75bef903a8685fcd23bf')

prepare() {
    cd ${pkgname}

    # Set gitattributes on src/clientversion.cpp
    git archive --format=tar ${_commit} -- src/clientversion.cpp | tar -xf -

    patch -Np1 -i ../boost-no-mt-suffix.patch
    patch -Np1 -i ../use-system-rust.patch
}

build() {
    cd ${pkgname}

    cd depends
    make install \
        native_packages='' \
        packages='bdb librustzcash proton'
    cd ..

    CPPFLAGS="${CPPFLAGS} -I$PWD/depends/${CARCH}-unknown-linux-gnu/include"
    LDFLAGS="${LDFLAGS} -L${PWD}/depends/${CARCH}-unknown-linux-gnu/lib -L${PWD}/depends/x86_64-unknown-linux-gnu/lib64"

    ./autogen.sh
    depends_prefix="${PWD}/depends/x86_64-unknown-linux-gnu" ./configure --prefix=/usr
    make
}

check() {
    cd ${pkgname}

    # ./zcutil/fetch-params.sh
    # ./qa/zcash/full_test_suite.py
}

package() {
    cd ${pkgname}

    make DESTDIR="${pkgdir}" install

    for ext in '-cli' '-tx' 'd'; do
        install -Dm644 contrib/zcash${ext}.bash-completion \
            "${pkgdir}"/usr/share/bash-completion/completions/zcash${ext}
    done

    install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
}
