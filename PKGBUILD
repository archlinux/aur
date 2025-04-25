# Maintainer: killab33z <killab33z @ hispagatos-dot-org>
pkgname=usenet_reborn-git
_pkgname="${pkgname%-git}"
pkgver=64.4e26a0a
pkgrel=1
pkgdesc="A terminal‑based (TUI) NNTP (Usenet) client written in Rust."
arch=('any')
url="https://git.sr.ht/~rek2/usenet_reborn"
license=(GPL-3.0-only)
makedepends=('cargo')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-bin")
source=("git+$url")
sha512sums=('SKIP')
options=(!debug !lto)

# https://wiki.archlinux.org/title/VCS_package_guidelines
pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long --tags --abbrev=7 2>/dev/null |
      sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "%s.%s" "$(git rev-list --count HEAD)" \
      "$(git rev-parse --short=7 HEAD)"
  )
}

# https://wiki.archlinux.org/title/Rust_package_guidelines
prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$_pkgname"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
  install -Dm644 -t "$pkgdir/usr/share/$_pkgname" configs/config.toml
  install -Dm644 -t "$pkgdir/usr/share/$_pkgname" configs/subscriptions
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
}

