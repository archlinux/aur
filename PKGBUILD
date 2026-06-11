# Maintainer: Emanuele Sparvoli <sparvoli@gmail.com>
pkgbase=wireview-hwmon
pkgname=('wireview-hwmon' 'wireview-hwmon-dkms')
pkgver=1.4.1
pkgrel=1
pkgdesc="WireView Pro II hwmon daemon, CLI and DKMS kernel module"
arch=('x86_64')
url="https://github.com/emaspa/wireview-hwmon"
license=('GPL-2.0-only')
makedepends=('gcc')
options=('!debug')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5065356d60c92649a9272b7875659853815eb557f18270a7d8c65cf895e57b13')

build() {
  cd "$pkgbase-$pkgver"
  # Userspace only — the kernel module is built on the user's machine by DKMS.
  cc -Wall -Wextra -Wno-format-truncation -O2 -o wireviewd wireviewd.c
  cc -Wall -Wextra -O2 -o wireviewctl wireviewctl.c
}

package_wireview-hwmon() {
  pkgdesc="WireView Pro II hwmon daemon and CLI (userspace)"
  depends=('glibc')
  optdepends=('wireview-hwmon-dkms: kernel module exposing sensors via /sys/class/hwmon')
  cd "$pkgbase-$pkgver"
  install -Dm755 wireviewd "$pkgdir/usr/bin/wireviewd"
  install -Dm755 wireviewctl "$pkgdir/usr/bin/wireviewctl"
  install -Dm644 debian/wireviewd.service "$pkgdir/usr/lib/systemd/system/wireviewd.service"
  install -Dm644 99-wireview-hwmon.rules "$pkgdir/usr/lib/udev/rules.d/99-wireview-hwmon.rules"
}

package_wireview-hwmon-dkms() {
  pkgdesc="WireView Pro II hwmon kernel module (DKMS)"
  depends=('dkms')
  cd "$pkgbase-$pkgver"
  # DKMS module source. The dkms pacman hooks build/install it on the host.
  install -Dm644 wireview_hwmon.c "$pkgdir/usr/src/$pkgbase-$pkgver/wireview_hwmon.c"
  install -Dm644 dkms.conf       "$pkgdir/usr/src/$pkgbase-$pkgver/dkms.conf"
  install -Dm644 Makefile.dkms   "$pkgdir/usr/src/$pkgbase-$pkgver/Makefile"
}
