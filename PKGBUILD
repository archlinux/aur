# Maintainer: Matthias Schabhüttl <matthias@matthiasschabhuettl.com>
pkgname=bentwire-git
_pkgname=bentwire
pkgver=0.7.0.r0.g85cb2c0
pkgrel=1
pkgdesc='Desktop characters (Microsoft Agent and Office Assistant formats) for Wayland (development version)'
arch=(x86_64)
url='https://github.com/mschabhuettl/bentwire'
license=('MIT OR Apache-2.0' 'LGPL-2.1-or-later')
depends=(alsa-lib glibc libgcc libxkbcommon)
optdepends=('espeak-ng: speech output')
makedepends=(cargo git pkgconf)
provides=("$_pkgname")
conflicts=("$_pkgname")
checkdepends=(dbus)
# libdeflate-sys builds C code: GCC LTO objects cannot be linked by rustc's lld
options=(!lto)
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
  cargo build --frozen --release -p bentwired -p bentwire -p bentwire-convert \
    -p bentwire-notify -p bentwire-mqtt --bin bentwired --bin bentwire \
    --bin bentwire-convert --bin bentwire-notify --bin bentwire-mqtt
}

check() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --workspace
}

package() {
  cd "$_pkgname"
  install -Dm755 target/release/{bentwired,bentwire,bentwire-convert,bentwire-notify,bentwire-mqtt} \
    -t "$pkgdir/usr/bin/"
  install -d "$pkgdir/usr/share/bentwire/characters"
  cp -r --no-preserve=ownership characters/builtin "$pkgdir/usr/share/bentwire/characters/"
  install -Dm644 packaging/dbus/org.bentwire.Agent.service -t "$pkgdir/usr/share/dbus-1/services/"
  install -Dm644 packaging/systemd/{bentwired,bentwire-notify,bentwire-mqtt}.service \
    -t "$pkgdir/usr/lib/systemd/user/"
  install -d "$pkgdir/usr/share/bentwire/clients"
  cp -a --no-preserve=ownership clients/{shell,claude-code,git,systemd} \
    "$pkgdir/usr/share/bentwire/clients/"
  rm "$pkgdir"/usr/share/bentwire/clients/*/test.sh
  sed 's|%h/.local/share/bentwire/systemd/|/usr/share/bentwire/clients/systemd/|' \
    clients/systemd/bentwire-failure@.service >bentwire-failure@.service
  install -Dm644 bentwire-failure@.service -t "$pkgdir/usr/lib/systemd/user/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE-MIT LICENSE-APACHE assets/fonts/LICENSE-LGPL-2.1.txt \
    -t "$pkgdir/usr/share/licenses/$pkgname/"
}
