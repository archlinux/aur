# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=zcash
pkgver=1.0.15
_commit=93332d6e84590cdcb8c64282f9b525152c3f1b2f
pkgrel=1
pkgdesc='Permissionless financial system employing zero-knowledge security'
arch=('x86_64')
url='https://z.cash/'
license=('MIT')
depends=('boost-libs' 'libevent' 'qpid-proton' 'zeromq')
makedepends=('boost' 'cargo' 'cmake' 'git' 'gmock' 'python' 'wget')
checkdepends=('python' 'python2' 'python2-pyzmq')
source=("git+https://github.com/zcash/zcash.git#commit=${_commit}"
        "boost-no-mt-suffix.patch"
        'libsnark-no-gtest.patch'
        "use-system-rust.patch"
        'zcashd.service')
sha512sums=('SKIP'
            '7019ef6162be0083db7399ec2ec3059b669b4f05247d6f038603ba3541a864d180ca41d5d971993f0d9c028410f811f31a31c39faa7c62cbad23ca65a4a4662c'
            'ba59e6f94ac7fa94429203e32b9804e6d741e60099e2dd052813ed879ad5a10c46e816dc8d4a5d59444c35c7eaf9a40434fd93b7e392fd535c041c89274375f0'
            '3663373af04318aa72d877f399f0c9e956d289ac876583e70afa2933bf4171f7441a399e043b2d29b1df6d19d29390bb69d4053cad4b75bef903a8685fcd23bf'
            '2fb8b0a636ca9c7ee15f0fd2c47046c8323ade3de9562f393da7541eee50dd14b12107dd29b0e1ee90ff88963e2f7e25b12435166a1812df5c88c579c12dde88')

prepare() {
    cd ${pkgname}

    # Set gitattributes on src/clientversion.cpp
    git archive --format=tar ${_commit} -- src/clientversion.cpp | tar -xf -

    patch -Np1 -i ../boost-no-mt-suffix.patch
    patch -Np1 -i ../libsnark-no-gtest.patch
    patch -Np1 -i ../use-system-rust.patch
}

build() {
    cd ${pkgname}

    cd depends
    make install \
        native_packages='' \
        packages='bdb librustzcash'
    cd ..

    BUILD="$(./depends/config.guess)"
    CPPFLAGS="${CPPFLAGS} -I${PWD}/depends/${BUILD}/include"
    LDFLAGS="${LDFLAGS} -L${PWD}/depends/${BUILD}/lib"

    ./autogen.sh
    depends_prefix="${PWD}/depends/${BUILD}" ./configure --prefix=/usr
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

    install -Dm644 -t "${pkgdir}"/usr/lib/systemd/user ../zcashd.service
    install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
}
