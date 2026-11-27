# Maintainer: Piotr Wieczorek
# AUR package, built from the release tarball. packaging/PKGBUILD builds the local checkout instead.
pkgname=gplatch
pkgver=1.0.0
pkgrel=1
pkgdesc='Free system tray client for GlobalProtect VPNs, built on gpclient'
arch=(x86_64)
url='https://github.com/PiotrWieczorek98/gplatch'
license=(GPL-3.0-only)
depends=(gcc-libs glibc globalprotect-openconnect iproute2 libnotify polkit xdg-utils)
optdepends=('vpn-slice: split tunneling with the split setting')
makedepends=(cargo)
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('bec939f98806468ea74480c3d2b11876dd7f7506862967995c603311c44b0246')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/gplatch -t "$pkgdir/usr/bin"
  install -Dm644 packaging/gplatch.desktop packaging/gpauth.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 packaging/gplatch.desktop -t "$pkgdir/etc/xdg/autostart"
  install -Dm644 packaging/49-gplatch.rules -t "$pkgdir/usr/share/polkit-1/rules.d"
  install -Dm644 packaging/icons/gplatch.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
