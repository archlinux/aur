# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname=nix-user-chroot
pkgver=1.2.2
pkgrel=3
pkgdesc="Run and install nix as user without root permissions."
url="https://github.com/nix-community/nix-user-chroot"
arch=(x86_64)
license=(MIT)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://github.com/nix-community/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=(3dda9eac434d9f4cba29931046377822e39a26b596f70407f487eb7d58797da1c917e0eb3ce5b40cafe46679e6b2fe5e87a6f4c5f4e3b5545290cfb1625f201d)

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked
}

check() {
  cd $pkgname-$pkgver
  # See https://github.com/nix-community/nix-user-chroot/tree/1.2.2#check-if-your-kernel-supports-user-namespaces-for-unprivileged-users
  # Plus, ensure chroot works inside the user namespace (This fails, for example, inside a regular Podman container)
  if ! unshare --user --pid --map-root-user chroot / true; then
    echo "WARNING: Skipping tests because user namespaces are not supported or restricted" >&2
    return
  fi
  cargo test --release --locked
}

package() {
  cd $pkgname-$pkgver
  install -Dt "$pkgdir/usr/bin" target/release/nix-user-chroot
  install -Dt "$pkgdir/usr/share/doc/$pkgname" -m644 README.md
}
