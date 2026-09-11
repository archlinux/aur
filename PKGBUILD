# Maintainer: Ryno Kotze <lemon.xah@gmail.com>
# Successor of pithddu-dashboard-bin: the app now drives every Pith device
# (DDU dash, handbrake, active pedals + the DIY FFB pedals over serial), so the
# package is named after the project, not the first device.
pkgname=pithsim-bin
pkgver=0.8.3
pkgrel=1
pkgdesc="Pith sim-racing dashboard: telemetry, profiles and device setup for the Pith DDU, handbrake and FFB pedals (prebuilt binary)"
arch=('x86_64')
url="https://github.com/lemonxah/pithsim"
license=('BSD-3-Clause')
# The Slint renderer is statically linked into the binary; only the winit/GL +
# HID/serial (libudev) runtime libs are needed.
depends=('fontconfig' 'freetype2' 'libxkbcommon' 'wayland' 'libglvnd' 'systemd-libs')
optdepends=('esptool: reflash a device from ROM download mode'
            'wine: run the in-prefix shared-memory shim for Proton games')
provides=("pithsim=$pkgver" "pithddu-dashboard=$pkgver" 'pith-dashboard')
conflicts=('pithsim' 'pithddu-dashboard' 'pithddu-dashboard-bin')
install=pithsim-bin.install
replaces=('pithddu-dashboard-bin')
# Both assets come from the same dashboard-v* GitHub Release.
source=(
  "$pkgname-$pkgver.tar.gz::$url/releases/download/dashboard-v$pkgver/pith-dashboard-linux-x86_64.tar.gz"
  "$pkgname-shm-$pkgver.zip::$url/releases/download/dashboard-v$pkgver/pith-shm-tools-win64.zip"
)
sha256sums=('d5d8a9f541fb917302039c5bfe06cf090f62e8642ccd6f198056f6f0da594198'
            'ddbecc0c998a5f6653ee852246cced562b6af1666ad56b3a4e681c178d046797')

package() {
  cd "$srcdir/pith-dashboard-linux-x86_64"
  install -Dm755 pith-dashboard "$pkgdir/usr/bin/pith-dashboard"
  install -Dm644 pith-dashboard.desktop "$pkgdir/usr/share/applications/pith-dashboard.desktop"
  install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/pith-dashboard.png"
  # udev rules for ALL Pith gear (DDU, handbrake, pedals, the DIY FFB pedals'
  # serial bridge, and the ROM bootloaders) — the app needs the hidraw/tty
  # nodes user-accessible out of the box. Ships in the release tarball as
  # 99-pith.rules (older tarballs: 99-pithddu.rules).
  if [ -f 99-pith.rules ]; then
    install -Dm644 99-pith.rules "$pkgdir/usr/lib/udev/rules.d/99-pith.rules"
  elif [ -f 99-pithddu.rules ]; then
    install -Dm644 99-pithddu.rules "$pkgdir/usr/lib/udev/rules.d/99-pith.rules"
  fi

  # In-prefix shared-memory tools (Windows .exe, run under Proton/Wine) + the Steam
  # launch wrapper. This is just the package's canonical copy — pith-shim-run
  # mirrors it into ~/.local/share/pithddu at runtime and injects from there,
  # since Steam's sandbox doesn't reliably expose /usr/share/pithddu to the game.
  cd "$srcdir/pith-shm-tools-win64"
  install -Dm644 pith-shim.exe "$pkgdir/usr/share/pithddu/pith-shim.exe"
  install -Dm644 pith-shmbridge.exe "$pkgdir/usr/share/pithddu/pith-shmbridge.exe"
  install -Dm755 pith-shim-run "$pkgdir/usr/bin/pith-shim-run"
}
