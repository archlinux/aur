# Maintainer: sachesi <xsachesi@pm.me>

# pkgver and sha256sums are filled in by .github/workflows/aur.yml for each release.
pkgname=umbriel-vram-booster
pkgver=0.4.4
pkgrel=1
pkgdesc='Dynamic VRAM prioritization for the Umbriel compositor via Linux dmem cgroups'
arch=('x86_64' 'aarch64')
url='https://github.com/sachesi/umbriel-vram-booster'
license=('GPL-3.0-or-later')
depends=('dmemcg-booster' 'libgcc' 'glibc')
makedepends=('cargo')
optdepends=('umbriel-git: the compositor it works with')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('f7147f99056ef73b0bf3bb30eb6f0ea989d96a708dab4cf8f24a86ba81581a9d')

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
  install -Dm755 daemon/target/release/$pkgname -t "$pkgdir/usr/lib/$pkgname"
  install -Dm755 daemon/target/release/${pkgname}ctl -t "$pkgdir/usr/bin"
  install -Dm644 data/$pkgname.service -t "$pkgdir/usr/lib/systemd/user"
  # Arch keeps a package's private executables in /usr/lib/$pkgname, not /usr/libexec.
  sed -i "s|^ExecStart=/usr/libexec/$pkgname$|ExecStart=/usr/lib/$pkgname/$pkgname|" \
    "$pkgdir/usr/lib/systemd/user/$pkgname.service"
}
