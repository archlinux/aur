# $Id$
# Maintainer: Nikolay Kuzin <develnk@gmail.com>

pkgname=asofe
pkgver=2.1.0
_commit=dec56f81c3c3cf98e7cdb1c38d21d3ed2c56414c
pkgrel=2
pkgdesc='Permissionless financial system employing zero-knowledge security'
arch=('x86_64')
url='https://asofe.org/'
license=('MIT')
depends=('boost-libs' 'libevent' 'qpid-proton' 'zeromq')
makedepends=('boost' 'cmake' 'git' 'gmock' 'python' 'rust' 'wget')
checkdepends=('python2-pyblake2' 'python2-pyzmq' 'python2-qpid-proton')
source=("git+https://github.com/TheLightSide/asofe.git#commit=${_commit}"
        'use-system-qpid-proton.patch'
        'use-system-rust.patch'
        'asofed.service')
sha512sums=('SKIP'
            '019870971a0cec093d0552585f4140f39dd65f90cb56b97e512bbaf0d79c0f1574295e722310d4e1762af12ff693802fc465765d4d1410d209e259326f307d6a'
            '8878b5c805d6cdf159dbac0ef73fb47d0fbd2fc35332f1c15f05d6041c0eca7f16b12aeb1cc20615d0a325a68e8d22bb3961cadebbfa54b87783ad5de35b92fb'
            'bfc39352e50078c7897ae3b8167f06d152f26c52dc7199ae952bad85b99a9da4f9d25d63edfe52291ad27b6e08b828c5db205eb0dc6091ec3fc75dc2b1bfca19')

prepare() {
    cd ${pkgname}

    # Set gitattributes on src/clientversion.cpp
    git archive --format=tar ${_commit} -- src/clientversion.cpp | tar -xf -

    patch -Np1 -i ../use-system-qpid-proton.patch
    patch -Np1 -i ../use-system-rust.patch

    # Runs forever
    sed -e '/prioritisetransaction.py/d' -i qa/pull-tester/rpc-tests.sh
}

build() {
    cd ${pkgname}

    # Temporary, due to llvm-libs 9 being in [staging]
    rustup update stable

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
        install -Dm644 contrib/asofe${ext}.bash-completion \
            "${pkgdir}"/usr/share/bash-completion/completions/asofe${ext}
    done

    install -Dm644 -t "${pkgdir}"/usr/lib/systemd/user ../asofed.service
    install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
}
