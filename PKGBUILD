# Maintainer: jeryd leuck <jerydleuck@gmail.com>
pkgname=mono-tracker-git
_pkgname=mono
pkgver=v0.3.0.r1.40d062f
pkgrel=4
pkgdesc="Privacy-first screen time tracking application for Linux with TUI dashboard"
arch=('x86_64')
url="https://github.com/xonoxc/mono"
license=('MIT')
depends=('gcc-libs' 'glibc' 'sqlite' 'zstd' 'libxkbcommon' 'wayland')
makedepends=('cargo' 'git' 'pkgconf')
provides=('mono-tracker' 'mono')
conflicts=('mono-tracker' 'mono')
source=("git+${url}.git"
        "mono-tracker.service"
        "mono-tracker.desktop"
        "mono-dashboard.desktop")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  
  # Remove bundled feature from rusqlite to use system lib
  sed -i 's/rusqlite = { version = "0.31", features = \["bundled"\] }/rusqlite = { version = "0.31" }/' Cargo.toml

  export CARGO_HOME="$srcdir/cargo"
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgname"
  export CARGO_HOME="$srcdir/cargo"
  export ZSTD_SYS_USE_PKG_CONFIG=1
  cargo build --release --frozen
}

check() {
  find "$pkgdir" -type f -exec sh -c 'file "$1" | grep -q ELF' _ {} \; -print | while read -r elf; do
    if ldd "$elf" | grep -q "not found"; then
      echo "Broken dependencies in $elf:"
      ldd "$elf" | grep "not found"
      exit 1
    fi
  done
}

package() {
  cd "$_pkgname"
  
  # Install binaries
  install -Dm755 target/release/mono "$pkgdir/usr/bin/mono"
  install -Dm755 target/release/mono-tracker "$pkgdir/usr/bin/mono-tracker"
  install -Dm755 target/release/mono-cli "$pkgdir/usr/bin/mono-cli"

  # Install systemd user service
  install -Dm644 "$srcdir/mono-tracker.service" "$pkgdir/usr/lib/systemd/user/mono-tracker.service"

  # Install XDG autostart
  install -Dm644 "$srcdir/mono-tracker.desktop" "$pkgdir/etc/xdg/autostart/mono-tracker.desktop"

  # Install Desktop Launcher
  install -Dm644 "$srcdir/mono-dashboard.desktop" "$pkgdir/usr/share/applications/mono.desktop"

  # Install License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
