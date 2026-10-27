# Maintainer: Nauris Steins <me@naurissteins.com>
pkgname=kwybars-git
_repo=Kwybars
pkgver=0.3.0.r0.g0000000
pkgrel=1
pkgdesc="Desktop audio visualizer for Wayland that renders real-time audio bars on screen (latest git)"
arch=('x86_64')
url="https://github.com/naurissteins/Kwybars"
license=('GPL-3.0-or-later')
provides=('kwybars')
conflicts=('kwybars' 'kwybars-bin')
options=('!debug' '!lto')
depends=('gcc-libs' 'glibc' 'pipewire')
makedepends=('cargo' 'clang' 'git')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_repo"
  git describe --long --tags --abbrev=7 | sed 's/^v//; s/-/.r/; s/-/./'
}

prepare() {
  cd "$srcdir/$_repo"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$_repo"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$srcdir/$_repo"
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release
}

package() {
  cd "$srcdir/$_repo"

  install -Dm755 target/release/kwybars "$pkgdir/usr/bin/kwybars"
  install -Dm644 assets/systemd/kwybars.service \
    "$pkgdir/usr/lib/systemd/user/kwybars.service"
  install -Dm644 assets/themes/*.toml -t "$pkgdir/usr/share/kwybars/themes"
  install -Dm644 assets/examples/*.toml -t "$pkgdir/usr/share/doc/kwybars/examples"
  install -Dm644 docs/man/kwybars.1 "$pkgdir/usr/share/man/man1/kwybars.1"
  install -Dm644 README.md "$pkgdir/usr/share/doc/kwybars/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
