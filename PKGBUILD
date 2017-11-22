# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=zcash
pkgver=1.0.13
_commit=3ee1d04a8dff26e81aaf17095a0e2472bc70cf36
pkgrel=1
pkgdesc='Permissionless financial system employing zero-knowledge security'
arch=('x86_64')
url='https://z.cash/'
license=('MIT')
depends=('boost-libs' 'libevent' 'zeromq')
makedepends=('boost' 'cargo' 'cmake' 'git' 'python' 'wget')
checkdepends=('python' 'python2' 'python2-pyzmq')
source=("git+https://github.com/zcash/zcash.git#commit=${_commit}"
        "boost-no-mt-suffix.patch"
        "use-system-rust.patch")
sha256sums=('SKIP'
            'de84cf8c0ee530958300bcd9d92c59f5adb5ccabcf7fbc79ace856b0461d394c'
            '065cd418ca7be72018c7fdada3012872bd079a254a95560312514594381b8028')

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
        packages='bdb googletest googlemock librustzcash proton'
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
        install -Dm644 contrib/bitcoin${ext}.bash-completion \
            "${pkgdir}"/usr/share/bash-completion/completions/zcash${ext}
    done

    install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
}
