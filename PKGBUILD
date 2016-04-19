# Maintainer: Afri 5chdn <aur@cach.co>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=mist
pkgver=0.7.0
_pkgver=0-7-0
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
  'geth'
  'mist'
  'libnode'
)
conflicts=(
  'geth'
  'geth-git'
  'go-ethereum'
  'go-ethereum-git'
  'mist-git'
  'libnode'
  'libnode-git'
)
optdepends=(
  'ethereum: The cpp-ethereum commandline client.'
)
url="https://github.com/ethereum/mist"
license=('GPL')
source=(
  "${pkgname}-${_pkgver}-32.zip::https://github.com/ethereum/$pkgname/releases/download/${pkgver}/Ethereum-Wallet-linux32-$_pkgver.zip"
  "${pkgname}-${_pkgver}-64.zip::https://github.com/ethereum/$pkgname/releases/download/${pkgver}/Ethereum-Wallet-linux64-$_pkgver.zip"
  "mist.desktop"
  "icon.png"
)
sha256sums=(
  "5a3db305209de08b5a10987467163ec3c4ba02983b7ca6b0dd3b3e0967776c15"
  "681e9db64e771e73ee03a8a204fe542e7d3c69d50f85ced1f94b71a10bd5bd83"
  "d044844dd8ef1fef2ced861e5a86bf0d9af1b06ade6965dab1f12dbc612da207"
  "f9dfeddf9730ab693e3dc69d6dd0ad48525de1e40e1c8fb46ed081a3e7bd5f93"
)

package() {
  _arch="32"
  if [ "${CARCH}" = "x86_64" ]; then
    _arch="64"
  fi

  rm "${srcdir}/${pkgname}-${_pkgver}-${_arch}.zip"

  msg2 'Installing Mist...'
  install -d "${pkgdir}/usr/share/${pkgname}"
  cp -a "${srcdir}/Ethereum-Wallet-linux${_arch}-${_pkgver}/." "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/${pkgname}"

  install -d "${pkgdir}/usr/share/applications"
  install -Dm644 "${srcdir}/mist.desktop" "${pkgdir}/usr/share/applications"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/${pkgname}/Ethereum-Wallet" "${pkgdir}/usr/bin/mist"
  ln -s "/usr/share/${pkgname}/resources/node/geth/geth" "${pkgdir}/usr/bin/geth"

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
  chmod 755 "${pkgdir}/usr/share/${pkgname}/resources/node/geth/geth"
}
