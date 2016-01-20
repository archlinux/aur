# Maintainer: Afri 5chdn <aur@cach.co>

pkgname=mist-git
_pkgname=mist
pkgver=0.3.7.r0.g3e8b9dc
_pkgver=0-3-7
pkgrel=2
pkgdesc="Ethereum wallet for Ether accounts, wallets and smart contracts (includes Mist browser)."
arch=('x86_64')
depends=('gmp'
         'leveldb'
         'qt5-base'
         'qt5-declarative'
         'qt5-quickcontrols'
         'qt5-webengine'
         'readline'
         'meteor-js'
         'electron'
         'geth-git')
makedepends=('nodejs'
             'npm'
             'meteor-build-client'
             'gulp')
provides=('mist'
          'libnode')
conflicts=('mist'
           'libnode'
           'libnode-git')
url="https://github.com/ethereum/mist"
license=('GPL')
source=("${pkgname}::git+https://github.com/ethereum/mist")
sha256sums=("SKIP")

pkgver() {
  cd ${pkgname}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  msg2 'Building Mist...'
  cd ${srcdir}/${pkgname}
  git submodule update --init
  npm install electron-prebuilt
  npm install meteor-build-client
  npm install gulp
  npm install
  gulp wallet --platform linux
}

package() {
  msg2 'Installing Mist...'
  install -d "${pkgdir}/usr/share/mist"
  cp -a "${srcdir}/${pkgname}/dist_wallet/Ethereum-Wallet-linux-x64-${_pkgver}/." "${pkgdir}/usr/share/${_pkgname}"

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
