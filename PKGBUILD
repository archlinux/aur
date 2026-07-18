# Maintainer: Emanuele Sparvoli <sparvoli@gmail.com>
pkgbase=wireview-hwmon
pkgname=('wireview-hwmon' 'wireview-hwmon-dkms')
pkgver=1.5.1
pkgrel=1
pkgdesc="WireView Pro II hwmon daemon, CLI and DKMS kernel module"
arch=('x86_64')
url="https://github.com/emaspa/wireview-hwmon"
license=('GPL-2.0-only')
makedepends=('gcc')
options=('!debug')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b518f5f9a01bc6db238c362725e429d73ffb8b6c1eb59fd94303b484bcbbad56')

build() {
  cd "$pkgbase-$pkgver"
  # Userspace only — the kernel module is built on the user's machine by DKMS.
  cc -Wall -Wextra -Wno-format-truncation -O2 -o wireviewd wireviewd.c sha256.c
  cc -Wall -Wextra -O2 -o wireviewctl wireviewctl.c
}

package_wireview-hwmon() {
  pkgdesc="WireView Pro II hwmon daemon and CLI (userspace)"
  depends=('glibc')
  optdepends=('wireview-hwmon-dkms: kernel module exposing sensors via /sys/class/hwmon'
              'dfu-util: device firmware updates via "wireviewctl flash"')
  cd "$pkgbase-$pkgver"
  install -Dm755 wireviewd "$pkgdir/usr/bin/wireviewd"
  install -Dm755 wireviewctl "$pkgdir/usr/bin/wireviewctl"
  install -Dm644 debian/wireviewd.service "$pkgdir/usr/lib/systemd/system/wireviewd.service"
  install -Dm644 99-wireview-hwmon.rules "$pkgdir/usr/lib/udev/rules.d/99-wireview-hwmon.rules"
  install -Dm644 firmware/TG-WV-PRO2-FW.hex "$pkgdir/usr/share/wireview/TG-WV-PRO2-FW.hex"
  # The kernel module is a self-registering platform driver with no modalias,
  # so nothing autoloads it. Load it when the daemon starts (a no-op if the
  # dkms package isn't installed). Guarded so it stays a no-op should a future
  # release ship this line in the unit itself.
  grep -q '^ExecStartPre=' "$pkgdir/usr/lib/systemd/system/wireviewd.service" ||
    sed -i '/^ExecStart=/i ExecStartPre=-/sbin/modprobe wireview_hwmon' \
      "$pkgdir/usr/lib/systemd/system/wireviewd.service"
}

package_wireview-hwmon-dkms() {
  pkgdesc="WireView Pro II hwmon kernel module (DKMS)"
  depends=('dkms')
  cd "$pkgbase-$pkgver"
  # DKMS module source. The dkms pacman hooks build/install it on the host.
  install -Dm644 wireview_hwmon.c "$pkgdir/usr/src/$pkgbase-$pkgver/wireview_hwmon.c"
  install -Dm644 dkms.conf       "$pkgdir/usr/src/$pkgbase-$pkgver/dkms.conf"
  install -Dm644 Makefile.dkms   "$pkgdir/usr/src/$pkgbase-$pkgver/Makefile"
  # Platform driver has no device-triggered autoload — pull it in on boot.
  install -d "$pkgdir/usr/lib/modules-load.d"
  printf 'wireview_hwmon\n' > "$pkgdir/usr/lib/modules-load.d/wireview-hwmon.conf"
  chmod 644 "$pkgdir/usr/lib/modules-load.d/wireview-hwmon.conf"
}
