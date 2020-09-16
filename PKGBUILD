# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=zcash
pkgver=4.0.0
_commit=5e7e9687fc87a2426bafef2837174eac52978b4c
pkgrel=2
pkgdesc='Permissionless financial system employing zero-knowledge security'
arch=('x86_64')
url='https://z.cash/'
license=('MIT')
depends=('boost-libs' 'libevent' 'zeromq')
makedepends=('boost' 'cmake' 'git' 'gmock' 'python' 'rust' 'wget')
checkdepends=('python-pyblake2' 'python-pyzmq' 'python-requests' 'python-simplejson')
source=("git+https://github.com/zcash/zcash.git#commit=${_commit}"
        'use-system-rust.patch'
        'zcashd.service')
sha512sums=('SKIP'
            '1267fc174df81a80a1b0f2e1a6bbaaa6fa95402c83bc6a8678b582ed6c7f7a02eeed0f61c9600496aa782f9fb9fec6dc9ac419d366d059306a5c4f97a5a166f0'
            '2fb8b0a636ca9c7ee15f0fd2c47046c8323ade3de9562f393da7541eee50dd14b12107dd29b0e1ee90ff88963e2f7e25b12435166a1812df5c88c579c12dde88')

prepare() {
    cd ${pkgname}

    # Set gitattributes on src/clientversion.cpp
    git archive --format=tar ${_commit} -- src/clientversion.cpp | tar -xf -

    patch -Np1 -i ../use-system-rust.patch
}

build() {
    cd ${pkgname}

    cd depends
    make install \
        native_packages='' \
        packages="bdb utfcpp"
    cd ..

    BUILD="$(./depends/config.guess)"
    CPPFLAGS="${CPPFLAGS} -I${PWD}/depends/${BUILD}/include"
    LDFLAGS="${LDFLAGS} -L${PWD}/depends/${BUILD}/lib"

    ./autogen.sh
    depends_prefix="${PWD}/depends/${BUILD}" ./configure --prefix=/usr \
        --enable-online-rust
    make RUST_TARGET="${BUILD}"
}

check() {
    cd ${pkgname}

    ./zcutil/fetch-params.sh --testnet
    export RUST_TARGET="$(./depends/config.guess)"
    ./qa/zcash/full_test_suite.py || true
}

package() {
    cd ${pkgname}

    make DESTDIR="${pkgdir}" RUST_TARGET="$(./depends/config.guess)" install

    for ext in '-cli' '-tx' 'd'; do
        install -Dm644 contrib/zcash${ext}.bash-completion \
            "${pkgdir}"/usr/share/bash-completion/completions/zcash${ext}
    done

    install -Dm644 -t "${pkgdir}"/usr/lib/systemd/user ../zcashd.service
    install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
}
