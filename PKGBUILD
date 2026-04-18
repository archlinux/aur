# Maintainer: dxnz <https://github.com/dxnz-id>
pkgname=pressplay-iris-v2-nearlink
pkgver=1.0.3
pkgrel=1
pkgdesc="Press Play IRIS V2 NearLink | Unofficial community mouse software driver for linux"
arch=('x86_64' 'arm64')
url="https://github.com/dxnz-id/pressplay-iris-v2-nearlink"
license=('MIT')
depends=('libnotify' 'libxtst' 'nss' 'atk' 'at-spi2-atk' 'libcups' 'libdrm' 'libxkbcommon' 'mesa' 'pango' 'alsa-lib')
makedepends=('npm' 'nodejs')
source=("git+${url}.git"
        "${pkgname}.desktop"
        "${pkgname}.sh"
        "99-iris.rules")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd "${pkgname}"
  npm install
}

build() {
  cd "${pkgname}"
  # Run build script if necessary (e.g., vite build)
  # Based on package.json, it seems to use electron-builder directly
  # We use 'dir' target to get unpacked files
  npx electron-builder --linux dir
}

package() {
  # Install the main app files to /opt
  install -d "${pkgdir}/opt/${pkgname}"
  cp -r "${srcdir}/${pkgname}/build-out/linux-unpacked/." "${pkgdir}/opt/${pkgname}/"

  # Install the launcher script
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  # Install the desktop entry
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install the icon
  install -Dm644 "${srcdir}/${pkgname}/dist/logo/hhk.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"

  # Install udev rules
  install -Dm644 "${srcdir}/99-iris.rules" "${pkgdir}/usr/lib/udev/rules.d/99-iris.rules"

  # Install license
  install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
