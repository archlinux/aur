# Maintainer: Hakan İSMAİL <hakanismail53@gmail.com>
# Pure web server build: no GTK, WebKit, tray or X11 libraries.
pkgname=rclone-manager-server
releasetag=0.3.6
pkgver=0.3.6
pkgrel=1
pkgdesc="Manage Rclone from your browser (pure web server, no GUI libraries)"
arch=('x86_64' 'aarch64')
url="https://github.com/Zarestia-Dev/rclone-manager"
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'dbus')
optdepends=('rclone: for cloud storage operations'
            'fuse3: for mounting remote filesystems')
options=('!strip' '!debug')
source_x86_64=("${url}/releases/download/headless-v${releasetag}/server-linux-x86_64-${pkgver}.zip")
source_aarch64=("${url}/releases/download/headless-v${releasetag}/server-linux-aarch64-${pkgver}.zip")
sha256sums_x86_64=('184659c364ff4338c0e5b0069a25d0dfb16c4744bdf1710c2dd762a939c5ccca')
sha256sums_aarch64=('3f76269bcef7210d41ba036ccf0180f3f4493ad334ac506af82386eb131bcaca')

package() {
  cd "${srcdir}/rclone-manager-server"

  install -Dm755 rclone-manager-server "${pkgdir}/usr/bin/rclone-manager-server"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Reuse the upstream unit, minus its manual /opt install notes, pointing at the packaged binary.
  sed -e '1,/^$/d' \
      -e 's|/opt/rclone-manager/rclone-manager-server|/usr/bin/rclone-manager-server|' \
      rclone-manager-server.service > unit.service
  grep -q '^ExecStart=/usr/bin/rclone-manager-server' unit.service
  install -Dm644 unit.service "${pkgdir}/usr/lib/systemd/system/rclone-manager-server.service"

  # Service account and its state directory, created by pacman's systemd hooks.
  install -dm755 "${pkgdir}/usr/lib/sysusers.d" "${pkgdir}/usr/lib/tmpfiles.d"
  echo 'u rclone-manager - "RClone Manager Server" /var/lib/rclone-manager /usr/bin/nologin' \
    > "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  echo 'd /var/lib/rclone-manager 0750 rclone-manager rclone-manager -' \
    > "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
