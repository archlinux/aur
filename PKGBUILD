# Maintainer: Askar Amirov <59274133+askaramirov@users.noreply.github.com>
# The AUR package of appzones (https://aur.archlinux.org/packages/appzones), kept in
# appzones' repository under contrib/arch/. To update: pkgver, then
# `updpkgsums && makepkg --printsrcinfo > .SRCINFO`, then push both to the AUR.
pkgname=appzones
pkgver=0.13.0
pkgrel=1
pkgdesc="Long-lived sandboxes for desktop apps, dev tools and AI agents (bubblewrap, pasta, nftables)"
arch=('x86_64')
url="https://github.com/mirql/appzones"
license=('MIT')
# what a server needs; the desktop's parts are optional (a zone starts without them)
depends=('bubblewrap' 'passt' 'nftables' 'iproute2' 'glibc' 'gcc-libs')
makedepends=('cargo')
optdepends=('xdg-dbus-proxy: the session bus in zones (portals, notifications, tray)'
            'dbus: apps with bus = "zone" (their own bus in the zone)'
            'sudo: appzones mount (for members of the appzones group)'
            'hyprland: zone border colours and window tags'
            'nix: the packages setting')
backup=('etc/sudoers.d/appzones')
install=appzones.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/mirql/appzones/archive/refs/tags/v$pkgver.tar.gz"
        'appzones.sysusers')
sha256sums=('4baa56ac7502101c6abe09839e7e7f4f337332f68511b8f7b1fa35faf7ebd8b1'
            'SKIP')

prepare() {
  cd "$pkgname-$pkgver"
  # the crates, pinned by Cargo.lock, fetched before the build (which then needs no network)
  cargo fetch --locked --manifest-path helper/Cargo.toml --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable CARGO_NET_OFFLINE=true
  # appzones-helper (appzones itself) and appzones-mount-helper, into build/
  make build
}

package() {
  cd "$pkgname-$pkgver"
  # the sudo rule for `appzones mount`: members of the group appzones (sysusers.d)
  # /usr/lib/appzones: Arch's place for them (and the sudo rule's, in backup=, so far)
  make DESTDIR="$pkgdir" PREFIX=/usr LIBDIR=/usr/lib/appzones SYSTEMD=yes APPARMOR=no SUDOERS=yes \
    MOUNT_USERS=%appzones install
  install -Dm644 "$srcdir/appzones.sysusers" "$pkgdir/usr/lib/sysusers.d/appzones.conf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
