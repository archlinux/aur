# Maintainer: Afri 5chdn <aur@5chdn.co>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=mist
pkgver=0.9.2
_strver=0-9-2
pkgrel=1
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
sha256sums=('bad4d3dc4e44d3beb643e1ecc9b46559c7c3f209204ade2bc2a63d87642b3245'
            'f9dfeddf9730ab693e3dc69d6dd0ad48525de1e40e1c8fb46ed081a3e7bd5f93')
sha256sums_i686=('bde4de47acbe4bda74e68b2b6925726ac9fba2bc4cde2559603df7c25d23425c')
sha256sums_x86_64=('087f44b06b82bfe97fac85466ada458796d21316a5d6c2ebe5543110a5ea9037')
source_i686=(
  "${pkgname}-${_strver}-32.deb::https://github.com/ethereum/${pkgname}/releases/download/v${pkgver}/Mist-linux32-${_strver}.deb"
)
source_x86_64=(
  "${pkgname}-${_strver}-64.deb::https://github.com/ethereum/${pkgname}/releases/download/v${pkgver}/Mist-linux64-${_strver}.deb"

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
