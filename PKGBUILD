# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname=nix-user-chroot
pkgver=2.1.0
pkgrel=2
pkgdesc="Run and install nix as user without root permissions."
url="https://github.com/nix-community/nix-user-chroot"
arch=(x86_64)
license=(MIT)
makedepends=(cargo)
checkdepends=(busybox)
source=("$pkgname-$pkgver.tar.gz::https://github.com/nix-community/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=(217cc3c685374ab4172a8602f020e8bd07d90209a72847d63bab356a8d93047048416cfb30b7fbbaf94ca03cb5e96aad4aa8013c6860ccff328d4b56671a7d83)

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked
}

check() {
  cd $pkgname-$pkgver
  # See https://github.com/nix-community/nix-user-chroot/tree/1.2.2#check-if-your-kernel-supports-user-namespaces-for-unprivileged-users
  # Plus, ensure basic mount+chroot works inside the user namespace (this fails in some locked down
  # environments, such as e.g. when running a regular Podman container with AppArmor enabled)
  if ! unshare --user --mount --map-root-user sh -c 'mount -t tmpfs none /tmp && chroot / true'; then
    echo "WARNING: Skipping tests because user namespaces are not supported or restricted" >&2
    return
  fi

  # The tests require USER and NIX_USER_CHROOT_TEST_BUSYBOX to be set
  # (Note USER may not be set if building this package inside Podman)
  USER=$(id -un) NIX_USER_CHROOT_TEST_BUSYBOX=$(which busybox) cargo test --release --locked
}

package() {
  cd $pkgname-$pkgver
  install -Dt "$pkgdir/usr/bin" target/release/nix-user-chroot
  install -Dt "$pkgdir/usr/share/doc/$pkgname" -m644 README.md
}
