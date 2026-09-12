# Maintainer: Damon Blais <damon.blais@gmail.com>

pkgname=heft
pkgver=0.6.0
pkgrel=1
pkgdesc="Read-only Linux TUI for application-weight process accounting"
arch=('x86_64' 'aarch64')
url="https://github.com/Rethunk-Tech/heft"
license=('Apache-2.0')
# [profile.release] already strips, so there is nothing for makepkg to strip or
# to put in a debug package.
options=('!strip' '!debug')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('dae9bd059d539b20d5aa0dd0b95b5f38cd8211291fe482ae59cea07afb9e3715')

prepare() {
  cd "$pkgname-$pkgver"
  # RUSTUP_TOOLCHAIN wins over the repository's rust-toolchain.toml, so a
  # maintainer who has rustup builds with the same stable this does.
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  # [profile.release] in Cargo.toml carries LTO, codegen-units = 1, strip and
  # panic = abort. Do not restate them here.
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  # The suite reads the builder's own /proc, which a build chroot has; the
  # container and GPU paths are skipped when nothing answers them.
  cargo test --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  # Apache-2.0 is an SPDX common licence shipped in /usr/share/licenses/spdx
  # by the `licenses` package, so this installs no copy of it.
  install -Dm0755 target/release/heft "$pkgdir/usr/bin/heft"

  # build.rs writes the completions and man page under a hashed OUT_DIR.
  # Newest heft.1 rather than the first directory named assets: an earlier
  # crate's build dir survives in target/ and would hand back stale files.
  local man assets
  man=$(find target/release/build -name heft.1 -printf '%T@ %p\n' | sort -rn | head -1 | cut -d' ' -f2-)
  assets=$(dirname "$man")
  install -Dm0644 "$assets/heft.bash" "$pkgdir/usr/share/bash-completion/completions/heft"
  install -Dm0644 "$assets/_heft" "$pkgdir/usr/share/zsh/site-functions/_heft"
  install -Dm0644 "$assets/heft.fish" "$pkgdir/usr/share/fish/vendor_completions.d/heft.fish"
  install -Dm0644 "$assets/heft.1" "$pkgdir/usr/share/man/man1/heft.1"
}
