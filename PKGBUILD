# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=zcash
pkgver=1.1.1
_commit=047b0bf94a2018a5f842219d3d5cdc157f9a52da
pkgrel=1
pkgdesc='Permissionless financial system employing zero-knowledge security'
arch=('x86_64')
url='https://z.cash/'
license=('MIT')
depends=('boost-libs' 'libevent' 'qpid-proton' 'zeromq')
makedepends=('boost' 'cargo' 'cmake' 'git' 'gmock' 'python' 'wget')
checkdepends=('python2-pyblake2' 'python2-pyzmq' 'python2-qpid-proton')
source=("git+https://github.com/zcash/zcash.git#commit=${_commit}"
        'libsnark-no-gtest.patch'
        "use-system-rust.patch"
        'zcashd.service')
sha512sums=('SKIP'
            '04d397a29f6c1916ba494069fa79a65e7760d95d67174ae113b1ebc2b71233c7ded24f74bec591546ee49cff2c20e45c762aa50bf3fc3b47789f8aa34e42f930'
            '720e3f43f5d9093981148e181f8621224a678dab2e8923e5d3fce05e0eda9eb0e2677f5b8c2c19062eff5b5c277d85962ce11fd966438f3238d4b6df75c55aa8'
            '2fb8b0a636ca9c7ee15f0fd2c47046c8323ade3de9562f393da7541eee50dd14b12107dd29b0e1ee90ff88963e2f7e25b12435166a1812df5c88c579c12dde88')

prepare() {
    cd ${pkgname}

    # Set gitattributes on src/clientversion.cpp
    git archive --format=tar ${_commit} -- src/clientversion.cpp | tar -xf -

    patch -Np1 -i ../libsnark-no-gtest.patch
    patch -Np1 -i ../use-system-rust.patch

    # Runs forever
    sed -e '/prioritisetransaction.py/d' -i qa/pull-tester/rpc-tests.sh
}

build() {
    cd ${pkgname}

    cd depends
    rust_crates=(
      crate_arrayvec
      crate_bellman
      crate_bitflags
      crate_bit_vec
      crate_blake2_rfc
      crate_byteorder
      crate_constant_time_eq
      crate_crossbeam
      crate_digest
      crate_fuchsia_zircon
      crate_fuchsia_zircon_sys
      crate_futures_cpupool
      crate_futures
      crate_generic_array
      crate_lazy_static
      crate_libc
      crate_nodrop
      crate_num_cpus
      crate_pairing
      crate_rand
      crate_sapling_crypto
      crate_typenum
      crate_winapi_i686_pc_windows_gnu
      crate_winapi
      crate_winapi_x86_64_pc_windows_gnu
    )
    make install \
        native_packages='' \
        packages="bdb ${rust_crates[*]} librustzcash"
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

    ./zcutil/fetch-params.sh --testnet
    # ./qa/zcash/full_test_suite.py
    ./qa/pull-tester/rpc-tests.sh
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
