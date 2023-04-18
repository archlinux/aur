# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Corey Hinshaw <coreyhinshaw(at)gmail(dot)com>
pkgname=system76-dkms
pkgver=1.0.13+2+g78ede46
pkgrel=1
pkgdesc="On newer System76 laptops, this driver controls some of the hotkeys and allows for custom fan control."
arch=('x86_64')
url="https://github.com/pop-os/system76-dkms"
license=('GPL2')
depends=('dkms')
makedepends=('git')
_commit=78ede46c30f3bdb38d6acec5bc3fe982703ade17
source=("git+https://github.com/pop-os/system76-dkms.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed 's/-/+/g'
}

package() {
  cd "$srcdir/$pkgname"
  local install_dir="$pkgdir/usr/src/system76-${pkgver//+*/}"

  # Install source files
  for file in {Makefile,*.c,*.h}; do
    [ -f "$file" ] || continue
    install -Dm644 -t "$install_dir/" "$file"
  done

  # Install udev hwdb files
  install -Dm644 lib/udev/hwdb.d/*.hwdb -t "$pkgdir/usr/lib/udev/hwdb.d/"

  # Edit and install dkms configuration
  sed "s/#MODULE_VERSION#/${pkgver//+*/}/" "debian/$pkgname.dkms" > "$install_dir/dkms.conf"

  # Load the module at boot
  install -Dm644 "usr/share/initramfs-tools/modules.d/$pkgname.conf" \
    "$pkgdir/usr/lib/modules-load.d/system76.conf"
}
