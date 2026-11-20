# Maintainer: Askar Amirov <59274133+askaramirov@users.noreply.github.com>
# The AUR package of appzones (https://aur.archlinux.org/packages/appzones), kept in
# appzones' repository under contrib/arch/. To update: pkgver, then
# `updpkgsums && makepkg --printsrcinfo > .SRCINFO`, then push both to the AUR.
pkgname=appzones
pkgver=0.9.1
pkgrel=1
pkgdesc="Long-lived sandboxes for desktop apps, dev tools and AI agents (bubblewrap, pasta, nftables)"
arch=('x86_64')
url="https://github.com/mirql/appzones"
license=('MIT')
# what a server needs; the desktop's parts are optional (a zone starts without them)
depends=('python>=3.11' 'bubblewrap' 'passt' 'nftables' 'iproute2')
makedepends=('pkgconf' 'wayland')
optdepends=('wayland: desktop apps (each zone'"'"'s own Wayland socket, zone-wayland)'
            'xdg-dbus-proxy: the session bus in zones (portals, notifications, tray)'
            'dbus: apps with bus = "zone" (their own bus in the zone)'
            'sudo: appzones mount (for members of the appzones group)'
            'hyprland: zone border colours and window tags'
            'nix: the packages setting')
backup=('etc/sudoers.d/appzones')
install=appzones.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/mirql/appzones/archive/refs/tags/v$pkgver.tar.gz"
        'appzones.sysusers')
sha256sums=('4498786abae21af7648e2ed2d98f4fb9b800fbab0d18671f28edc3a21e2111d6'
            'SKIP')

build() {
  cd "$pkgname-$pkgver"
  # the C helper only: the package is the same whether or not cargo is installed (the
  # optional Rust helpers are not packaged here yet, #121)
  make zone-wayland
}

package() {
  cd "$pkgname-$pkgver"
  # the sudo rule for `appzones mount`: members of the group appzones (sysusers.d)
  make DESTDIR="$pkgdir" PREFIX=/usr PYTHON=/usr/bin/python3 SYSTEMD=yes APPARMOR=no SUDOERS=yes \
    MOUNT_USERS=%appzones install
  install -Dm644 "$srcdir/appzones.sysusers" "$pkgdir/usr/lib/sysusers.d/appzones.conf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
