# Maintainer: 9M2PJU <9m2pju@gmail.com>
# Contributor: bahdotsh (upstream author)
pkgname=hopchat-git
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc="Offline, end-to-end encrypted terminal chat for your local network. No server, no internet, no accounts. (latest git)"
arch=('x86_64' 'aarch64')
url="https://github.com/bahdotsh/hopchat"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('git' 'cargo')
provides=('hopchat')
conflicts=('hopchat')
source=("$pkgname::git+https://github.com/bahdotsh/hopchat.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  # With tags: 0.1.0.r12.gabc1234. Before the first tag, git describe fails
  # and we fall back to the Cargo.toml version plus the commit count.
  if desc="$(git describe --long --tags 2>/dev/null)"; then
    printf '%s\n' "$desc" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf '%s.r%s.g%s\n' \
      "$(grep -m1 '^version' Cargo.toml | cut -d'"' -f2)" \
      "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

prepare() {
  cd "$pkgname"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/hopchat" "$pkgdir/usr/bin/hopchat"
  install -Dm644 packaging/hopchat.1 "$pkgdir/usr/share/man/man1/hopchat.1"
  install -Dm644 packaging/hopchat.desktop "$pkgdir/usr/share/applications/hopchat.desktop"
  install -Dm644 packaging/hopchat.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/hopchat.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
