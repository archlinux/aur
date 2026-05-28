# Maintainer: AstroJr0 (rehanjayed01@gmail.com)
# Copyright (c) 2026 Author. All Rights Reserved.
pkgname=hyprcursor-sync
pkgver=1.1.0
pkgrel=1
pkgdesc="Automated cursor sync. No need to log out just to apply cursor changes :)"
arch=('any')
url="https://aur.archlinux.org/packages/hyprcursor-sync"
license=('MIT')
depends=('hyprland' 'bash' 'glib2' 'gtk4' 'nwg-look' 'hyprcursor')
install=${pkgname}.install
source=("cursor-update.sh"
        "cursor-update.service"
        "cursor-update.path"
        "LICENSE")
# We left this empty so updpkgsums can inject the real hashes
sha256sums=('08a36c97951c1e779df6c62aad4fd3dfc484807040c0d68702fb503d81918527'
            'e14a0873ad1d58b839b334fb055d57cf14a0abbb6f5caadf98f084c352aab85a'
            'faafced74cfd85881a907de42d90463e39ee57ca72944de17029691b7628dbf7'
            '3ba763f30eedfa83344cf6101ca16b9b4e508752ac999a15cf58e2c020bf06ca')

package() {
  # Install binaries and systemd units
  install -Dm755 "$srcdir/cursor-update.sh" "$pkgdir/usr/bin/cursor-update-script"
  install -Dm644 "$srcdir/cursor-update.service" "$pkgdir/usr/lib/systemd/user/cursor-update.service"
  install -Dm644 "$srcdir/cursor-update.path" "$pkgdir/usr/lib/systemd/user/cursor-update.path"

  # Path correction inside service
  sed -i 's|%h/.config/systemd/user/cursor-update.sh|/usr/bin/cursor-update-script|g' \
    "$pkgdir/usr/lib/systemd/user/cursor-update.service"

  # System compliance: Install the MIT license
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
