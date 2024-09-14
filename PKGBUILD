# Maintainer: firlin123 <firlin123@gmail.com>

pkgname=jupiter-dkms
_tag='f4545384339049d03a11f94f774c33de837abf2d' # git rev-parse v${_tag_name}
pkgver=6.1.9.valve2
pkgrel=1
pkgdesc='Jupiter ACPI platform driver (DKMS)'
url='https://github.com/firlin123/jupiter-dkms'
arch=('x86_64')
license=('GPL')
depends=('dkms')
makedepends=('git')
conflicts=('steamdeck-dkms')
source=("git+https://github.com/firlin123/jupiter-dkms.git#tag=${_tag}")
b2sums=('SKIP')

package() {
  cd "jupiter-dkms"

  # Installation directory
  local install_dir="$pkgdir/usr/src/jupiter-${pkgver//+*/}"

  # Install source files
  for file in {Makefile,*.c,*.h}; do
    [ -f "$file" ] || continue
    install -D -m644 -t "$install_dir/" "$file"
  done

  # Edit and install dkms configuration
  sed "s/#MODULE_VERSION#/${pkgver//+*/}/" "debian/jupiter-dkms.dkms" > "$install_dir/dkms.conf"

  # Install modules-load configuration
  install -Dm644 "usr/share/initramfs-tools/modules.d/jupiter-dkms.conf" "$pkgdir/etc/modules-load.d/jupiter-modules.conf"
}

# vim: ts=2 sw=2 et:
