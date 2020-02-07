# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=zcash
pkgver=2.1.1_1
_commit=5cb77119e4327a652908e4fede9b3816d37487f3
pkgrel=1
pkgdesc='Permissionless financial system employing zero-knowledge security'
arch=('x86_64')
url='https://z.cash/'
license=('MIT')
depends=('boost-libs' 'libevent' 'qpid-proton' 'zeromq')
makedepends=('boost' 'cmake' 'git' 'gmock' 'python' 'rust' 'wget')
checkdepends=('python2-pyblake2' 'python2-pyzmq' 'python2-qpid-proton')
source=("git+https://github.com/zcash/zcash.git#commit=${_commit}"
        'use-system-qpid-proton.patch'
        'use-system-rust.patch'
        'zcashd.service')
sha512sums=('SKIP'
            '2d877820a16c4cd89f5506e59575e23088df418f8cb8a0cf78d28365704b1ada5154bb13ab645a00cfda1329c25b4dcc8e3c0851302e788087c932adf98a9090'
            'e905707b3fbbce732c77ff0c831b33a4778d62f4c0404f93c587d20a9c893b141c2acbde80a10ced98631668d62c9689b8faef3163aeb178b20391e06833a360'
            '2fb8b0a636ca9c7ee15f0fd2c47046c8323ade3de9562f393da7541eee50dd14b12107dd29b0e1ee90ff88963e2f7e25b12435166a1812df5c88c579c12dde88')

prepare() {
    cd ${pkgname}

    # Set gitattributes on src/clientversion.cpp
    git archive --format=tar ${_commit} -- src/clientversion.cpp | tar -xf -

    patch -Np1 -i ../use-system-qpid-proton.patch
    patch -Np1 -i ../use-system-rust.patch
}

build() {
    cd ${pkgname}

    cd depends
    rust_crates=(
      crate_aes
      crate_aesni
      crate_aes_soft 
      crate_arrayref
      crate_arrayvec
      crate_autocfg
      crate_bech32
      crate_bit_vec
      crate_blake2b_simd
      crate_blake2s_simd
      crate_block_buffer
      crate_block_cipher_trait
      crate_block_padding
      crate_byte_tools
      crate_byteorder
      crate_c2_chacha
      crate_cfg_if
      crate_constant_time_eq
      crate_crossbeam_channel
      crate_crossbeam_deque
      crate_crossbeam_epoch
      crate_crossbeam_queue
      crate_crossbeam_utils
      crate_crossbeam
      crate_crypto_api_chachapoly
      crate_crypto_api      
      crate_digest
      crate_directories
      crate_fake_simd
      crate_fpe
      crate_futures_cpupool
      crate_futures
      crate_generic_array
      crate_getrandom
      crate_hex
      crate_lazy_static
      crate_libc
      crate_log
      crate_memoffset      
      crate_nodrop
      crate_num_bigint
      crate_num_cpus
      crate_num_integer
      crate_num_traits
      crate_opaque_debug
      crate_ppv_lite86
      crate_proc_macro2
      crate_quote
      crate_rand_chacha
      crate_rand_core
      crate_rand_hc
      crate_rand_os
      crate_rand_xorshift      
      crate_rand
      crate_rustc_version
      crate_scopeguard
      crate_semver_parser
      crate_semver
      crate_sha2
      crate_syn
      crate_typenum
      crate_unicode_xid
      crate_wasi
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

    # Tests require python2
    mkdir "${srcdir}/python"
    ln -s /usr/bin/python2 "${srcdir}/python/python"
    export PATH="${srcdir}/python:${PATH}"

    ./zcutil/fetch-params.sh --testnet
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
