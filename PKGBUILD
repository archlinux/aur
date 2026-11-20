# Maintainer: Askar Amirov <59274133+askaramirov@users.noreply.github.com>
# The AUR package of appzones (https://aur.archlinux.org/packages/appzones), kept in
# appzones' repository under contrib/arch/. To update: pkgver, then
# `updpkgsums && makepkg --printsrcinfo > .SRCINFO`, then push both to the AUR.
pkgname=appzones
pkgver=0.8.3
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
sha256sums=('5c65b75d7e604ee7c8a5d4feb9664fd80206d685cd1f4eb94a3d8738fc9616a3'
            'SKIP')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  # the sudo rule for `appzones mount`: members of the group appzones (sysusers.d)
  make DESTDIR="$pkgdir" PREFIX=/usr PYTHON=/usr/bin/python3 SYSTEMD=yes APPARMOR=no SUDOERS=yes \
    MOUNT_USERS=%appzones install
  install -Dm644 "$srcdir/appzones.sysusers" "$pkgdir/usr/lib/sysusers.d/appzones.conf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
