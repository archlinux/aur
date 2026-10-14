# Maintainer: Emanuele Sparvoli <sparvoli@gmail.com>
pkgbase=wireview-hwmon
pkgname=('wireview-hwmon' 'wireview-hwmon-dkms')
# Must match the top-level VERSION file ("make check-version").
pkgver=1.8.0
pkgrel=1
pkgdesc="WireView Pro II hwmon daemon, CLI and DKMS kernel module"
arch=('x86_64')
url="https://github.com/emaspa/wireview-hwmon"
license=('GPL-2.0-only')
makedepends=('gcc')
options=('!debug')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgbase.sysusers"
        "$pkgbase.tmpfiles")
sha256sums=('bcc2b0b206d5570dd38b624ec85885952c0cd8067f6554157e66f9b55c1589e0'
            'dec7ef8e8cc0bcfb7a692a0484b9df3fbd8909f89ee63658f1c3f77ab20d7660'
            '01ca092a9409307d362c4edbe4421d21837b02f7de443cc34c053284952407cf')

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
  # Arch has no dialout group, its serial group is uucp. The serial port gets
  # uucp from Arch's default rules; the DFU bootloader line names dialout,
  # which udev would drop with a log message. The grep fails the build if a
  # future rule stops matching the substitution.
  install -Dm644 99-wireview-hwmon.rules "$pkgdir/usr/lib/udev/rules.d/99-wireview-hwmon.rules"
  sed -i 's/GROUP="dialout"/GROUP="uucp"/g' "$pkgdir/usr/lib/udev/rules.d/99-wireview-hwmon.rules"
  grep -q 'GROUP="uucp"' "$pkgdir/usr/lib/udev/rules.d/99-wireview-hwmon.rules"
  install -Dm644 firmware/TG-WV-PRO2-FW.hex "$pkgdir/usr/share/wireview/TG-WV-PRO2-FW.hex"
  # Reference daemon config; closed to others because it may hold the HMAC
  # secret. Group wireview, which may edit it, comes from the tmpfiles entry
  # below (the group does not exist when the package is built).
  install -dm750 "$pkgdir/etc/wireview"
  install -m660 wireview-config.sample "$pkgdir/etc/wireview/config"
  # wireview group: members may send wireviewd's privileged socket commands
  # and edit /etc/wireview/config. Created by the systemd-sysusers pacman hook.
  install -Dm644 "$srcdir/$pkgbase.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgbase.conf"
  # root:wireview on /etc/wireview and its config, applied by the
  # systemd-tmpfiles pacman hook, which runs after the sysusers one, on
  # install and upgrade (an upgrade from the root-only 0700/0600 layout is
  # fixed too, a kept backup= file included).
  install -Dm644 "$srcdir/$pkgbase.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgbase.conf"
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
