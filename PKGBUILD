# Maintainer: Rakesh KP <rakeshkpk@gmail.com>
pkgname=symphonie-bin
pkgver=1.0.15
pkgrel=4 # Incremented to signal a new packaging fix
pkgdesc="A simple music player for local audio."
arch=('x86_64')
url="https://github.com/kprakesh1984/symphonie"
license=('MIT')
# These are the correct runtime dependencies for a pre-compiled Electron app
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libsecret')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

# We now include the icon as a local source file
source=("https://github.com/kprakesh1984/symphonie/releases/download/linux-aur-release-v${pkgver}/symphonie-${pkgver}.tar.gz"
        "symphonie.desktop"
        "512x512.png")

# Add 'SKIP' for the new icon file so updpkgsums can generate its checksum
sha256sums=('f35f6a4c3f37e15a47197e8f44426303d158b3c7ca41b42bea74c0ef3757b2f1'
            '0fc89a411f6c4c0b5881d2fad4bb5e5e4a24775664b2a44014493ae7acbd3031'
            '66d1d7932ff2c541ace259eca426f8557c4f5853f416562b2162d69e6b69b122')

# This is the corrected package() function
package() {
  # Install the main application files from the extracted tar.gz
  install -d "${pkgdir}/opt/${pkgname%-bin}"
  cp -r "${srcdir}/"* "${pkgdir}/opt/${pkgname%-bin}/"

  # Create the launch script
  install -d "${pkgdir}/usr/bin"
  echo "#!/bin/sh" > "${pkgdir}/usr/bin/${pkgname%-bin}"
  echo "exec /opt/${pkgname%-bin}/Symphonie \"\$@\"" >> "${pkgdir}/usr/bin/${pkgname%-bin}"
  chmod +x "${pkgdir}/usr/bin/${pkgname%-bin}"

  # Install the .desktop file from our sources
  install -Dm644 "${srcdir}/symphonie.desktop" "${pkgdir}/usr/share/applications/symphonie.desktop"

  # Install the icon from our sources, not from the extracted bundle
  install -Dm644 "${srcdir}/512x512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/symphonie.png"
}
