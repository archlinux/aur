# Copyright 2025 Tim Hildering

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# Maintainer: Tim Hildering <hilderingt@posteo.net>

pkgname=archlinux-overlayroot
pkgver=0.9.1
pkgrel=2
pkgdesc="Overlay the root filesystem with a tmpfs filesystem."
arch=('any')
url="https://github.com/hilderingt/archlinux-overlayroot"
license=('GPLv3')
depends=(
  'mkinitcpio'
)
makedepends=(
  'gcc'
)
source=(
  "git+$url"
)
sha256sums=(
  'SKIP'
)

build() {
  (cd "$srcdir/archlinux-overlayroot" && git checkout tags/v$pkgver-$pkgrel 2>>/dev/null)
  gcc -o ovlroot-helper "$srcdir/archlinux-overlayroot/ovlroot-helper.c"
}

package() {
  install -D -m 644 "$srcdir/archlinux-overlayroot/install.sh" "$pkgdir/usr/lib/initcpio/install/ovlroot"
  install -D -m 644 "$srcdir/archlinux-overlayroot/hook.sh" "$pkgdir/usr/lib/initcpio/hooks/ovlroot"
  install -D -m 755 "$srcdir/archlinux-overlayroot/mount.ovlroot" "$pkgdir/usr/bin/mount.ovlroot"
  mkdir -p "$pkgdir/usr/share/ovlroot"
  install -D -m 644 "$srcdir/archlinux-overlayroot/ovlroot.sh" "$pkgdir/usr/share/ovlroot/ovlroot.sh"
  install -D -m 644 "$srcdir/ovlroot-helper" "$pkgdir/usr/share/ovlroot/ovlroot-helper"
  install -d -m 700 -o root -g root "$pkgdir/etc/ovlroot.d"
}