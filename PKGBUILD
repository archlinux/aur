# Maintainer: Nicola Squartini <tensor5@gmail.com>
# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=zcash
pkgver=5.3.0
_commit=35186b00928f3ba994f0e66bb234c412cbffc7b6
_db_version=6.2.23
pkgrel=2
pkgdesc='Permissionless financial system employing zero-knowledge security'
arch=('x86_64')
url='https://z.cash/'
license=('MIT')
depends=('boost-libs' 'libevent' 'libsodium' 'zeromq')
makedepends=('boost' 'clang' 'cmake' 'cxxbridge' 'git' 'gmock' 'python' 'rust' 'utf8cpp' 'wget')
options=(!lto)
source=("git+https://github.com/zcash/zcash.git#commit=${_commit}"
        "https://download.oracle.com/berkeley-db/db-${_db_version}.tar.gz"
        'zcashd.service')
sha256sums=('SKIP'
            '47612c8991aa9ac2f6be721267c8d3cdccf5ac83105df8e50809daea24e95dc7'
            '7b0919ac447824199aff8c17b5a5799b46414818c6aed314506c5295d0ce9ccd')

get_rust_target() {
    RUSTC_BOOTSTRAP=1 rustc -Z unstable-options --print target-spec-json | python -c 'import json,sys;obj=json.load(sys.stdin);print(obj["llvm-target"])'
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

    export CC=/usr/bin/clang
    export CXX=/usr/bin/clang++

    ./autogen.sh
    ./configure --prefix=/usr \
        --enable-online-rust
    cp /usr/share/cxxbridge/cxx.h src/rust/include/rust/
    make RUST_TARGET="$(get_rust_target)"
}

package() {
    cd ${pkgname}

    make DESTDIR="${pkgdir}" RUST_TARGET="$(get_rust_target)" install

    for ext in '-cli' '-tx' 'd'; do
        install -Dm644 contrib/zcash${ext}.bash-completion \
            "${pkgdir}"/usr/share/bash-completion/completions/zcash${ext}
    done

    install -Dm644 ../zcashd.service -t "${pkgdir}"/usr/lib/systemd/user
    install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
}
