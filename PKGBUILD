# Maintainer: Rakesh KP <rakeshkpk@gmail.com>
pkgname=symphonie-bin
pkgver=1.0.15
pkgrel=2
pkgdesc="A simple music player for local audio."
arch=('x86_64')
url="https://github.com/kprakesh1984/symphonie"
license=('MIT')
depends=('electron')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

# This URL points directly to your specific GitHub release asset
source=("https://github.com/kprakesh1984/symphonie/releases/download/linux-aur-release-v${pkgver}/symphonie-${pkgver}.tar.gz")

# We will generate this checksum in the next step
sha256sums=('f35f6a4c3f37e15a47197e8f44426303d158b3c7ca41b42bea74c0ef3757b2f1')

# This function describes how to install the files
# This is the corrected package() function
package() {
  # The tar.gz extracts files directly into the current directory (${srcdir}).
  # We do NOT need to 'cd' into a subdirectory.

  # Install the main application files to /opt/symphonie
  install -d "${pkgdir}/opt/${pkgname%-bin}"
  cp -r "${srcdir}/"* "${pkgdir}/opt/${pkgname%-bin}/"

  # Create a launch script in /usr/bin that points to the real executable
  install -d "${pkgdir}/usr/bin"
  echo "#!/bin/sh" > "${pkgdir}/usr/bin/${pkgname%-bin}"
  echo "exec /opt/${pkgname%-bin}/Symphonie \"\$@\"" >> "${pkgdir}/usr/bin/${pkgname%-bin}"
  chmod +x "${pkgdir}/usr/bin/${pkgname%-bin}"

  # Install the .desktop file we provided alongside the PKGBUILD
  # This path is correct because it's relative to the PKGBUILD's location
  install -Dm644 "${srcdir}/symphonie.desktop" "${pkgdir}/usr/share/applications/symphonie.desktop"

  # Install the application icon
  # The path is now relative to the current directory (${srcdir})
  install -Dm644 "${srcdir}/resources/app.asar.unpacked/assets/icons/linux/512x512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/symphonie.png"
}
