# $Id$
# Maintainer: Nikolay Kuzin <develnk@gmail.com>

pkgname=asofe
pkgver=1.0.15
_commit=54a4d90d8f57e5cf2a2fa3b4f868b4fd5518aa60
pkgrel=1
pkgdesc='Permissionless financial system employing zero-knowledge security'
arch=('x86_64')
url='https://asofe.org/'
license=('MIT')
depends=('boost-libs' 'libevent' 'zeromq')
makedepends=('boost' 'cargo' 'cmake' 'git' 'gmock' 'python' 'wget')
checkdepends=('python' 'python2' 'python2-pyzmq')
source=("git+https://github.com/TheLightSide/asofe.git#commit=${_commit}"
        "boost-no-mt-suffix.patch"
        "use-system-rust.patch"
        'asofed.service')
sha512sums=('SKIP'
            '370c9fff0c62fe1f77b9edee1af87dde087804e6a3b1eb9b2c27b49868e58ccf85a4814c813aea98c98a5c50533822b70338b57f3b3ced1adf02e5fa0c712c56'
            '575a78b2c54d99eeb9b63f921c605a34417d81506e1c3e6b927269306bd83da373c2d6d3b5d44cbf3198d03f0d47a17a445ffa69ab49348b394e947b4169d172'
            'bfc39352e50078c7897ae3b8167f06d152f26c52dc7199ae952bad85b99a9da4f9d25d63edfe52291ad27b6e08b828c5db205eb0dc6091ec3fc75dc2b1bfca19')

prepare() {
    cd ${pkgname}

    # Set gitattributes on src/clientversion.cpp
    git archive --format=tar ${_commit} -- src/clientversion.cpp | tar -xf -

    patch -Np1 -i ../boost-no-mt-suffix.patch
    patch -Np1 -i ../use-system-rust.patch
}

build() {
    cd ${pkgname}

    HOST="$(./depends/config.guess)" BUILD="$(./depends/config.guess)" make -C ./depends/ V=1

    CPPFLAGS="${CPPFLAGS} -I$PWD/depends/${CARCH}-unknown-linux-gnu/include"
    LDFLAGS="${LDFLAGS} -L${PWD}/depends/${CARCH}-unknown-linux-gnu/lib -L${PWD}/depends/x86_64-unknown-linux-gnu/lib64"

    ./autogen.sh
    depends_prefix="${PWD}/depends/x86_64-unknown-linux-gnu" ./configure --prefix=/usr
    make -i
}

check() {
    cd ${pkgname}
    ./zcutil/fetch-params.sh
    # ./qa/zcash/full_test_suite.py
}

package() {
    cd ${pkgname}

    make DESTDIR="${pkgdir}" install

    for ext in '-cli' '-tx' 'd'; do
        install -Dm644 contrib/asofe${ext}.bash-completion \
            "${pkgdir}"/usr/share/bash-completion/completions/asofe${ext}
    done

    install -Dm644 -t "${pkgdir}"/usr/lib/systemd/user ../asofed.service
    install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
}
