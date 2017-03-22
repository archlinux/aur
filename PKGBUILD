# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=spice-guest-tools-windows
pkgver=0.132
pkgrel=2
pkgdesc='Windows XP-10/2003-2016 guest drivers and agent for SPICE-enabled QEMU VMs'
arch=('any')
url="https://www.spice-space.org/"
license=('GPL2')
makedepends=('dos2unix' 'xorriso')
install=spice-guest-tools-windows.install
source=(${url}download/windows/spice-guest-tools/spice-guest-tools-${pkgver}/spice-guest-tools-${pkgver}.exe)
sha512sums=('dfd94af10cf2c8afc9344f69c87f6ec5141f82058a7a20d0d4a873d3693c8cda29497e058ab2f54294be571d8e7f1d0a7b1d779710eb9c601b0607228208b69f')

build() {
  cd "$srcdir"

  mkdir cdrom
  cat > cdrom/autorun.inf <<EOF
[autorun]
open=spice-guest-tools-${pkgver}.exe
label=SPICE Guest Tools ${pkgver}
EOF
  unix2dos cdrom/autorun.inf
  cp -aL spice-guest-tools-${pkgver}.exe cdrom
  mod_date="$(date -ud "$(stat -c %y cdrom/spice-guest-tools-${pkgver}.exe)" \
              +%Y%m%d%H%M%S%N | cut -c -16)"
  xorrisofs -V "SPICE Guest Tools ${pkgver}" -p "XORRISO, LIBISOBURN, LIBISOFS, LIBBURN" \
            --set_all_file_dates $mod_date --modification-date=$mod_date \
            -r -J -o spice-guest-tools.iso cdrom
}

package() {
  cd "$srcdir"

  install -d -m 755 "$pkgdir"/usr/share/spice-guest-tools
  install -m 444 spice-guest-tools.iso "$pkgdir"/usr/share/spice-guest-tools
}
