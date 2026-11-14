# Maintainer: 9M2PJU <https://hamradio.my>
pkgname=localfly-linux-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Your localhost, on the internet — bore tunnels with an Adwaita window + tray (prebuilt)"
arch=('x86_64' 'aarch64')
url="https://github.com/9M2PJU/localfly-linux"
license=('MIT')
depends=('python-gobject' 'gtk4' 'libadwaita' 'curl' 'hicolor-icon-theme')
provides=('localfly-linux')
conflicts=('localfly-linux' 'localfly-linux-git')
source_x86_64=("localfly-v0.1.0-x86_64-unknown-linux-gnu.tar.gz::https://github.com/9M2PJU/localfly-linux/releases/download/v0.1.0/localfly-v0.1.0-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('4aa0cddd0fe5cc8bf70aa96c2e1bfa61dfdce15cf1613e46cd3e1d37fb0435f9')
source_aarch64=("localfly-v0.1.0-aarch64-unknown-linux-gnu.tar.gz::https://github.com/9M2PJU/localfly-linux/releases/download/v0.1.0/localfly-v0.1.0-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('ebbc287b059cf06e01638ef6c736c68d8b57ba4f528eeb502efc1274f08690c3')
# GUI sources pinned to the release tag (tarballs ship the CLI only).
source+=("localfly_backend.py::https://raw.githubusercontent.com/9M2PJU/localfly-linux/v0.1.0/gui/localfly_backend.py"
         "localfly_gui.py::https://raw.githubusercontent.com/9M2PJU/localfly-linux/v0.1.0/gui/localfly_gui.py"
         "sni.py::https://raw.githubusercontent.com/9M2PJU/localfly-linux/v0.1.0/gui/sni.py"
         "localfly-gui::https://raw.githubusercontent.com/9M2PJU/localfly-linux/v0.1.0/gui/localfly-gui"
         "com.localfly.Localfly.desktop::https://raw.githubusercontent.com/9M2PJU/localfly-linux/v0.1.0/com.localfly.Localfly.desktop")
sha256sums=('0996c525d1553a3b1ea1b28eb5ee7946e20c184a997ef53746247a41013a99ce'
            'f387fa5a39745de7ac5891103c2de8470f2c4006cf98fd308b5e61013bd85282'
            'd3e7c3d6a84e42c8d595bbf7d19cfb1768e5ee74628d3c1b29a9c0c549eda13b'
            'f1d652c688a45ea7174ccf979ca2e495a11670f4566e11bbe9eb15fcdcafe344'
            '5b549ad26df7d75d29f7de2d8ea8d02441aaf8c8d929e6a4e8fea5c0c40b34b6')

package() {
  # Release tarball extracts to localfly-v0.1.0-<target>/.
  install -Dm755 localfly-v0.1.0-*/localfly "$pkgdir/usr/bin/localfly"
  install -Dm755 localfly-gui "$pkgdir/usr/bin/localfly-gui"
  install -Dm644 localfly_backend.py "$pkgdir/usr/share/localfly/gui/localfly_backend.py"
  install -Dm644 localfly_gui.py "$pkgdir/usr/share/localfly/gui/localfly_gui.py"
  install -Dm644 sni.py "$pkgdir/usr/share/localfly/gui/sni.py"
  install -Dm644 com.localfly.Localfly.desktop "$pkgdir/usr/share/applications/com.localfly.Localfly.desktop"
  # Tarball unit targets a cargo install; point packaged installs at /usr/bin.
  sed 's|^ExecStart=.*|ExecStart=/usr/bin/localfly up|' localfly-v0.1.0-*/localfly.service \
    > localfly.service.pkg
  install -Dm644 localfly.service.pkg "$pkgdir/usr/lib/systemd/user/localfly.service"
}
