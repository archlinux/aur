# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Corey Hinshaw <corey(at)electrickite(dot)org>
pkgname=system76-acpi-dkms
pkgver=1.0.2+23+gadd8f71
pkgrel=1
pkgdesc="Provides the system76_acpi in-tree driver for systems missing it."
arch=('x86_64')
url="https://github.com/pop-os/system76-acpi-dkms"
license=('GPL-2.0-or-later')
depends=('dkms')
makedepends=('git')
_commit=add8f71c7986230f50ddb4a25d702d6635a4f1bb
source=("git+https://github.com/pop-os/system76-acpi-dkms.git#commit=${_commit}"
        "$pkgname.conf")
sha256sums=('5f1dcc22ee5bc4b619540649e997aecb0ce20a5ce88124b98e96780769496bdb'
            'ae5fe704761f5ff7d7a4e161044a27c6346854f17e3bd5476e863ad4e1ec8d6b')

pkgver() {
  cd "$pkgname"
  git describe --tags --abbrev=7 | sed 's/-/+/g'
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

  # Edit and install dkms configuration
  sed "s/#MODULE_VERSION#/${pkgver//+*/}/" \
    "$srcdir/$pkgname.conf" > "$install_dir/dkms.conf"

  # Load the module at boot
  install -Dm644 "usr/share/initramfs-tools/modules.d/$pkgname.conf" \
    "$pkgdir/usr/lib/modules-load.d/system76-acpi.conf"
}
