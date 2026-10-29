# Maintainer: Nauris Steins <me@naurissteins.com>
pkgname=sweetidle-git
_repo=sweetidle
pkgver=0.1.0.r1.g0440ffe
pkgrel=1
pkgdesc="Lightweight idle management daemon for Wayland compositors (latest git)"
arch=('x86_64')
url="https://github.com/naurissteins/sweetidle"
license=('GPL-3.0-or-later')
provides=('sweetidle')
conflicts=('sweetidle')
options=('!debug')
depends=('glibc' 'libgcc')
makedepends=('cargo' 'git')
optdepends=('systemd: logind sleep/lock hooks and the bundled user service')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_repo"
  git describe --long --tags --abbrev=7 | sed 's/^v//; s/-/.r/; s/-/./'
}

prepare() {
  cd "$srcdir/$_repo"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$_repo"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$srcdir/$_repo"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "$srcdir/$_repo"

  install -Dm755 target/release/sweetidle "$pkgdir/usr/bin/sweetidle"
  install -Dm644 systemd/sweetidle.service "$pkgdir/usr/lib/systemd/user/sweetidle.service"
  install -Dm644 man/sweetidle.1 "$pkgdir/usr/share/man/man1/sweetidle.1"
  install -Dm644 config/example.toml "$pkgdir/usr/share/doc/sweetidle/example.toml"
  install -Dm644 README.md "$pkgdir/usr/share/doc/sweetidle/README.md"
}
