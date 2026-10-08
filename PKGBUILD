# Maintainer: sachesi <xsachesi@pm.me>

# pkgver and sha256sums are filled in by .github/workflows/aur.yml for each release.
pkgname=umbriel-vram-booster
pkgver=0.4.3
pkgrel=1
pkgdesc='Dynamic VRAM prioritization for the Umbriel compositor via Linux dmem cgroups'
arch=('x86_64' 'aarch64')
url='https://github.com/sachesi/umbriel-vram-booster'
license=('GPL-3.0-or-later')
depends=('dmemcg-booster' 'libgcc' 'glibc')
makedepends=('cargo')
optdepends=('umbriel-git: the compositor it works with')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('32f468a3cb73cedcb3e47a38a967962231eb059d6b94146f6cc7ffb7e0cdd84b')

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
