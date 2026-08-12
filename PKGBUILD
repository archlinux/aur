# Maintainer: Luytan <luytan@khora.me>

_pkgname=cardwire
pkgname="${_pkgname}-git"
pkgver=r140.ab31621
pkgrel=1
pkgdesc='GPU manager for Linux using eBPF LSM hooks'
arch=('x86_64')
url='https://github.com/OpenGamingCollective/cardwire'
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'dbus' 'hwdata')
makedepends=('git' 'cargo' 'bpf-linker' 'rustup')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  rustup toolchain install nightly-2026-08-04 --component rust-src
  cargo fetch --locked
}
options=('!lto')
build() {
  cd "$srcdir/$_pkgname"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --bins
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 target/release/cardwire "$pkgdir/usr/bin/cardwire"
  install -Dm755 target/release/cardwired "$pkgdir/usr/bin/cardwired"
  install -Dm755 target/release/cardwire-gui "$pkgdir/usr/bin/cardwire-gui"

  install -Dm644 assets/cardwired.service \
    "$pkgdir/usr/lib/systemd/system/cardwired.service"
  install -Dm644 assets/org.opengamingcollective.cardwire.conf \
    "$pkgdir/usr/share/dbus-1/system.d/org.opengamingcollective.cardwire.conf"
  install -Dm644 assets/cardwire-gui.desktop \
    "$pkgdir/usr/share/applications/cardwire-gui.desktop"
  for icon in assets/icons/*.svg; do
    install -Dm644 "$icon" \
      "$pkgdir/usr/share/icons/hicolor/scalable/apps/$(basename "$icon")"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}