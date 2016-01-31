# Maintainer: Afri 5chdn <aur@cach.co>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=mist
pkgver=0.3.9
_pkgver=0-3-9
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
)
provides=(
  'mist'
  'libnode'
)
conflicts=(
  'mist-git'
  'libnode'
  'libnode-git'
)
optdepends=(
  'geth: The go-ethereum commandline client.'
  'ethereum: The cpp-ethereum commandline client.'
)
url="https://github.com/ethereum/mist"
license=('GPL')
source=(
  "${pkgname}-${_pkgver}-ia32.zip::https://github.com/ethereum/$pkgname/releases/download/${pkgver}/Ethereum-Wallet-linux32-$_pkgver.zip"
  "${pkgname}-${_pkgver}-x64.zip::https://github.com/ethereum/$pkgname/releases/download/${pkgver}/Ethereum-Wallet-linux64-$_pkgver.zip"
)
sha256sums=(
  "1102622f862c9001e3ce36d27bd76b4a0b29c4a4c359a9acf62ccdc4f5b8821d"
  "9d0bb4ca4fb8f4d5acba3596ac4231b9d1661583e91a5c4f03789aaab73b2952"
)

package() {
  _arch="ia32"
  if [ "${CARCH}" = "x86_64" ]; then
    _arch="x64"
  fi

  rm "${srcdir}/${pkgname}-${_pkgver}-${_arch}.zip"

  msg2 'Installing Mist...'
  install -d "${pkgdir}/usr/share/${pkgname}"
  cp -a "${srcdir}/Ethereum-Wallet-linux-${_arch}-${_pkgver}/." "${pkgdir}/usr/share/${pkgname}"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/${pkgname}/Ethereum-Wallet" "${pkgdir}/usr/bin/mist"

  install -Dm644 "${pkgdir}/usr/share/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm "${pkgdir}/usr/share/${pkgname}/LICENSE"

  msg2 'Installing Libnode...'
  install -d "${pkgdir}/usr/lib"
  ln -s "/usr/share/${pkgname}/libnode.so" "${pkgdir}/usr/lib/libnode.so"

  ln -sf "/usr/lib/libgcrypt.so.11" "${pkgdir}/usr/share/${pkgname}/libgcrypt.so.11"
  ln -sf "/usr/lib/libnotify.so.4" "${pkgdir}/usr/share/${pkgname}/libnotify.so.4"

  find "${pkgdir}" -type d -exec chmod 755 {} +
  find "${pkgdir}" -type f -exec chmod 644 {} +
  chmod 755 "${pkgdir}/usr/share/${pkgname}/Ethereum-Wallet"
  chmod 755 "${pkgdir}/usr/share/${pkgname}/libnode.so"
}
