# Maintainer: stef204 <stef204@yandex.com>

# This package pins Electron 36.6.0 specifically because it is the exact
# version required by Nyxt's cl-electron library (see _build/cl-electron/package.json).
# The electron36-bin package in AUR provides 36.9.x which may not be compatible.

pkgname=electron36.6-bin
pkgver=36.6.0
pkgrel=1
pkgdesc="Build cross platform desktop apps with web technologies - prebuilt binary (pinned for Nyxt)"
arch=('x86_64')
url='https://electronjs.org'
license=('MIT' 'BSD-3-Clause')
depends=('gtk3' 'nss' 'libxss' 'alsa-lib')
provides=('electron36=36.6.0')
conflicts=('electron36-bin')
options=('!strip')
source=("https://github.com/electron/electron/releases/download/v${pkgver}/electron-v${pkgver}-linux-x64.zip")
sha256sums=('6a0decb3e382f32d4ab3db90aabd082ef9ee1154fe205808f887e228fdb2d355')

package() {
  install -d "${pkgdir}/usr/lib/${pkgname}"
  bsdtar -xf "${srcdir}/electron-v${pkgver}-linux-x64.zip" -C "${pkgdir}/usr/lib/${pkgname}"

  # Create launcher script
  install -d "${pkgdir}/usr/bin"
  echo '#!/bin/sh' > "${pkgdir}/usr/bin/electron36"
  echo "exec /usr/lib/${pkgname}/electron \"\$@\"" >> "${pkgdir}/usr/bin/electron36"
  chmod 755 "${pkgdir}/usr/bin/electron36"

  # Fix chrome-sandbox permissions
  chmod 4755 "${pkgdir}/usr/lib/${pkgname}/chrome-sandbox"

  # Install license
  install -Dm644 "${pkgdir}/usr/lib/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${pkgdir}/usr/lib/${pkgname}/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
