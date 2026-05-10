# Maintainer: Meredith V. <delightful.device@pm.me>

pkgname=wrlcatcontrol-bin
pkgver=1.1.3
pkgrel=1
pkgdesc="World Radio League CAT Control application"
arch=('x86_64')
url="https://worldradioleague.com"
license=('LicenseRef-upstream-proprietary')
pkgdesc="CAT (Computer Aided Transceiver) Control allows World Radio League to communicate directly with your radio."

install=wrlcatcontrol-bin.install

depends=(
  'java-runtime'
  'libusb'
  'glibc'
  'lib32-glibc'
  'lib32-gcc-libs'
  'gtk3'
  'nss'
  'at-spi2-core'
  'libdrm'
  'alsa-lib'
)

optdepends=(
  'hamlib: CAT control backend support'
)

provides=('wrl-cat-control')
conflicts=('wrl-cat-control')

source=(
  "WRLCatControl_${pkgver}_Linux.deb::https://storage.googleapis.com/world-radio-league-prod.appspot.com/CatControl/WRLCatControl_${pkgver}_Linux.deb"
  "wrl-cat-control.desktop"
  "wrlcatcontrol-bin.install"
)

sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

package() {
  cd "${srcdir}"

  # Extract Debian package
  bsdtar -xf "WRLCatControl_${pkgver}_Linux.deb"

  # Extract filesystem contents
  bsdtar -xf data.tar.xz -C "${pkgdir}"

  # Ensure binaries are executable
  find "${pkgdir}/usr/bin" -type f -exec chmod 755 {} \; 2>/dev/null || true

  install -Dm644 wrl-cat-control.desktop \
  "${pkgdir}/usr/share/applications/wrl-cat-control.desktop"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"

  cat > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" << EOF
WRLCatControl is proprietary software.

For licensing terms and usage restrictions, see the upstream developer:

https://worldradioleague.com
EOF
}

