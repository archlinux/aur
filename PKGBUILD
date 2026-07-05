# Maintainer: Ryno Kotze <lemon.xah@gmail.com>
pkgname=pithddu-dashboard-bin
pkgver=0.7.14
pkgrel=1
pkgdesc="SimHub companion app for the Pith DDU sim-racing dash (prebuilt binary)"
arch=('x86_64')
url="https://github.com/lemonxah/pithsim"
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
sha256sums=('0caad6aebf827dc97bdbd58d7195074a9b919d6cb1f6cec40f25255e1b695979'
            '4785e87d59ab617df0ecf11f006aee7db1c13bb55ab3cb0a964a57ca3bc33438')

package() {
  cd "$srcdir/pith-dashboard-linux-x86_64"
  install -Dm755 pith-dashboard "$pkgdir/usr/bin/pith-dashboard"
  install -Dm644 pith-dashboard.desktop "$pkgdir/usr/share/applications/pith-dashboard.desktop"
  install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/pith-dashboard.png"
  # udev rules for ALL Pith gear (DDU, handbrake, their ROM bootloaders) — the
  # app needs the hidraw nodes user-accessible out of the box. Ships in the
  # release tarball as 99-pith.rules (older tarballs: 99-pithddu.rules).
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
