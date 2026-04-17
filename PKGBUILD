# Maintainer: Alfonso Espadero Jr <arch@alias.alfelfriki.tech>

pkgname=nanoedgeaistudio
pkgver=5.1.1
pkgrel=1
pkgdesc="NanoEdge AI in your MCU"
arch=('x86_64')
url="https://stm32ai.st.com/download-nanoedgeai/"
license=('custom')
depends=(
  'at-spi2-core'
  'gtk3'
  'libnotify'
  'libsecret'
  'libxss'
  'libxtst'
  'nss'
  'util-linux-libs'
  'xdg-utils'
)
optdepends=('libappindicator-gtk3: tray icon support')
options=('!strip')

_pkg_file_name="nanoedgeaistudio_${pkgver}_amd64.deb"

if [[ ! -f "${PWD}/${_pkg_file_name}" ]]; then
  echo ""
  echo "Package not found!"
  echo "Download ${_pkg_file_name} from:"
  echo "  ${url}"
  echo "and place it in the build directory (${PWD}) before running makepkg."
  echo ""
fi

source=("local://${_pkg_file_name}")
sha256sums=('f3b3c2f1ee2363c2d0b99ec989669499b0bd4ab9a9ad196506e735c9e28b8d21')

package() {
  cd "${srcdir}"

  # Extract payload from Debian package.
  ar p "${_pkg_file_name}" data.tar.xz | bsdtar -xf - -C "${pkgdir}"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/NanoEdge AI Studio/nanoedgeaistudio" "${pkgdir}/usr/bin/${pkgname}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${pkgdir}/opt/NanoEdge AI Studio/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  install -Dm644 "${pkgdir}/opt/NanoEdge AI Studio/LICENSES.chromium.html" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
