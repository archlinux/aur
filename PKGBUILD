pkgname=nanocurrency
pkgver=24.0
_tag="V$pkgver"
pkgrel=2
pkgdesc="Nano (formerly RaiBlocks) is a cryptocurrency designed from the ground up for scalable instant transactions and zero transaction fees."
arch=('i686' 'x86_64')
url="https://nano.org/"
license=('BSD 2-clause')
makedepends=('cmake')
depends=('qt5-base')
provides=(raiblocks nanocurrency)
conflicts=("raiblocks" "raiblocks-git" "raiblocks-node-git" "nanocurrency-node-git")
install=install

source=(nanowallet.desktop
  nanowallet128.png
  nano-node.service
  provide-boost.patch
  "boost_1_75_0.tar.bz2::https://sourceforge.net/projects/boost/files/boost/1.75.0/boost_1_75_0.tar.bz2/download"
  "git+https://github.com/nanocurrency/nano-node.git#tag=${_tag}"
  git+https://github.com/weidai11/cryptopp.git
  "git+https://github.com/nanocurrency/lmdb.git#branch=lmdb_0_9_23"
  git+https://github.com/miniupnp/miniupnp.git
  git+https://github.com/nanocurrency/phc-winner-argon2.git
  "git+https://github.com/google/flatbuffers.git"
  "git+https://github.com/nanocurrency/rocksdb.git#branch=6.13.3"
  git+https://github.com/cryptocode/cpptoml.git
  git+https://github.com/google/googletest.git
  git+https://github.com/nanocurrency/nano-pow-server.git
  git+https://github.com/nanocurrency/diskhash.git
  )

sha256sums=('6b824bfd5a9f2c1cd8d6a30f858a7bdc7813a448f4894a151da035dac5af2f91'
            '27179351dbc3e000d54b5b13f0c2326b4c4bd06e93b1d0b2ea1849609aeadc2e'
            'c219c91db98f33097e7d96ef0f0c95e4b9d6226ac2ab90e30be7f955c43bfa35'
            'dbfe2a1774c2c5c2567cbfa9731c431f01076b62f7ea9b3657c875d1dbe2dada'
            '953db31e016db7bb207f11432bef7df100516eeb746843fa0486a222e3fd49cb'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')


_submodule_config() {
  submodule_name=$1
  submodule_path=$2
  if [[ -z "$submodule_path" ]]; then
    submodule_path=$1
  fi
  
  git config --file=.gitmodules "submodule.${submodule_name}.url" "$srcdir/${submodule_path}"
  #git submodule init "${submodule_name}"
  #git submodule update "${submodule_name}"
}

prepare() {
  cd "$srcdir/nano-node"

  _submodule_config crypto/cryptopp cryptopp
  _submodule_config lmdb
  _submodule_config miniupnp
  _submodule_config crypto/phc-winner-argon2 phc-winner-argon2
  _submodule_config flatbuffers
  _submodule_config rocksdb
  _submodule_config cpptoml
  _submodule_config googletest
  _submodule_config nano-pow-server
  _submodule_config diskhash
  
  git submodule init
  git -c protocol.file.allow=always submodule update --recursive

  cd "${srcdir}/nano-node"
  patch --forward -p0 -i $srcdir/provide-boost.patch
  ln -sf "$srcdir/boost_1_75_0.tar.bz2" ./
  ln -sf "$srcdir/boost_1_75_0" ./
#  patch --forward -p1 -i $srcdir/fix-build-for-boost-1.76.patch
}
build() {

  cd "${srcdir}/nano-node"
  # remove /bin from $PATH so that boost can be built
  # see https://bugs.archlinux.org/task/64132
  tmp_path=:$PATH:
  remove_from_PATH='/bin'
  tmp_path=${tmp_path/:$remove_from_PATH:/:}
  tmp_path=${tmp_path%:}
  tmp_path=${tmp_path#:}
  PATH=$tmp_path
  
  _flags="-DNANO_GUI=ON -DFAIL_ON_WARNINGS=OFF -DFLATBUFFERS_STRICT_MODE=OFF -DCMAKE_CXX_FLAGS=\"-Wno-error\""
  
  if grep -q avx2 /proc/cpuinfo; then
    echo "using AVX2 optimizations"
    _flags="${_flags} -DENABLE_AVX2=ON -DPERMUTE_WITH_GATHER=ON -DPERMUTE_WITH_SHUFFLES=ON"
  else
    echo "excluding unsupported AVX2 optimizations"
  fi
  if grep -q sse4 /proc/cpuinfo; then
    echo "build with SIMD optimizations"
    _flags="${_flags} -DNANO_SIMD_OPTIMIZATIONS=ON"
  else
    echo "excluding unsupported SIMD optimizations"
    _flag+="${_flags} -DNANO_SIMD_OPTIMIZATIONS=OFF"
  fi
  
  _cores=$(grep processor /proc/cpuinfo | wc -l)
  #_cores=1

  export BOOST_ROOT="$srcdir/boost_build"
  echo "build boost..."
  pushd "$srcdir/nano-node" >/dev/null
  bash util/build_prep/bootstrap_boost.sh -j $_cores -B 1.75 -m
  popd >/dev/null
  
  PATH=$PATH cmake $_flags ./
  make -j${_cores} VERBOSE=1 nano_wallet
  make -j${_cores} VERBOSE=1 nano_node
}

package() {
  cd "$srcdir/nano-node"

  install -Dm755 nano_wallet "$pkgdir"/usr/bin/nano_wallet
  #ln -s /usr/bin/nano_wallet "$pkgdir"/usr/bin/rai_wallet
  install -Dm755 nano_node "$pkgdir"/usr/bin/nano_node
  #ln -s /usr/bin/nano_node "$pkgdir"/usr/bin/rai_node

  install -Dm644 "$srcdir"/nanowallet128.png "$pkgdir"/usr/share/pixmaps/nanowallet128.png
  install -Dm644 "$srcdir"/nanowallet.desktop "$pkgdir"/usr/share/applications/nanowallet.desktop
  #ln -s /usr/share/applications/nanowallet.desktop "$pkgdir"/usr/lib/systemd/system/raiblocks.service

  install -Dm644 "$srcdir"/nano-node.service "$pkgdir"/usr/lib/systemd/system/nano-node.service
  #ln -s /usr/lib/systemd/system/nano-node.service "$pkgdir"/usr/lib/systemd/system/raiblocks-node.service
}

# vim:set ts=2 sw=2 et:
