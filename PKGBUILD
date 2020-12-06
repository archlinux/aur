# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=zcash
pkgver=4.1.1
_commit=6d856869e9c4cb9e6f3332db6fb04b956bb9fd3d
_db_version=6.2.23
_db_sha256_hash=47612c8991aa9ac2f6be721267c8d3cdccf5ac83105df8e50809daea24e95dc7
pkgrel=2
pkgdesc='Permissionless financial system employing zero-knowledge security'
arch=('x86_64')
url='https://z.cash/'
license=('MIT')
depends=('boost-libs' 'libevent' 'utf8cpp' 'zeromq')
makedepends=('boost' 'cmake' 'git' 'gmock' 'python' 'rust' 'wget')
checkdepends=('python-pyblake2' 'python-pyzmq' 'python-requests' 'python-simplejson')
source=("git+https://github.com/zcash/zcash.git#commit=${_commit}"
        "https://download.oracle.com/berkeley-db/db-${_db_version}.tar.gz"
        'use-system-rust.patch'
        'zcashd.service')
sha256sums=('SKIP'
            "${_db_sha256_hash}"
            '119e787cb22f2941ead286d2621fae7d6c4de6216e24615eb3c0f875e7a2547f'
            '7b0919ac447824199aff8c17b5a5799b46414818c6aed314506c5295d0ce9ccd')

prepare() {
    cd ${pkgname}

    # Set gitattributes on src/clientversion.cpp
    git archive --format=tar ${_commit} -- src/clientversion.cpp | tar -xf -

    patch -Np1 -i ../use-system-rust.patch
}

build() {
    cd "db-${_db_version}/build_unix"

    ../dist/configure \
        --prefix=/ \
        --disable-shared \
        --enable-cxx \
        --disable-replication \
        --enable-option-checking \
        --with-pic
    make libdb_cxx-6.2.a libdb-6.2.a
    make DESTDIR="${srcdir}/db-root" install

    cd "${srcdir}/${pkgname}"

    CPPFLAGS="${CPPFLAGS} -I${srcdir}/db-root/include -I/usr/include/utf8cpp"
    LDFLAGS="${LDFLAGS} -L${srcdir}/db-root/lib"

    ./autogen.sh
    ./configure --prefix=/usr \
        --enable-online-rust
    make RUST_TARGET=x86_64-unknown-linux-gnu
}

check() {
    cd ${pkgname}

    ./zcutil/fetch-params.sh --testnet
    export RUST_TARGET=x86_64-unknown-linux-gnu
    ./qa/zcash/full_test_suite.py || true
}

package() {
    cd ${pkgname}

    make DESTDIR="${pkgdir}" RUST_TARGET=x86_64-unknown-linux-gnu install

    for ext in '-cli' '-tx' 'd'; do
        install -Dm644 contrib/zcash${ext}.bash-completion \
            "${pkgdir}"/usr/share/bash-completion/completions/zcash${ext}
    done

    install -Dm644 -t "${pkgdir}"/usr/lib/systemd/user ../zcashd.service
    install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
}
