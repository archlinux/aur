# Maintainer: Akshat Ayush <akshatayush07 at gmail dot com>

pkgname=zsa-zapp-git
pkgver=1.0.1.r0.gc1dd545
pkgrel=1
pkgdesc="Flash ZSA keyboards from your terminal."
arch=('x86_64')
url="https://github.com/zsa/zapp"
license=('LicenseRef-MIT-Commons-Clause')
depends=('glibc' 'libgcc' 'systemd-libs')
makedepends=('git' 'cargo')
provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() { # ^[1]
  cd "$pkgname"

  export RUSTUP_TOOLCHAIN=stable
  # Temporary fix for an upstream Cargo.lock mismatch
  cargo update
  cargo fetch --locked --target host-tuple
}

check() {
  cd "$pkgname"

  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

build() {
  cd "$pkgname"

  export RUSTUP_TOOLCHAIN=stable
  # Prevent makepkg's flags from breaking aws-lc-sys build
  unset CFLAGS CXXFLAGS LDFLAGS
  cargo build --release --frozen --manifest-path zapp/Cargo.toml
}

package() {
  cd "$pkgname"

  install -vDm 755 "target/release/zapp" "$pkgdir/usr/bin/zapp"
  install -vDm 644 "udev/50-zsa.rules" "$pkgdir/usr/lib/udev/rules.d/50-zsa-zapp.rules"
  install -vDm 644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  depends+=('libudev.so') # ^[1]
}

# [1]: Graciously provided by @trumpetrespas [https://aur.archlinux.org/packages/zsa-zapp]

