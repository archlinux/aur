# Maintainer: Afri 5chdn <aur@5chdn.co>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=mist
pkgver=0.9.0
_strver=0-9-0
pkgrel=2
pkgdesc="Mist dapp browser and Ethereum wallet."
arch=('i686' 'x86_64')
depends=(
  'gmp'
  'readline'
  'gconf'
  'libnotify'
  'gtk2'
  'libxss'
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
  'geth: The go-ethereum commandline client (geth cli).'
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
  "${pkgname}-${_strver}-32.deb::https://github.com/ethereum/${pkgname}/releases/download/v${pkgver}/Mist-linux32-${_strver}.deb"
)
sha256sums_i686=(
  "5ad1aa5723c7ecf63bcb3066df354b40232082c9768b62f600d48bd11e3639d5"
)
source_x86_64=(
  "${pkgname}-${_strver}-64.deb::https://github.com/ethereum/${pkgname}/releases/download/v${pkgver}/Mist-linux64-${_strver}.deb"

)
sha256sums_x86_64=(
  "8af076ed1b601651a5a767d39443585c5a5c2b3d8c9adb457aec3c3ad9f640a0"
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
  install -d "${pkgdir}/usr/share/applications"
  cp -a "${srcdir}/usr/share/." "${pkgdir}/usr/share/"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/${pkgname}/mist" "${pkgdir}/usr/bin/mist"

  install -Dm644 "${pkgdir}/usr/share/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm "${pkgdir}/usr/share/${pkgname}/LICENSE"
  sed -i 's/Exec="\/opt\/Mist\/mist"/Exec="\/usr\/bin\/mist"/' "${pkgdir}/usr/share/applications/mist.desktop";

  msg2 'Installing Libnode...'
  install -d "${pkgdir}/usr/lib"
  ln -s "/usr/share/${pkgname}/libnode.so" "${pkgdir}/usr/lib/libnode.so"

  ln -sf "/usr/lib/libgcrypt.so.11" "${pkgdir}/usr/share/${pkgname}/libgcrypt.so.11"
  ln -sf "/usr/lib/libnotify.so.4" "${pkgdir}/usr/share/${pkgname}/libnotify.so.4"

  find "${pkgdir}" -type d -exec chmod 755 {} +
  find "${pkgdir}" -type f -exec chmod 644 {} +
  chmod 755 "${pkgdir}/usr/share/${pkgname}/mist"
  chmod 755 "${pkgdir}/usr/share/${pkgname}/libnode.so"
}
