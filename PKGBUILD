# Maintainer: skrewball <skrewball at joickle dot com>

pkgname=pirate-cli
pkgver=5.4.2
_db_version=6.2.32
pkgrel=1
pkgdesc='Pirate Chain (ARRR) - Untraceable, Anonymous, Private Cryptocurrency - CLI'
arch=('x86_64' 'aarch64')
url='https://github.com/PirateNetwork/pirate'
license=('MIT')
provides=('pirate-cli' 'pirate-tx' 'pirated')
conflicts=('treasure-chest-bin')
depends=(
	'boost-libs'
	'libevent'
	'miniupnpc'
	'protobuf'
	'zeromq')
makedepends=(
	'boost'
	'cmake'
	'ccache'
	'clang'
	'expat'
	'gmock'
	'libcurl-gnutls'
	'python'
	'rust'
	'utf8cpp'
	'wget')
source=("https://github.com/PirateNetwork/pirate/archive/refs/tags/v${pkgver}.tar.gz"
	"https://download.oracle.com/berkeley-db/db-${_db_version}.tar.gz"
	"cli-arch-linux.patch")
sha256sums=('8190670acc7a726e86f0ce5a4f4657601c9503c12ce3e4984146daeed90ac950'
            'a9c5e2b004a5777aa03510cfe5cd766a4a3b777713406b02809c17c8e0e7a8fb'
            'a0086df9b8d9e5ebfaca07ec5cc9ae8df4de38e76d46588868d5770e4255cbc2')

prepare() {
  cd "pirate-${pkgver}"
  patch -Np1 -i ../cli-arch-linux.patch
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
  make
  make DESTDIR="${srcdir}/libs" install

  cd "${srcdir}/pirate-${pkgver}"
  
  CPPFLAGS="${CPPFLAGS} -I${srcdir}/libs/include -I/usr/include/utf8cpp"
  LDFLAGS="${LDFLAGS} -L${srcdir}/libs/lib"
  CXXFLAGS="${CXXFLAGS} -g"
  rust_target=$(RUSTC_BOOTSTRAP=1 rustc -Z unstable-options --print target-spec-json | python -c 'import json,sys;obj=json.load(sys.stdin);print(obj["llvm-target"])')

  ./autogen.sh
  ./configure --prefix=/usr \
    --with-gui=no \
    --disable-bip70 \
    --enable-tests=no \
    --enable-wallet=yes \
    --enable-hardening \
    --enable-proton=no \
    --enable-online-rust
  make RUST_TARGET="${rust_target}"
}

package() {
  install -Dm755 "pirate-${pkgver}/src/pirate-cli" "${pkgdir}/usr/bin/pirate-cli"
  install -Dm755 "pirate-${pkgver}/src/pirate-tx" "${pkgdir}/usr/bin/pirate-tx"
  install -Dm755 "pirate-${pkgver}/src/pirated" "${pkgdir}/usr/bin/pirated"
}
