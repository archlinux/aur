# Maintainer: Ryno Kotze <lemon.xah@gmail.com>
pkgname=pithddu-dashboard-bin
pkgver=0.7.7
pkgrel=1
pkgdesc="SimHub companion app for the Pith DDU sim-racing dash (prebuilt binary)"
arch=('x86_64')
url="https://github.com/lemonxah/pithddu"
license=('BSD-3-Clause')
# The Slint renderer is statically linked into the binary; only the winit/GL +
# HID/serial (libudev) runtime libs are needed.
depends=('fontconfig' 'freetype2' 'libxkbcommon' 'wayland' 'libglvnd' 'systemd-libs')
provides=("pithddu-dashboard=$pkgver" 'pith-dashboard')
conflicts=('pithddu-dashboard')
# Both assets come from the same dashboard-v* GitHub Release.
source=(
  "$pkgname-$pkgver.tar.gz::$url/releases/download/dashboard-v$pkgver/pith-dashboard-linux-x86_64.tar.gz"
  "$pkgname-shm-$pkgver.zip::$url/releases/download/dashboard-v$pkgver/pith-shm-tools-win64.zip"
)
sha256sums=('3c3fdb1d8ac85786ba4d3a47c634ea60a248a1744c4c21ecfd3c67d6696295a9'
            '39073d1ecacd71490ce160d5cf4c3e581c1856959782f34d2827d8204bb63ce2')

package() {
  cd "$srcdir/pith-dashboard-linux-x86_64"
  install -Dm755 pith-dashboard "$pkgdir/usr/bin/pith-dashboard"
  install -Dm644 pith-dashboard.desktop "$pkgdir/usr/share/applications/pith-dashboard.desktop"
  install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/pith-dashboard.png"

  # In-prefix shared-memory tools (Windows .exe, run under Proton/Wine) + the Steam
  # launch wrapper. pith-shim-run searches /usr/share/pithddu for the exes.
  cd "$srcdir/pith-shm-tools-win64"
  install -Dm644 pith-shim.exe "$pkgdir/usr/share/pithddu/pith-shim.exe"
  install -Dm644 pith-shmbridge.exe "$pkgdir/usr/share/pithddu/pith-shmbridge.exe"
  install -Dm755 pith-shim-run "$pkgdir/usr/bin/pith-shim-run"
}
