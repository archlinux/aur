# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=zcash
pkgver=1.1.0
_commit=42e30252372b39f2b8da655ebeca03565dc02de4
pkgrel=1
pkgdesc='Permissionless financial system employing zero-knowledge security'
arch=('x86_64')
url='https://z.cash/'
license=('MIT')
depends=('boost-libs' 'libevent' 'qpid-proton' 'zeromq')
makedepends=('boost' 'cargo' 'cmake' 'git' 'gmock' 'python' 'wget')
checkdepends=('python' 'python2' 'python2-pyzmq')
source=("git+https://github.com/zcash/zcash.git#commit=${_commit}"
        'libsnark-no-gtest.patch'
        "use-system-rust.patch"
        'zcashd.service')
sha512sums=('SKIP'
            '04d397a29f6c1916ba494069fa79a65e7760d95d67174ae113b1ebc2b71233c7ded24f74bec591546ee49cff2c20e45c762aa50bf3fc3b47789f8aa34e42f930'
            'ce98eb983956704af4fc05d0c0959bb3538127432e64b1ea1482f345a15b9d4fc6b41f631705cd5aa1e09aeea608781106e7915ddbc57f314811d262ae361c50'
            '2fb8b0a636ca9c7ee15f0fd2c47046c8323ade3de9562f393da7541eee50dd14b12107dd29b0e1ee90ff88963e2f7e25b12435166a1812df5c88c579c12dde88')

prepare() {
    cd ${pkgname}

    # Set gitattributes on src/clientversion.cpp
    git archive --format=tar ${_commit} -- src/clientversion.cpp | tar -xf -

    patch -Np1 -i ../libsnark-no-gtest.patch
    patch -Np1 -i ../use-system-rust.patch
}

build() {
    cd ${pkgname}

    cd depends
    make install \
        native_packages='' \
        packages='bdb crate_libc librustzcash'
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
