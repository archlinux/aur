# Maintainer: Casper <casper@codemu.ch>
pkgname=wayrcursor-git
_pkgname=wayrcursor
pkgver=1.0.0.r32.gafa6dfc
pkgrel=1
pkgdesc='Shows where the cursor is on Wayland'
arch=('x86_64' 'aarch64')
url='https://github.com/cmvanb/wayrcursor'
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc' 'libglvnd' 'wayland')
makedepends=('cargo' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf '%s.r%s.g%s' \
    "$(grep -m1 '^version' Cargo.toml | cut -d'"' -f2)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "$_pkgname"
  install -Dm755 target/release/$_pkgname "$pkgdir/usr/bin/$_pkgname"
  sed 's|@BINDIR@|/usr/bin|' dist/$_pkgname.service.in |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/$_pkgname.service"
  install -Dm644 dist/config.toml "$pkgdir/usr/share/doc/$_pkgname/config.toml"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
