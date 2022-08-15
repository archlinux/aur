# Maintainer:  Edgar Vincent <e-v@posteo.net>
_pkgname=messenger-notify
pkgname=${_pkgname}-git
pkgrel=2
pkgver=r19.4924e2c
pkgdesc="A background service that can be connected to messengers (such as Signal) and will show a desktop notification on message receive."
arch=('x86_64' 'aarch64')
# FIXME rename remote repo when new one created
url="https://gitlab.com/Schmiddiii/signal-notify"
license=('AGPL3')
optdepends=('waked: for scheduled wake-ups'
           'feedbackd: for vibrating notifications')
makedepends=('cargo')
provides=('messenger-notify')
# FIXME rename remote repo when new one created
source=('git+https://gitlab.com/Schmiddiii/signal-notify')
sha256sums=(SKIP)

# FIXME change paths when repo renamed
pkgver() {
  cd "$srcdir/signal-notify"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/signal-notify"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/signal-notify"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
    cd "$srcdir/signal-notify"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/signal-notify/target/release/$_pkgname"
  install -Dm0755 -t "$pkgdir/usr/lib/systemd/user/" "$srcdir/signal-notify/$_pkgname".service
}

# vim:set ts=2 sw=2 et:
