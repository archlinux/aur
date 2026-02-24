# Maintainer: Regaan <regaan48@gmail.com>
pkgname=wshawk
_pkgname=wshawk
pkgver=3.0.1
pkgrel=1
pkgdesc="Enterprise-grade WebSocket security scanner & Web Penetration Testing Toolkit (Binary Release)"
arch=('x86_64')
url="https://github.com/noobforanonymous/wshawk"
license=('ISC')
# Note: The binary release from GitHub already includes its own node_modules/electron
# but still requires system libraries like nss, alsa, etc.
depends=('nss' 'alsa-lib' 'gtk3' 'libxss')
provides=('wshawk-desktop')
conflicts=('wshawk-git')
source=("${pkgname}-${pkgver}.pacman::https://github.com/noobforanonymous/wshawk/releases/download/v${pkgver}/wshawk-${pkgver}.pacman")
sha256sums=('71e2779332842c7900e00c4c7ea16f772473d451118716a96c75e85a6caf748c')

package() {
  # The .pacman file is a compressed archive containing the folder structure
  # We extract it and move it to the package directory
  
  msg2 "Extracting and installing binary assets..."
  
  # Copy the /usr folder from the archive (contains bin, lib, and share)
  if [ -d usr ]; then
    cp -rp usr "$pkgdir/"
  fi

  # Copy the /opt folder if present (some versions of electron-builder use /opt)
  if [ -d opt ]; then
    cp -rp opt "$pkgdir/"
  fi
  
  # Ensure the sidecar has execute permissions
  # WSHawk usually puts it in /usr/lib/wshawk/bin/ or similar
  find "$pkgdir" -name "wshawk-bridge" -exec chmod +x {} +
}
