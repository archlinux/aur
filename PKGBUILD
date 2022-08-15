# Maintainer:  Edgar Vincent <e-v@posteo.net>
_pkgname=messenger-notify
_pkgname_bin=messenger_notify
pkgname=${_pkgname}-git
pkgrel=1
pkgver=r19.4924e2c
pkgdesc="A background service that can be connected to messengers (such as Signal) and will show a desktop notification on message receive."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/Schmiddiii/messenger-notify"
license=('AGPL3')
optdepends=('waked: for scheduled wake-ups')
makedepends=('cargo')
provides=('signal-notify')
source=(git+https://gitlab.com/Schmiddiii/messenger-notify)
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
    cd "$srcdir/$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/$_pkgname/target/release/$_pkgname_bin"
  install -Dm0755 -t "$pkgdir/usr/lib/systemd/user/" "$srcdir/$_pkgname/$_pkgname".service
}

# vim:set ts=2 sw=2 et:
