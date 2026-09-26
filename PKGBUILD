# Maintainer: sachesi <xsachesi@pm.me>

# pkgver and sha256sums are filled in by .github/workflows/aur.yml for each release.
pkgname=umbriel-vram-booster
pkgver=0.4.1
pkgrel=1
pkgdesc='Dynamic VRAM prioritization for the Umbriel compositor via Linux dmem cgroups'
arch=('x86_64' 'aarch64')
url='https://github.com/sachesi/umbriel-vram-booster'
license=('GPL-3.0-or-later')
depends=('dmemcg-booster' 'libgcc' 'glibc')
makedepends=('cargo')
optdepends=('umbriel-git: the compositor it works with')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('09a0578603c692ac65ea7990ad3656cb8455d47d91a8455d6b7d0eaf3acb7712')

prepare() {
  cd "$pkgname-$pkgver/daemon"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver/daemon"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver/daemon"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 daemon/target/release/$pkgname daemon/target/release/${pkgname}ctl -t "$pkgdir/usr/bin"
  install -Dm644 data/$pkgname.service -t "$pkgdir/usr/lib/systemd/user"
}
