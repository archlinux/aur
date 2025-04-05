# Maintainer: Mopigames <mopigames@proton.me>

pkgname=betterx-desktop-git
_pkgname=BetterX-Desktop
pkgver=1.0.1.alpha.r7.g6ac6640
pkgrel=1
pkgdesc="Desktop application for BetterX, enhancing your X-perience"
arch=('x86_64')
url="https://github.com/Feur-Inc/BetterX-Desktop"
license=('GPL3')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libxtst' 'libnotify' 'electron' 'libxcrypt-compat')  # Added libxcrypt-compat
makedepends=('git' 'bun' 'python' 'ruby' 'base-devel')  # Added ruby and base-devel for fpm
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha256sums=('SKIP')
options=('!strip')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' || echo "1.0.1.alpha.r0.g$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  bun install
}

build() {
  cd "${srcdir}/${_pkgname}"
  bun run build:arch
}

package() {
  cd "${srcdir}/${_pkgname}"
  
  # Create directories
  install -dm755 "${pkgdir}/usr/lib/${pkgname%-git}"
  install -dm755 "${pkgdir}/usr/bin"

  # Copy app contents
  cp -r dist/linux-unpacked/* "${pkgdir}/usr/lib/${pkgname%-git}"

  # Create launcher script
  cat > "${pkgdir}/usr/bin/${pkgname%-git}" << EOF
#!/bin/sh
exec electron /usr/lib/${pkgname%-git}/resources/app.asar "\$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/${pkgname%-git}"

  # Install desktop file
  install -Dm644 /dev/null "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
  cat > "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop" << EOF
[Desktop Entry]
Name=BetterX Desktop
Exec=${pkgname%-git}
Icon=${pkgname%-git}
Type=Application
Categories=Network;
EOF

  # Install icon
  install -Dm644 "src/resources/betterX.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-git}.png"

  # Remove conflicting files if they exist (for upgrades)
  rm -f "${pkgdir}/usr/share/applications/BetterX-Desktop.desktop"
  rm -f "${pkgdir}/usr/share/icons/hicolor/512x512/apps/BetterX-Desktop.png"
}

# Optionally, you can add this function to create a separate debug package
package_betterx-desktop-git-debug() {
  pkgdesc="Debugging symbols for ${pkgname%-git}"
  depends=("${pkgname%-git}=${pkgver}")
  options=('!strip')

  cd "${srcdir}/${_pkgname}"
  install -Dm644 dist/linux-unpacked/betterx-desktop.debug "${pkgdir}/usr/lib/debug/usr/lib/${pkgname%-git}/betterx-desktop.debug"
}
