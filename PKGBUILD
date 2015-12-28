# Maintainer: Ordoe Ordoe <aur@cach.co>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=mist
pkgver=0.3.7
_pkgver=0-3-7
pkgrel=2
pkgdesc="Ethereum wallet for Ether accounts, wallets and smart contracts (includes Mist browser and Geth cli)."
arch=('x86_64')
depends=('gmp'
         'leveldb'
         'qt5-base'
         'qt5-declarative'
         'qt5-quickcontrols'
         'qt5-webengine'
         'readline')
provides=('mist'
          'libnode'
          'geth')
conflicts=('mist-git'
           'libnode'
           'geth'
           'geth-git'
           'go-ethereum'
           'go-ethereum-git')
groups=('ethereum')
url="https://github.com/ethereum/$pkgname"
license=('GPL')
source=("${pkgname}.zip::https://github.com/ethereum/$pkgname/releases/download/$pkgver/Ethereum-Wallet-linux64-$_pkgver.zip")
sha256sums=("00d088bb5d28784217a6dcd2d51567755e8fcf4601f76aa6ce18c831fd1b3d77")

package() {
  rm "${srcdir}/${pkgname}.zip"

  msg2 'Installing Mist...'
  install -d "${pkgdir}/usr/share/${pkgname}"
  cp -a "${srcdir}/Ethereum-Wallet-linux-x64-${_pkgver}/." "${pkgdir}/usr/share/${pkgname}"

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

  msg2 'Installing Geth...'
  install -m 755 "$srcdir/Ethereum-Wallet-linux-x64-$_pkgver/resources/node/geth/geth" "$pkgdir/usr/bin/geth"
}
