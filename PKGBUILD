# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=zcash
pkgver=2.0.4
_commit=be1d68ef763ce405d4d04d7f4d3dfbbdd9084687
pkgrel=1
pkgdesc='Permissionless financial system employing zero-knowledge security'
arch=('x86_64')
url='https://z.cash/'
license=('MIT')
depends=('boost-libs' 'libevent' 'qpid-proton' 'zeromq')
makedepends=('boost' 'cmake' 'git' 'gmock' 'python' 'rust' 'wget')
checkdepends=('python2-pyblake2' 'python2-pyzmq' 'python2-qpid-proton')
source=("git+https://github.com/zcash/zcash.git#commit=${_commit}"
        'libsnark-no-gtest.patch'
        "use-system-rust.patch"
        'zcashd.service')
sha512sums=('SKIP'
            '3c002c9d721853089f02cc397e2bc4130574a9c06b1118824338efedc476daa5bdbdcf55bf6beba69fb9c4bd065b871b3111259fa1e25828f333056d340282a1'
            'dba24a8a99da58c856bf346631b675b5b2512514384c85a3ffbbacd4c51df808d127de926850eeb36993597f31a0052ac758d065c9cecbb05a87c079555e0a54'
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
      crate_aes
      crate_aesni
      crate_aes_soft 
      crate_arrayvec
      crate_bellman
      crate_bitflags
      crate_bit_vec
      crate_blake2_rfc
      crate_block_cipher_trait
      crate_byte_tools
      crate_byteorder
      crate_constant_time_eq
      crate_crossbeam
      crate_digest
      crate_fpe
      crate_fuchsia_zircon
      crate_fuchsia_zircon_sys
      crate_futures_cpupool
      crate_futures
      crate_generic_array
      crate_lazy_static
      crate_libc
      crate_nodrop
      crate_num_bigint
      crate_num_cpus
      crate_num_integer
      crate_num_traits
      crate_opaque_debug
      crate_pairing
      crate_rand
      crate_sapling_crypto
      crate_stream_cipher
      crate_typenum
      crate_winapi_i686_pc_windows_gnu
      crate_winapi
      crate_winapi_x86_64_pc_windows_gnu
      crate_zip32
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

    # Tests require python2
    mkdir "${srcdir}/python"
    ln -s /usr/bin/python2 "${srcdir}/python/python"
    export PATH="${srcdir}/python:${PATH}"

    ./zcutil/fetch-params.sh --testnet
    # ./qa/zcash/full_test_suite.py
    # ./qa/pull-tester/rpc-tests.sh
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
