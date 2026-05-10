pkgname=cmdcreate-git
pkgver=r143.1045ced
pkgrel=1
pkgdesc="Allows you to create custom commands for your custom scripts (Static Musl Build)"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/owen-debiasio/cmdcreate"
license=('GPL-3.0-or-later')
depends=()
makedepends=('cargo' 'git' 'zig' 'cargo-zigbuild')

conflicts=('cmdcreate')
provides=('cmdcreate')
source=("cmdcreate::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd cmdcreate
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd cmdcreate
  rm -f .cargo/config.toml
  rustup target add "$CARCH-unknown-linux-musl" || true
  cargo fetch --locked --target "$CARCH-unknown-linux-musl"
}

build() {
  cd cmdcreate
  
  local TARGET=""
  if [[ "$CARCH" == "x86_64" ]]; then
    TARGET="x86_64-unknown-linux-musl"
  elif [[ "$CARCH" == "i686" ]]; then
    TARGET="i686-unknown-linux-musl"
  elif [[ "$CARCH" == "aarch64" ]]; then
    TARGET="aarch64-unknown-linux-musl"
  fi

  CRATE_CC_NO_DEFAULTS=true \
  cargo zigbuild --release --frozen --target "$TARGET" -- \
    -C target-feature=+crt-static \
    -C link-arg=-fno-sanitize=all
}

package() {
  cd cmdcreate

  local TARGET_DIR=""
  [[ "$CARCH" == "x86_64" ]] && TARGET_DIR="x86_64-unknown-linux-musl"
  [[ "$CARCH" == "i686" ]] && TARGET_DIR="i686-unknown-linux-musl"
  [[ "$CARCH" == "aarch64" ]] && TARGET_DIR="aarch64-unknown-linux-musl"

  install -Dm755 "target/$TARGET_DIR/release/cmdcreate" "$pkgdir/usr/bin/cmdcreate"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
