# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Corey Hinshaw <corey(at)electrickite(dot)org>
pkgname=system76-acpi-dkms
pkgver=1.0.2+12+g03a5804
pkgrel=1
pkgdesc="This provides the system76_acpi in-tree driver for systems missing it."
arch=('x86_64')
url="https://github.com/pop-os/system76-acpi-dkms"
license=('GPL-2.0-or-later')
depends=('dkms')
makedepends=('git')
_commit=03a5804847a64fd977989316ea25082e2766723e  # branch/master
source=("git+https://github.com/pop-os/system76-acpi-dkms.git#commit=${_commit}"
        "$pkgname.conf")
sha256sums=('SKIP'
            'ae5fe704761f5ff7d7a4e161044a27c6346854f17e3bd5476e863ad4e1ec8d6b')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/-/+/g'
}

package() {
  cd "$pkgname"

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
  sed "s/#MODULE_VERSION#/${pkgver//+*/}/" \
    "$srcdir/$pkgname.conf" > "$install_dir/dkms.conf"

  # Load the module at boot
  install -Dm644 "usr/share/initramfs-tools/modules.d/$pkgname.conf" \
    "$pkgdir/etc/modules-load.d/system76-acpi.conf"
}
