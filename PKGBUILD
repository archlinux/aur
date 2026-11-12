# Maintainer: Matthias Schabhüttl <matthias@matthiasschabhuettl.com>
pkgname=bentwire
pkgver=0.1.2
pkgrel=1
pkgdesc='Desktop characters (Microsoft Agent and Office Assistant formats) for Wayland'
arch=(x86_64)
url='https://github.com/mschabhuettl/bentwire'
license=('MIT OR Apache-2.0' 'LGPL-2.1-or-later')
depends=(alsa-lib glibc libgcc libxkbcommon)
makedepends=(cargo pkgconf)
checkdepends=(dbus)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('f0a2bf39c86da083bc2ccb26f8463484f528f00896a4cfda5f6159b8a6fe7ca9')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p bentwired -p bentwire -p bentwire-convert \
    --bin bentwired --bin bentwire --bin bentwire-convert
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --workspace
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/{bentwired,bentwire,bentwire-convert} -t "$pkgdir/usr/bin/"
  install -d "$pkgdir/usr/share/bentwire/characters"
  cp -r --no-preserve=ownership characters/builtin "$pkgdir/usr/share/bentwire/characters/"
  install -Dm644 packaging/dbus/org.bentwire.Agent.service -t "$pkgdir/usr/share/dbus-1/services/"
  install -Dm644 packaging/systemd/bentwired.service -t "$pkgdir/usr/lib/systemd/user/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE-MIT LICENSE-APACHE assets/fonts/LICENSE-LGPL-2.1.txt \
    -t "$pkgdir/usr/share/licenses/$pkgname/"
}
