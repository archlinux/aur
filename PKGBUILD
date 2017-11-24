# Maintainer: Peter Petrov <onestone@gmail.com>
# Contributor: Afri 5chdn <aur@5chdn.co>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=mist
pkgver=0.9.3
_strver=0-9-3
pkgrel=1
pkgdesc="Ethereum wallet and Dapp browser."
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
sha256sums_i686=('1c7928dcd8b26126d0f6ab5aae7251da85b9adcdfa1b0b36ffb36f87c64977d8')
sha256sums_x86_64=('01e3df03dce3132f7521118e553468e0fad83f637233f1ff28cdaa7e5dffc245')
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
  sed -i 's/Categories=WebBrowser/Categories=Network;WebBrowser;/' "${pkgdir}/usr/share/applications/mist.desktop";

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
