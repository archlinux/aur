# Maintainer: skrewball <skrewball at joickle dot com>

pkgname=pirate-qt
pkgver=5.4.2
_db_version=6.2.32
pkgrel=1
pkgdesc='Pirate Chain (ARRR) - Untraceable, Anonymous, Private Cryptocurrency - GUI'
arch=('x86_64' 'aarch64')
url='https://github.com/PirateNetwork/pirate'
license=('MIT')
provides=('pirate-qt')
conflicts=('treasure-chest-bin')
depends=(
	'boost-libs'
	'hicolor-icon-theme'
	'libevent'
	'miniupnpc'
	'protobuf'
	'qt5-base'
	'qrencode'
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
	'qt5-tools'
	'rust'
	'utf8cpp'
	'wget')
optdepends=('libappindicator-gtk3: system tray support'
	'libnotify: desktop notification support')
source=("https://github.com/PirateNetwork/pirate/archive/refs/tags/v${pkgver}.tar.gz"
	"https://download.oracle.com/berkeley-db/db-${_db_version}.tar.gz"
	"qt-arch-linux.patch")
sha256sums=('8190670acc7a726e86f0ce5a4f4657601c9503c12ce3e4984146daeed90ac950'
            'a9c5e2b004a5777aa03510cfe5cd766a4a3b777713406b02809c17c8e0e7a8fb'
            '9ed5e85e91825b54f8d94c1bb7ff292e066dcc8372d378e207391cc9834bd081')

prepare() {
  cd "pirate-${pkgver}"
  patch -Np1 -i ../qt-arch-linux.patch
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
  CXXFLAGS="${CXXFLAGS} -g0 -O2"
  rust_target=$(RUSTC_BOOTSTRAP=1 rustc -Z unstable-options --print target-spec-json | python -c 'import json,sys;obj=json.load(sys.stdin);print(obj["llvm-target"])')

  ./autogen.sh
  ./configure --prefix=/usr \
    --with-gui=qt5 \
    --disable-bip70 \
    --enable-tests=no \
    --enable-wallet=yes \
    --enable-hardening \
    --enable-proton=no \
    --enable-online-rust
  make RUST_TARGET="${rust_target}"
}

package() {
  install -Dm755 "pirate-${pkgver}/src/qt/komodo-qt" "${pkgdir}/usr/bin/pirate-qt"
  install -Dm644 "pirate-${pkgver}/zcutil/deb/desktopentry" "${pkgdir}/usr/share/applications/pirate-qt.desktop"
  install -Dm644 "pirate-${pkgver}/zcutil/deb/pirate.xpm" "${pkgdir}/usr/share/pixmaps/pirate.xpm"
}
