# Maintainer: firlin123 <firlin123@gmail.com>

pkgname=steamdeck-dkms
_tag='f9c0a828b9c1b6c0ce16311822389b8d1c65eb54' # git rev-parse v${_tag_name}
pkgver=6.8.12.valve2
pkgrel=1
pkgdesc='Steam Deck EC sensors driver (DKMS)'
url='https://github.com/firlin123/steamdeck-dkms'
arch=('x86_64')
license=('GPL')
depends=('dkms')
makedepends=('git')
conflicts=('jupiter-dkms')
source=("git+https://github.com/firlin123/steamdeck-dkms.git#tag=${_tag}")
b2sums=('SKIP')

package() {
  cd "steamdeck-dkms"

  # Installation directory
  local install_dir="$pkgdir/usr/src/steamdeck-${pkgver//+*/}"

  # Install source files
  for file in {Makefile,*.c,*.h}; do
    [ -f "$file" ] || continue
    install -D -m644 -t "$install_dir/" "$file"
  done

  # Edit and install dkms configuration
  sed "s/#MODULE_VERSION#/${pkgver//+*/}/" "debian/steamdeck-dkms.dkms" > "$install_dir/dkms.conf"

  # Install modules-load configuration
  install -Dm644 "usr/share/initramfs-tools/modules.d/steamdeck-dkms.conf" "$pkgdir/etc/modules-load.d/steamdeck-modules.conf"
}

# vim: ts=2 sw=2 et:
