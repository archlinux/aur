# Maintainer: skrewball <aur at joickle dot com>

pkgbase=pirate
pkgname=('pirate-qt' 'pirate-cli')
pkgver=5.4.2
pkgrel=1
pkgdesc="Pirate Chain (ARRR) - Untraceable, Anonymous, Private Cryptocurrency"
arch=('x86_64')
url='https://github.com/PirateNetwork/pirate'
license=('MIT')
groups=('pirate')

depends=('boost-libs' 'libevent' 'miniupnpc' 'protobuf' 'zeromq')
makedepends=('boost' 'cmake' 'ccache' 'clang' 'curl' 'expat' 'gmock' 'libcurl-gnutls' 'openssl'
             'libsodium' 'libevent' 'python' 'qt5-tools' 'rust' 'utf8cpp' 'wget' 'desktop-file-utils')
conflicts=('treasure-chest' 'treasure-chest-bin')
replaces=('treasure-chest' 'treasure-chest-bin')

_db_version=6.2.32
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "https://download.oracle.com/berkeley-db/db-${_db_version}.tar.gz"
        "001-pirate-pr83-cpp.patch")
sha256sums=('8190670acc7a726e86f0ce5a4f4657601c9503c12ce3e4984146daeed90ac950'
            'a9c5e2b004a5777aa03510cfe5cd766a4a3b777713406b02809c17c8e0e7a8fb'
            '804b0d8ecfba1b04bd229b06f37c8fc5b4a955082d2248ce09ecedf90395ca10')

prepare() {
  # Grab the .desktop file and patch it
  mv ${pkgbase}-${pkgver}/zcutil/deb/desktopentry ${pkgbase}-qt.desktop
  sed -e "s|Exec=.*|Exec=/usr/bin/${pkgbase}-qt %u|g" \
      -e "s|Icon=.*|Icon=${pkgbase}|g" \
      -i ${pkgbase}-qt.desktop
  # Patch source to build on newer library versions
  # MR: https://github.com/PirateNetwork/pirate/pull/83
  cd "${pkgbase}-${pkgver}"
  patch -Np1 -i ../001-pirate-pr83-cpp.patch
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

  cd "${srcdir}/${pkgbase}-${pkgver}"
  # Include built db and other needed vars
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

package_pirate-qt() {
  # Package Pirate QT GUI
  pkgdesc+=" - GUI"
  depends+=('hicolor-icon-theme' 'qt5-base' 'qrencode')
  optdepends=('libappindicator-gtk3: system tray support'
              'libnotify: desktop notification support')
  provides=('pirate-qt')

  desktop-file-install --dir="${pkgdir}/usr/share/applications" ${pkgname}.desktop
  cd "${pkgbase}-${pkgver}"
  install -Dm755 src/qt/komodo-qt "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 zcutil/deb/${pkgbase}.xpm "${pkgdir}/usr/share/pixmaps/${pkgbase}.xpm"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

package_pirate-cli() {
  # Package Pirate CLI
  pkgdesc+=" - CLI"
  provides=('pirate-cli' 'pirate-tx' 'pirated')

  cd "${pkgbase}-${pkgver}"
  install -Dm755 src/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 src/${pkgbase}-tx "${pkgdir}/usr/bin/${pkgbase}-tx"
  install -Dm755 src/${pkgbase}d "${pkgdir}/usr/bin/${pkgbase}d"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
