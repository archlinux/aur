# Maintainer: Phaylali <admin@omniversify.com>

pkgname=omniversify-usb-wireless-drivers-lv-uw03
pkgver=1.2.1800.20241115
pkgrel=2
pkgdesc="DKMS driver for the PIX-LINK LV-UW03 USB WiFi adapter (ZTOP ZT9101, 350b:9101)"
arch=('x86_64')
url="https://github.com/phaylali/omniversify-usb-wireless-drivers"
license=('GPL-2.0-only')
depends=('dkms')
makedepends=('git')
provides=('zt9101-dkms')
conflicts=('zt9101-dkms')
# The driver is cfg80211/nl80211 and autoloads from its USB modalias via udev,
# so there is intentionally no init-system dependency and no .conf file shipped.
# That is what makes this work identically on systemd and on Artix (OpenRC/s6/
# runit/dinit), where /etc/modules-load.d would be silently ignored.
source=("$pkgname::git+https://github.com/phaylali/omniversify-usb-wireless-drivers.git#tag=v$pkgver")
sha256sums=('SKIP')
install="$pkgname.install"

# NOTE: this package contains no compiled code. It stages the source into
# /usr/src/zt9101-$pkgver and pacman's own DKMS hook
# (/usr/share/libalpm/hooks/70-dkms-install.hook) compiles and signs it for
# every installed kernel that has headers.

package() {
  local srcdir_repo="$srcdir/$pkgname"
  local dkmsdir="$pkgdir/usr/src/zt9101-$pkgver"

  # --- DKMS source tree ---------------------------------------------------
  # Must land at /usr/src/<PACKAGE_NAME>-<PACKAGE_VERSION>, because that is what
  # dkms.conf declares and what the alpm hook parses out of the path.
  install -d "$dkmsdir"
  cp -a "$srcdir_repo/src/." "$dkmsdir/"

  # --- firmware + config --------------------------------------------------
  # The driver reads these by absolute path (/usr/lib/zt9101/...). Relative
  # paths were the original bug: they resolve against the caller's cwd, which
  # is / at boot, so the config silently failed to open and scans found
  # nothing.
  install -Dm644 "$srcdir_repo/src/wifi.cfg" \
    "$pkgdir/usr/lib/zt9101/wifi.cfg"
  install -d "$pkgdir/usr/lib/zt9101/fw"
  install -m644 "$srcdir_repo"/src/fw/*.bin "$pkgdir/usr/lib/zt9101/fw/"

  # --- documentation ------------------------------------------------------
  install -Dm644 "$srcdir_repo/README.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir_repo/DEV_NOTES.md" \
    "$pkgdir/usr/share/doc/$pkgname/DEV_NOTES.md"
  install -Dm644 "$srcdir_repo/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
