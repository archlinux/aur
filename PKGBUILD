# Maintainer: Afri 5chdn <aur@cach.co>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=mist
pkgver=0.8.2
_strver=0-8-2
pkgrel=1
pkgdesc="Mist dapp browser and Ethereum wallet."
arch=('i686' 'x86_64')
depends=(
  'gmp'
  'leveldb'
  'qt5-base'
  'qt5-declarative'
  'qt5-quickcontrols'
  'qt5-webengine'
  'readline'
  'gconf'
  'libnotify'
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
  'parity: The fast, light, robust Ethereum client.'
)
url="https://github.com/ethereum/mist"
license=('GPL')
source=(
  "mist.desktop"
  "icon.png"
)
sha256sums=(
  "d044844dd8ef1fef2ced861e5a86bf0d9af1b06ade6965dab1f12dbc612da207"
  "f9dfeddf9730ab693e3dc69d6dd0ad48525de1e40e1c8fb46ed081a3e7bd5f93"
)
source_i686=(
  "${pkgname}-${_strver}-32.zip::https://github.com/ethereum/$pkgname/releases/download/${pkgver}/Mist-linux32-$_strver.zip"
)
sha256sums_i686=(
  "e281b2b4e9f261d8983642ea03929063d28349265294150a1940feb0792f5f14"
)
source_x86_64=(
  "${pkgname}-${_strver}-64.zip::https://github.com/ethereum/$pkgname/releases/download/${pkgver}/Mist-linux64-$_strver.zip"
)
sha256sums_x86_64=(
  "3a222dd76a3b9b8f5f768cae7e57258fc07cff138e95c9c566687b8547275fea"
)

package() {
  _arch="32"
  if [ "${CARCH}" = "x86_64" ]; then
    _arch="64"
  fi

  rm "${srcdir}/${pkgname}-${_strver}-${_arch}.zip"

  msg2 'Installing Mist...'
  install -d "${pkgdir}/usr/share/${pkgname}"
  cp -a "${srcdir}/Mist-linux${_arch}-${_strver}/." "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/${pkgname}"

  install -d "${pkgdir}/usr/share/applications"
  install -Dm644 "${srcdir}/mist.desktop" "${pkgdir}/usr/share/applications"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/${pkgname}/Mist" "${pkgdir}/usr/bin/mist"
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
  chmod 755 "${pkgdir}/usr/share/${pkgname}/Mist"
  chmod 755 "${pkgdir}/usr/share/${pkgname}/libnode.so"
  chmod 755 "${pkgdir}/usr/share/${pkgname}/resources/node/geth/geth"
}
