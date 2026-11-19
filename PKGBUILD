# Maintainer: Askar Amirov <59274133+askaramirov@users.noreply.github.com>
# The AUR package of appzones (https://aur.archlinux.org/packages/appzones), kept in
# appzones' repository under contrib/arch/. To update: pkgver, then
# `updpkgsums && makepkg --printsrcinfo > .SRCINFO`, then push both to the AUR.
pkgname=appzones
pkgver=0.8.1
pkgrel=1
pkgdesc="Long-lived sandboxes for desktop apps, dev tools and AI agents (bubblewrap, pasta, nftables)"
arch=('x86_64')
url="https://github.com/mirql/appzones"
license=('MIT')
depends=('python>=3.11' 'bubblewrap' 'passt' 'nftables' 'xdg-dbus-proxy' 'dbus' 'iproute2' 'wayland')
makedepends=('pkgconf')
optdepends=('sudo: appzones mount (for members of the appzones group)'
            'hyprland: zone border colours and window tags'
            'nix: the packages setting')
backup=('etc/sudoers.d/appzones')
install=appzones.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/mirql/appzones/archive/refs/tags/v$pkgver.tar.gz"
        'appzones.sysusers')
sha256sums=('8ca22baa64a2da6db53aced5e1b0cc57951785f34929c11c6db9e34ef31f2e07'
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
