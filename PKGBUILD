# Maintainer: wowario <wowario[at]protonmail[dot]com>
# Contributor: wowario <wowario[at]protonmail[dot]com>
# Contributor: tobtoht <dev[at]featherwallet[dot]org>

pkgname='monero-feather-git'
pkgver=2.6.8.f58f8b6
pkgrel=1
pkgdesc='A free Monero desktop wallet'
license=('BSD')
arch=('any')
url="https://featherwallet.org"
conflicts=('featherwallet-bin' 'monero-feather' 'monero-feather-bin' 'monero-feather-appimage' 'featherwallet-appimage')
depends=('libzip' 'boost-libs' 'libunwind' 'openssl' 'hidapi' 'protobuf' 'libusb' 'libudev.so' 'libgcrypt'
         'qrencode' 'libsodium' 'expat' 'qt6-base' 'qt6-websockets' 'qt6-svg' 'tor' 'zbar' 'unbound' 'qt6-multimedia')
makedepends=('git' 'cmake' 'boost' 'base-devel' 'ccache' 'zxing-cpp')
source=("${pkgname}"::"git+https://github.com/feather-wallet/feather"
        "git+https://github.com/feather-wallet/monero.git"
        "git+https://github.com/itay-grudev/SingleApplication.git"
        "git+https://github.com/tevador/polyseed.git"
        "git+https://github.com/feather-wallet/feather-docs.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd "${srcdir}/${pkgname}"
  git submodule update --init --recursive
  git config submodule.monero.url "$srcdir/monero"
  git config submodule.src/third-party/singleapplication.url "$srcdir/singleapplication"
  git config submodule.src/third-party/polyseed.url "$srcdir/polyseed"
  git config submodule.external/feather-docs.url "$srcdir/feather-docs"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "${srcdir}/${pkgname}"
  mkdir build
  cd build
  cmake ..
  cmake --build .
}

package_monero-feather-git() {
  install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "${srcdir}/${pkgname}/build/bin/feather" "${pkgdir}/usr/bin/feather"
  install -Dm644 "${srcdir}/${pkgname}/src/assets/feather.desktop" "${pkgdir}/usr/share/applications/feather.desktop"
  install -Dm644 "${srcdir}/${pkgname}/src/assets/images/feather.png" "${pkgdir}/usr/share/pixmaps/feather.png"
}
