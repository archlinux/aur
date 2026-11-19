pkgname=samba-util-bin
pkgver=4.6.0
pkgrel=1
pkgdesc="A simple and modern GUI for managing Samba."
arch=('x86_64')
url="https://github.com/mijocecr/samba-util"
license=('MIT')

depends=(
  'samba'        # smbd, nmbd, testparm, smbpasswd, pdbedit
  'smbclient'    # smbclient, rpcclient (network discovery)
  'systemd'      # Service control
  'xdg-utils'    # xdg-open (open files and shared resources)
)

optdepends=(
  'cups: printing through Samba'
  'gvfs-smb: file manager integration and mounting of remote shares'
  'cifs-utils: CIFS utilities for manual mounts'
)

options=('!debug' '!strip')

source=("https://github.com/mijocecr/samba-util/releases/download/samba-util_v4.6.0/SAMBA-Util.tar.gz")

sha256sums=('27f5c9cb7f1597bee29b5cfc5998c873ac71a5d5fb51b328d37fddc080861d74')

package() {
  # Create the destination tree under /usr/lib
  install -d "$pkgdir/usr/lib/samba-util"

  # Copy only the application files needed (avoid duplicating the tarball or junk)
  find "$srcdir" -maxdepth 1 ! -name '.' ! -name '..' ! -name '*.tar.gz' -exec cp -r {} "$pkgdir/usr/lib/samba-util/" \;

  # Make sure the main binary is executable
  chmod +x "$pkgdir/usr/lib/samba-util/SAMBA-Util"

  # Create a symlink in /usr/bin for global execution
  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/samba-util/SAMBA-Util "$pkgdir/usr/bin/samba-util"

  # Install the desktop file and the icon with standard permissions (644)
  install -Dm644 "$srcdir/samba-util.desktop" "$pkgdir/usr/share/applications/samba-util.desktop"
  install -Dm644 "$srcdir/samba-util.png" "$pkgdir/usr/share/pixmaps/samba-util.png"
}
