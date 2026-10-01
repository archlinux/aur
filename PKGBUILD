# Maintainer: hollowpointer <hollowpointer@pm.me>
pkgname=zond
pkgver=0.19.0
pkgrel=1
pkgdesc="Network scanner that maps hosts, ports and services and what is wrong with them"
arch=('x86_64' 'aarch64')
url="https://github.com/zond-rs/zond"
# The binary is AGPL. It also carries Ubuntu's security data, which is
# Canonical's under CC BY-SA 4.0; see NOTICE.ubuntu-data.
license=('AGPL-3.0-or-later' 'CC-BY-SA-4.0')
# libcap is for the setcap in zond.install, not the binary.
depends=('libgcc' 'glibc' 'libpcap' 'libcap')
makedepends=('cargo')
install=zond.install
# makepkg's LTO puts -flto in CFLAGS, which turns ring's C code into bitcode the
# Rust link step cannot resolve.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('df837d5592753f75e7e9c0c88541bb1222d627d793760be8551aea414ef1687e')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
  # Man pages and shell completions, written by the binary from its own
  # command definition and dated by the release so rebuilds match.
  SOURCE_DATE_EPOCH="${SOURCE_DATE_EPOCH:-$(date +%s)}" \
    target/release/zond __generate target/assets
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # The unit tests only. The integration tests run real scans against loopback
  # under tight resource limits, which a build chroot need not allow; the
  # project's CI runs them on Linux and macOS.
  cargo test --frozen --release --bins
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/zond "$pkgdir/usr/bin/zond"

  install -Dm644 -t "$pkgdir/usr/share/man/man1" target/assets/man/*.1
  install -Dm644 -t "$pkgdir/usr/share/man/man7" target/assets/man/*.7
  install -Dm644 target/assets/completions/zond.bash "$pkgdir/usr/share/bash-completion/completions/zond"
  install -Dm644 target/assets/completions/_zond "$pkgdir/usr/share/zsh/site-functions/_zond"
  install -Dm644 target/assets/completions/zond.fish "$pkgdir/usr/share/fish/vendor_completions.d/zond.fish"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 assets/advisories/NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE.ubuntu-data"
}
