# Maintainer: jeryd leuck <jerydleuck@gmail.com>
pkgname=synology-drive-client-bin
pkgver=4.0.3_17892
_pkgver=4.0.3
_pkgrel=17892
pkgrel=5
pkgdesc="Official Synology Drive Client desktop application (official binary repack)"
arch=('x86_64')
url="https://www.synology.com/en-global/releaseNote/SynologyDriveClient"
license=('custom:Synology Linux License Grant')
depends=('glib2' 'glibc' 'qt5-base' 'qt5-wayland' 'curl' 'libarchive' 'libxkbcommon' 'libice' 'libsm' 'hicolor-icon-theme')
makedepends=('patchelf')
optdepends=('nautilus: For nautilus integration'
            'dolphin: For dolphin integration'
            'nemo: For nemo integration')
provides=("synology-drive=${pkgver}" "synology-drive-client=${pkgver}")
conflicts=('synology-drive' 'synology-drive-client')
replaces=('synology-drive')
options=('!strip' '!debug')
install=${pkgname}.install
filename="synology-drive-client-${_pkgrel}.deb"
source=("${filename}::https://global.synologydownload.com/download/Utility/SynologyDriveClient/${_pkgver}-${_pkgrel}/Ubuntu/Installer/synology-drive-client-${_pkgrel}.x86_64.deb"
        "synology-drive.service")
sha256sums=('f6aec5a5974d59963ed833fdf1a0cc7bebd612d8691f491c62cba770cdc78d67'
            '569f3ba5a1fc972eee9fc01ce028d68ad7b75e79ff30e3f719237dd41412243c')

package() {
  # Extract data.tar.xz from the debian package
  cd "$srcdir"
  bsdtar -xf data.tar.xz -C "$pkgdir"

  # Create terminal symlinks (using -f to overwrite existing or messy links from the .deb)
  install -d "$pkgdir/usr/bin"
  ln -sf /opt/Synology/SynologyDrive/bin/launcher "$pkgdir/usr/bin/synology-drive"
  ln -sf /opt/Synology/SynologyDrive/bin/launcher "$pkgdir/usr/bin/synology-drive-client"

  # Fix library paths using patchelf
  # The daemon and other utilities need libraries from their respective lib directories
  local cloudstation_bin="$pkgdir/opt/Synology/SynologyDrive/package/cloudstation/bin"
  local main_bin="$pkgdir/opt/Synology/SynologyDrive/bin"

  echo "Patching RPATH for cloudstation binaries..."
  for bin in "$cloudstation_bin"/*; do
    if [[ -x "$bin" && -f "$bin" ]]; then
      patchelf --set-rpath '$ORIGIN/../lib' "$bin" 2>/dev/null || true
    fi
  done

  echo "Patching RPATH for main binaries..."
  for bin in "$main_bin"/*; do
    if [[ -x "$bin" && -f "$bin" ]]; then
      patchelf --set-rpath '$ORIGIN/../lib' "$bin" 2>/dev/null || true
    fi
  done

  # Fix RPATH for plugins as well
  find "$pkgdir/opt/Synology/SynologyDrive" -name "*.so*" -exec patchelf --set-rpath '$ORIGIN/../lib:$ORIGIN/../../../lib' {} \; 2>/dev/null || true

  # Install systemd user service
  install -Dm644 "$srcdir/synology-drive.service" "$pkgdir/usr/lib/systemd/user/synology-drive.service"

  # Install License
  install -Dm644 "$pkgdir/opt/Synology/SynologyDrive/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
