# Maintainer: Afri 5chdn <aur@cach.co>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=mist
pkgver=0.8.3
_strver=0-8-3
pkgrel=2
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
  "${pkgname}-${_strver}-32.deb::https://github.com/ethereum/${pkgname}/releases/download/${pkgver}/Mist-linux32-${_strver}.deb"
)
sha256sums_i686=(
  "c1d9bf21bf01b6a000126a537a4d7b35131e1ba48d301edf33240cd82473bca0"
)
source_x86_64=(
  "${pkgname}-${_strver}-64.deb::https://github.com/ethereum/${pkgname}/releases/download/${pkgver}/Mist-linux64-${_strver}.deb"

)
sha256sums_x86_64=(
  "88faf16f85135f7a6fb1da57019db1cc5bf147411ea0fcd523472b88e5fcda4f"
)

prepare() {
  tar xf "$srcdir/data.tar.xz"
}
package() {
  _arch="32"
  if [ "${CARCH}" = "x86_64" ]; then
    _arch="64"
  fi

  rm "${srcdir}/${pkgname}-${_strver}-${_arch}.deb"

  msg2 'Installing Mist...'
  install -d "${pkgdir}/usr/share/${pkgname}"
  cp -a "${srcdir}/opt/Mist/." "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/${pkgname}"

  install -d "${pkgdir}/usr/share/applications"
  install -Dm644 "${srcdir}/mist.desktop" "${pkgdir}/usr/share/applications"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/${pkgname}/Mist" "${pkgdir}/usr/bin/mist"
  ln -s "/usr/share/${pkgname}/nodes/geth/linux-x${_arch}/geth" "${pkgdir}/usr/bin/geth"

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
  chmod 755 "${pkgdir}/usr/share/${pkgname}/nodes/geth/linux-x${_arch}/geth"
}
