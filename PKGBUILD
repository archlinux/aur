# Maintainer: phiresky <phireskyde+git@gmail.com> 
# Original Author: Afri 5chdn <aur@cach.co>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=mist-classic
pkgver=0.8.1
_strver=0-8-1
_gittag=5cbe0c0
_projectname=Ethereum-Wallet
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
  'geth-classic'
  'mist-classic'
)
conflicts=(
  'geth-classic'
  'geth-classic-git'
  'go-ethereum-classic'
  'go-ethereum-classic-git'
  'mist-classic-git'
)
url="https://github.com/ethereumproject/mist"
license=('GPL')
source=(
  "mist-classic.desktop"
  "icon.png"
)
sha256sums=('b82a147721f97688e2f0baf0707d4f87707c2314135a1c9e576dcb591d2ee11e'
            'f9dfeddf9730ab693e3dc69d6dd0ad48525de1e40e1c8fb46ed081a3e7bd5f93')
sha256sums_i686=('7fb2ce457ad0090e9909f83b1f0e00be725f42a6d7a93d42912112c97da55a4e')
sha256sums_x86_64=('62a797b07bdfadf3e2879791f3d6310425d613ac67cb50a5eac96d33cb97bc48')
source_i686=(
  "${pkgname}-${_strver}-32.zip::$url/releases/download/${_gittag}/${_projectname}-linux32-$_strver.zip"
)
source_x86_64=(
  "${pkgname}-${_strver}-64.zip::$url/releases/download/${_gittag}/${_projectname}-linux64-$_strver.zip"
)

package() {
  _arch="32"
  if [ "${CARCH}" = "x86_64" ]; then
    _arch="64"
  fi

  rm "${srcdir}/${pkgname}-${_strver}-${_arch}.zip"

  msg2 'Installing Mist Classic...'
  install -d "${pkgdir}/usr/share/${pkgname}"
  cp -a "${srcdir}/${_projectname}-linux${_arch}-${_strver}/." "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/${pkgname}"

  install -d "${pkgdir}/usr/share/applications"
  install -Dm644 "${srcdir}/mist-classic.desktop" "${pkgdir}/usr/share/applications"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/${pkgname}/${_projectname}" "${pkgdir}/usr/bin/mist-classic"
  ln -s "/usr/share/${pkgname}/resources/node/geth/geth" "${pkgdir}/usr/bin/geth-classic"

  install -Dm644 "${pkgdir}/usr/share/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm "${pkgdir}/usr/share/${pkgname}/LICENSE"

  msg2 'Installing Libnode...'
  install -d "${pkgdir}/usr/lib"

  ln -sf "/usr/lib/libgcrypt.so.11" "${pkgdir}/usr/share/${pkgname}/libgcrypt.so.11"
  ln -sf "/usr/lib/libnotify.so.4" "${pkgdir}/usr/share/${pkgname}/libnotify.so.4"

  find "${pkgdir}" -type d -exec chmod 755 {} +
  find "${pkgdir}" -type f -exec chmod 644 {} +
  chmod 755 "${pkgdir}/usr/share/${pkgname}/${_projectname}"
  chmod 755 "${pkgdir}/usr/share/${pkgname}/libnode.so"
  chmod 755 "${pkgdir}/usr/share/${pkgname}/resources/node/geth/geth"
}
