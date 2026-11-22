# Maintainer: Jonatan R. Fischer <jonafischer at gmail dot com>
pkgname=mcumgrctl
pkgver=0.20.0
pkgrel=2
pkgdesc="Rust CLI for Zephyr MCUmgr (built from source)"
arch=('x86_64')
url="https://github.com/Finomnis/mcumgr-toolkit"
license=('MIT' 'Apache-2.0')
# btleplug (BLE) uses libdbus at runtime (libdbus-1.so.3 from dbus);
# libgcc for libgcc_s.so.1 of the Rust binary; glibc is implicit
depends=('dbus' 'libgcc')
makedepends=('cargo')
conflicts=('mcumgrctl-bin')
options=('!debug')
# NOTE: the upstream tag is "0.20.0" (no "v" prefix)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Finomnis/mcumgr-toolkit/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c7b29cb792eda9924cc4b810f9830b83b504f076a891252500e65ac99d8f385e')

_srcname="mcumgr-toolkit-${pkgver}"

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "$srcdir/$_srcname"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "$srcdir/$_srcname"
  # Upstream release builds use the default feature set ("ble"): --all-features
  # would enable "vendored-dbus", which statically bundles libdbus instead of
  # linking against the system library provided by depends=(dbus).
  cargo build --frozen --release -p mcumgrctl
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "$srcdir/$_srcname"
  # Only the CLI crate: the library crates need serial/BLE hardware and the
  # Zephyr simulator, which is not practical in a build chroot.
  cargo test --frozen -p mcumgrctl
  ./target/release/mcumgrctl --version
}

package() {
  cd "$srcdir/$_srcname"
  install -Dm755 target/release/mcumgrctl \
    "$pkgdir/usr/bin/mcumgrctl"
  install -Dm644 LICENSE-APACHE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 LICENSE-MIT \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
