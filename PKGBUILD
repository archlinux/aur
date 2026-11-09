# Maintainer: Aditya Gupta <mail@adityagupta.dev>
#
# One build, three packages:
#   protd         the daemon and its systemd user unit
#   prot          the CLI (depends on protd)
#   prot-desktop  the Tauri desktop app (depends on prot)

pkgbase=prot
pkgname=(protd prot prot-desktop)
pkgver=0.1.0
pkgrel=1
pkgdesc="Your development servers, under control"
arch=(x86_64 aarch64)
url="https://github.com/terastal-hq/prot"
license=(MIT)
makedepends=(go rust nodejs npm webkit2gtk-4.1 gtk3)
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        protd.service
        protd.install)
sha256sums=('42ff31e63e5dd72d0a40c6feca8cc4862579e0b8a2a05b15b8108357900e2c57'
            '92f46be2caef8d87f8b8292d71d621c99a3ace4434d4fdedb0b4610c0a5d042f'
            '0ac18ee1337c27194d3d61396c31b087f53d5d6fc42e7823817bfeb84c123568')
options=(!lto !debug)

_srcdir() { echo "$srcdir/$pkgbase-$pkgver"; }

prepare() {
  cd "$(_srcdir)"
  export GOFLAGS="-modcacherw"
  go mod download

  (cd apps/desktop && npm ci --no-audit --no-fund)
  (cd apps/desktop/src-tauri && cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')")
}

build() {
  cd "$(_srcdir)"
  local triple
  triple="$(rustc -vV | sed -n 's/host: //p')"

  export CGO_ENABLED=0
  export GOFLAGS="-trimpath -mod=readonly -modcacherw"
  local ldflags="-s -w -X github.com/terastal-hq/prot/internal/daemon.Version=$pkgver"
  mkdir -p build
  go build -ldflags "$ldflags" -o build/ ./cmd/prot ./cmd/protd

  # Tauri's build script requires the configured sidecars to exist. The desktop package does not
  # install them; it relies on the prot and protd packages instead.
  mkdir -p apps/desktop/src-tauri/binaries
  cp build/prot "apps/desktop/src-tauri/binaries/prot-$triple"
  cp build/protd "apps/desktop/src-tauri/binaries/protd-$triple"

  (cd apps/desktop && npm run build)
  (cd apps/desktop/src-tauri &&
    RUSTFLAGS="$RUSTFLAGS --remap-path-prefix=$srcdir=src" CARGO_TARGET_DIR=../../../build/target \
    cargo build --release --frozen)
}

package_protd() {
  pkgdesc="prot daemon: process supervisor, .localhost reverse proxy and API"
  depends=()
  install=protd.install

  cd "$(_srcdir)"
  install -Dm755 build/protd "$pkgdir/usr/bin/protd"
  install -Dm644 "$srcdir/protd.service" "$pkgdir/usr/lib/systemd/user/protd.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_prot() {
  pkgdesc="prot command line interface and MCP server"
  depends=(protd)

  cd "$(_srcdir)"
  install -Dm755 build/prot "$pkgdir/usr/bin/prot"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_prot-desktop() {
  pkgdesc="prot desktop app for managing development servers"
  depends=(prot webkit2gtk-4.1 gtk3)

  cd "$(_srcdir)"
  install -Dm755 build/target/release/prot-desktop "$pkgdir/usr/bin/prot-desktop"
  install -Dm644 packaging/linux/prot-desktop.desktop "$pkgdir/usr/share/applications/prot-desktop.desktop"

  local size
  for size in 16 24 32 48 64 128 256 512; do
    if [ -f "packaging/linux/icons/${size}x${size}/prot-desktop.png" ]; then
      install -Dm644 "packaging/linux/icons/${size}x${size}/prot-desktop.png" \
        "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/prot-desktop.png"
    fi
  done
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
