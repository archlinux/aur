# Maintainer: jeryd leuck <jerydleuck@gmail.com>
pkgname=synology-drive-client-bin
pkgver=4.0.3_17892
_pkgver=4.0.3
_pkgrel=17892
pkgrel=3
pkgdesc="Official Synology Drive Client desktop application (official binary repack)"
arch=('x86_64')
url="https://www.synology.com/en-global/releaseNote/SynologyDriveClient"
license=('custom:Synology Linux License Grant')
depends=('glib2' 'glibc' 'qt5-base' 'qt5-wayland' 'curl' 'libarchive' 'libxkbcommon' 'libice' 'libsm' 'hicolor-icon-theme')
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
            '0dc43c10722976c544b92400bfcd53e6c0ddb70092d6b397cd146777770eaf18')

package() {
  # Extract data.tar.xz from the debian package
  cd "$srcdir"
  bsdtar -xf data.tar.xz -C "$pkgdir"

  # Create terminal symlinks (using -f to overwrite existing or messy links from the .deb)
  install -d "$pkgdir/usr/bin"
  ln -sf /opt/Synology/SynologyDrive/bin/launcher "$pkgdir/usr/bin/synology-drive"
  ln -sf /opt/Synology/SynologyDrive/bin/launcher "$pkgdir/usr/bin/synology-drive-client"

  # Install systemd user service
  install -Dm644 "$srcdir/synology-drive.service" "$pkgdir/usr/lib/systemd/user/synology-drive.service"

  # Install License
  install -Dm644 "$pkgdir/opt/Synology/SynologyDrive/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
