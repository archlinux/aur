# Maintainer: Rakesh KP <rakeshkpk@gmail.com>
pkgname=symphonie-bin
pkgver=1.0.15
pkgrel=1
pkgdesc="A simple music player built with Electron."
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
package() {
  # The downloaded tar.gz unpacks into a 'linux-unpacked' folder
  cd "${srcdir}/linux-unpacked"

  # Install the main application files to /opt/
  install -d "${pkgdir}/opt/${pkgname%-bin}"
  cp -r ./* "${pkgdir}/opt/${pkgname%-bin}/"

  # Create a launch script in /usr/bin that points to the real executable
  install -d "${pkgdir}/usr/bin"
  # Note: The executable is 'Symphonie', not 'symphonie'
  echo "#!/bin/sh" > "${pkgdir}/usr/bin/${pkgname%-bin}"
  echo "exec /opt/${pkgname%-bin}/Symphonie \"\$@\"" >> "${pkgdir}/usr/bin/${pkgname%-bin}"
  chmod +x "${pkgdir}/usr/bin/${pkgname%-bin}"

  # Install the .desktop file for application menus
  # The .desktop file is not in the tar.gz, so we provide it alongside the PKGBUILD
  install -Dm644 "${srcdir}/symphonie.desktop" "${pkgdir}/usr/share/applications/symphonie.desktop"

  # Install the application icon
  # The icon is inside the unpacked asar resources
  install -Dm644 "resources/app.asar.unpacked/assets/icons/linux/512x512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/symphonie.png"
}
