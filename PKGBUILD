# Maintainer: Aditya Gupta <mail@adityagupta.dev>
#
# The prot desktop app (Tauri 2 + React). It talks to the daemon and CLI from the prot package, which is built
# separately, so `yay -S prot` never compiles this.

pkgname=prot-desktop
_pkgsrc=prot
pkgver=0.2.1
pkgrel=1
pkgdesc="prot desktop app for managing development servers"
arch=(x86_64 aarch64)
url="https://github.com/terastal-hq/prot"
license=(MIT)
depends=(prot webkit2gtk-4.1 gtk3)
makedepends=(go rust nodejs npm)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# The checksum is filled in by the publish workflow (or `updpkgsums`) once the v$pkgver tag exists on GitHub.
sha256sums=('8681ab4cacde3a8cd919f8c11ae918a104bfd04a9b34a189c1de2b8eceb35fae')
options=(!lto !debug)

_srcdir() { echo "$srcdir/$_pkgsrc-$pkgver"; }

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

  # Tauri's build script requires the configured sidecars to exist. This package does not install them; it
  # depends on the prot and protd packages instead.
  mkdir -p apps/desktop/src-tauri/binaries
  cp build/prot "apps/desktop/src-tauri/binaries/prot-$triple"
  cp build/protd "apps/desktop/src-tauri/binaries/protd-$triple"

  (cd apps/desktop && npm run build)
  (cd apps/desktop/src-tauri &&
    RUSTFLAGS="$RUSTFLAGS --remap-path-prefix=$srcdir=src" CARGO_TARGET_DIR=../../../build/target \
    cargo build --release --frozen)
}

package() {
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
