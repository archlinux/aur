# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Corey Hinshaw <corey(at)electrickite(dot)org>
pkgname=system76-acpi-dkms
pkgver=1.0.2+4+gb49caa5
pkgrel=2
pkgdesc="This provides the system76_acpi in-tree driver for systems missing it."
arch=('x86_64')
url="https://github.com/pop-os/system76-acpi-dkms"
license=('GPL')
depends=('dkms')
makedepends=('git')
conflicts=('linux>=5.16')
_commit=b49caa557e6f902381ca76b6bb8f8a2825ad099b
source=("git+https://github.com/pop-os/system76-acpi-dkms.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed 's/-/+/g'
}

package() {
  cd "$srcdir/$pkgname"

  # Installation directory
  local install_dir="$pkgdir/usr/src/system76-acpi-${pkgver//+*/}"

  # Install source files
  for file in {Makefile,*.c,*.h}; do
    [ -f "$file" ] || continue
    install -D -m644 -t "$install_dir/" "$file"
  done

  # Install udev hwdb files
  install -Dm644 -t "$pkgdir/usr/lib/udev/hwdb.d/" lib/udev/hwdb.d/*

  # Edit and install dkms configuration
  sed "s/#MODULE_VERSION#/${pkgver//+*/}/" "debian/system76-acpi-dkms.dkms" > "$install_dir/dkms.conf"

  # Load the module at boot
  install -Dm644 "usr/share/initramfs-tools/modules.d/$pkgname.conf" \
    "$pkgdir/etc/modules-load.d/system76-acpi.conf"
}
