# Maintainer: Jeremy Kescher <jeremy@kescher.at>

# Based on https://aur.archlinux.org/packages/monero-feather-git/

pkgname='monero-feather'
pkgver=2.1.0
pkgrel=1
pkgdesc='A free Monero desktop wallet'
license=('BSD')
arch=('x86_64')
url="https://featherwallet.org"
depends=('libzip' 'boost-libs' 'libunwind' 'openssl' 'hidapi' 'protobuf' 'libusb' 'libgcrypt'
         'qrencode' 'libsodium' 'expat' 'qt6-base' 'qt6-websockets' 'qt6-svg' 'tor' 'zbar' 'unbound')
makedepends=('git' 'cmake' 'boost')
provides=('monero-feather')
conflicts=('monero-feather' 'monero-feather-git')

source=("${pkgname}"::"git+https://github.com/feather-wallet/feather.git#tag=${pkgver}")

sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}"
  git submodule update --init --recursive
  # Fix for https://github.com/feather-wallet/feather/issues/33
  # Taken from: https://github.com/gentoo-monero/gentoo-monero/blob/6d409a872a5f530ab0c6003c92741f1564ccee4b/net-misc/feather/feather-2.1.0.ebuild#L75-L76
  echo "#define FEATHER_VERSION \"${pkgver}\"" >> src/config-feather.h
  echo "#define TOR_VERSION \"NOT_EMBEDDED\"" >> src/config-feather.h
}

build() {
  cd "${srcdir}/${pkgname}"
  make release
}

package() {
  install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "${srcdir}/${pkgname}/build/release/bin/feather" "${pkgdir}/usr/bin/feather"
  install -Dm644 "${srcdir}/${pkgname}/src/assets/feather.desktop" "${pkgdir}/usr/share/applications/feather.desktop"
  install -Dm644 "${srcdir}/${pkgname}/src/assets/images/feather.png" "${pkgdir}/usr/share/pixmaps/feather.png"
}

