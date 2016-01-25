# Maintainer: Afri 5chdn <aur@cach.co>

pkgname=mist-git
_pkgname=mist
pkgver=v0.3.8.r2.g64cb59b
_pkgver=0-3-8
pkgrel=1
pkgdesc="Ethereum wallet for Ether accounts, wallets and smart contracts (includes Mist browser)."
arch=('i686' 'x86_64')
depends=(
  'gmp'
  'leveldb'
  'qt5-base'
  'qt5-declarative'
  'qt5-quickcontrols'
  'qt5-webengine'
  'readline'
  'meteor-js'
  'electron'
)
makedepends=(
  'nodejs'
  'npm'
  'meteor-build-client'
  'gulp'
)
provides=(
  'mist'
  'libnode'
)
conflicts=(
  'mist'
  'libnode'
  'libnode-git'
)
optdepends=(
  'geth: The go-ethereum commandline client.'
  'ethereum: The cpp-ethereum commandline client.'
)
url="https://github.com/ethereum/mist"
license=('GPL')
source=("${pkgname}::git+https://github.com/ethereum/mist")
sha256sums=("SKIP")

pkgver() {
  cd ${srcdir}/${pkgname}
  git checkout -q develop
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  msg2 'Building Mist...'
  cd ${srcdir}/${pkgname}
  git checkout develop
  git submodule update --init
  npm install electron-prebuilt
  npm install meteor-build-client
  npm install gulp
  npm install
  gulp wallet --platform linux
}

package() {
  _arch="ia32"
  if [ "${CARCH}" = "x86_64" ]; then
    _arch="x64"
  fi

  msg2 'Installing Mist...'
  install -d "${pkgdir}/usr/share/mist"
  cp -a "${srcdir}/${pkgname}/dist_wallet/Ethereum-Wallet-linux-${_arch}-${_pkgver}/." "${pkgdir}/usr/share/${_pkgname}"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/${_pkgname}/Ethereum-Wallet" "${pkgdir}/usr/bin/mist"

  install -Dm644 "${pkgdir}/usr/share/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  rm "${pkgdir}/usr/share/${_pkgname}/LICENSE"

  msg2 'Installing Libnode...'
  install -d "${pkgdir}/usr/lib"
  ln -s "/usr/share/${_pkgname}/libnode.so" "${pkgdir}/usr/lib/libnode.so"

  ln -sf "/usr/lib/libgcrypt.so.11" "${pkgdir}/usr/share/${_pkgname}/libgcrypt.so.11"
  ln -sf "/usr/lib/libnotify.so.4" "${pkgdir}/usr/share/${_pkgname}/libnotify.so.4"

  find "${pkgdir}" -type d -exec chmod 755 {} +
  find "${pkgdir}" -type f -exec chmod 644 {} +
  chmod 755 "${pkgdir}/usr/share/${_pkgname}/Ethereum-Wallet"
  chmod 755 "${pkgdir}/usr/share/${_pkgname}/libnode.so"
}
