# Maintainer: Nauris Steins <me@naurissteins.com>
pkgname=kwybars-git
_repo=Kwybars
pkgver=0.1.4.r0.g0000000
pkgrel=1
pkgdesc="Desktop audio visualizer for Wayland that renders real-time audio bars on screen (latest git)"
arch=('x86_64')
url="https://github.com/naurissteins/Kwybars"
license=('MIT')
provides=('kwybars')
conflicts=('kwybars' 'kwybars-bin')
options=('!debug')
depends=('gtk4' 'gtk4-layer-shell' 'pipewire' 'cava')
optdepends=('libnotify: desktop error notifications via notify-send')
makedepends=('cargo' 'git')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_repo"
  git describe --long --tags --abbrev=7 | sed 's/^v//; s/-/.r/; s/-/./'
}

prepare() {
  cd "$srcdir/$_repo"
  cargo fetch --locked
}

build() {
  cd "$srcdir/$_repo"
  cargo build --frozen --release --workspace
}

package() {
  cd "$srcdir/$_repo"

  install -Dm755 target/release/kwybars-overlay "$pkgdir/usr/bin/kwybars-overlay"
  install -Dm755 target/release/kwybars-daemon "$pkgdir/usr/bin/kwybars-daemon"
  install -Dm755 target/release/kwybarsctl "$pkgdir/usr/bin/kwybarsctl"

  install -Dm644 assets/systemd/kwybars-daemon.service \
    "$pkgdir/usr/lib/systemd/user/kwybars-daemon.service"

  install -d "$pkgdir/usr/share/kwybars/themes"
  install -m644 assets/themes/*.toml "$pkgdir/usr/share/kwybars/themes/"
  install -Dm644 assets/examples/config.toml \
    "$pkgdir/usr/share/doc/kwybars/examples/config.toml"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
