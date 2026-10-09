# Maintainer: Emanuele Sparvoli <sparvoli@gmail.com>
pkgbase=wireview-hwmon
pkgname=('wireview-hwmon' 'wireview-hwmon-dkms')
# Must match the top-level VERSION file ("make check-version").
pkgver=1.7.2
pkgrel=1
pkgdesc="WireView Pro II hwmon daemon, CLI and DKMS kernel module"
arch=('x86_64')
url="https://github.com/emaspa/wireview-hwmon"
license=('GPL-2.0-only')
makedepends=('gcc')
options=('!debug')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgbase.sysusers")
sha256sums=('dd7c705bbb099823a7987613da193e6c1cfafe8deeefeea23856d52ae8c7bd7f'
            'dec7ef8e8cc0bcfb7a692a0484b9df3fbd8909f89ee63658f1c3f77ab20d7660')

build() {
  cd "$pkgbase-$pkgver"
  # Userspace only — the kernel module is built on the user's machine by DKMS.
  # The Makefile picks up makepkg's CPPFLAGS/CFLAGS/LDFLAGS from the environment.
  make wireviewd wireviewctl
}

package_wireview-hwmon() {
  pkgdesc="WireView Pro II hwmon daemon and CLI (userspace)"
  depends=('glibc')
  # 1.7.0 shipped the firmware image in a package of its own
  replaces=('wireview-hwmon-firmware')
  conflicts=('wireview-hwmon-firmware')
  optdepends=('wireview-hwmon-dkms: kernel module exposing sensors via /sys/class/hwmon'
              'dfu-util: device firmware updates via "wireviewctl flash"')
  backup=('etc/wireview/config')
  cd "$pkgbase-$pkgver"
  install -Dm755 wireviewd "$pkgdir/usr/bin/wireviewd"
  install -Dm755 wireviewctl "$pkgdir/usr/bin/wireviewctl"
  install -Dm644 debian/wireviewd.service "$pkgdir/usr/lib/systemd/system/wireviewd.service"
  # Arch has no dialout group, its serial group is uucp, and udev drops a rule
  # line whose GROUP it cannot resolve. The grep fails the build if a future
  # rule stops matching the substitution.
  install -Dm644 99-wireview-hwmon.rules "$pkgdir/usr/lib/udev/rules.d/99-wireview-hwmon.rules"
  sed -i 's/GROUP="dialout"/GROUP="uucp"/g' "$pkgdir/usr/lib/udev/rules.d/99-wireview-hwmon.rules"
  grep -q 'GROUP="uucp"' "$pkgdir/usr/lib/udev/rules.d/99-wireview-hwmon.rules"
  install -Dm644 firmware/TG-WV-PRO2-FW.hex "$pkgdir/usr/share/wireview/TG-WV-PRO2-FW.hex"
  # Reference daemon config; private because it may hold the HMAC secret.
  install -dm700 "$pkgdir/etc/wireview"
  install -m600 wireview-config.sample "$pkgdir/etc/wireview/config"
  # wireview group: members may send wireviewd's privileged socket commands.
  # Created by the systemd-sysusers pacman hook.
  install -Dm644 "$srcdir/$pkgbase.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgbase.conf"
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
  # Version baked into dkms.conf and the module's MODULE_VERSION.
  install -Dm644 wireview_hwmon.c "$pkgdir/usr/src/$pkgbase-$pkgver/wireview_hwmon.c"
  sed "s/^PACKAGE_VERSION=.*/PACKAGE_VERSION=\"$pkgver\"/" dkms.conf \
    > "$pkgdir/usr/src/$pkgbase-$pkgver/dkms.conf"
  sed "s/@VERSION@/$pkgver/" Makefile.dkms > "$pkgdir/usr/src/$pkgbase-$pkgver/Makefile"
  chmod 644 "$pkgdir/usr/src/$pkgbase-$pkgver/"{dkms.conf,Makefile}
  # Platform driver has no device-triggered autoload — pull it in on boot.
  install -d "$pkgdir/usr/lib/modules-load.d"
  printf 'wireview_hwmon\n' > "$pkgdir/usr/lib/modules-load.d/wireview-hwmon.conf"
  chmod 644 "$pkgdir/usr/lib/modules-load.d/wireview-hwmon.conf"
}
