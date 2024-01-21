# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Co-Maintainer: Tony Lambiris <tony@libpcap.net>
# Contributor: Shaleen Jain <shaleen(at)jain(dot)sh>
pkgname=system76-dkms-git
pkgver=1.0.13.r4.g8c2ff21
pkgrel=1
pkgdesc="On newer System76 laptops, this driver controls some of the hotkeys and allows for custom fan control."
arch=('x86_64')
url="https://github.com/pop-os/system76-dkms"
license=('GPL-2.0-or-later')
depends=('dkms')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/system76-dkms.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

package() {
  cd "${pkgname%-git}"
  local install_dir="$pkgdir/usr/src/system76-${pkgver//.r*/}"

  # Install source files
  for file in {Makefile,*.c,*.h}; do
    [ -f "$file" ] || continue
    install -Dm644 -t "$install_dir/" "$file"
  done

  # Install udev hwdb files
  install -Dm644 lib/udev/hwdb.d/*.hwdb -t "$pkgdir/usr/lib/udev/hwdb.d/"

  # Edit and install dkms configuration
  sed "s/#MODULE_VERSION#/${pkgver//.r*/}/" "debian/${pkgname%-git}.dkms" > "$install_dir/dkms.conf"

  # Load the module at boot
  install -Dm644 "usr/share/initramfs-tools/modules.d/${pkgname%-git}.conf" \
    "$pkgdir/etc/modules-load.d/system76.conf"
}
