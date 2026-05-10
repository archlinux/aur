pkgname=cmdcreate-git
pkgver=r1617.ca1bc9e
pkgrel=1
pkgdesc="Allows you to create custom commands for your custom scripts (Static Musl)"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/owen-debiasio/cmdcreate"
license=('GPL-3.0-or-later')

depends=('less' 'git' 'curl')
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

  local _target="${CARCH}-unknown-linux-musl"
  rustup target add "$_target" || true
  cargo fetch --locked --target "$_target"
}

build() {
  cd cmdcreate

  local _target="${CARCH}-unknown-linux-musl"

  export CFLAGS="-O3 -pipe"
  export CXXFLAGS="-O3 -pipe"
  export LDFLAGS=""

  export RUSTFLAGS="-C target-feature=+crt-static -C link-arg=-fno-sanitize=all"
  export CRATE_CC_NO_DEFAULTS=true

  cargo zigbuild --release --frozen --target "$_target"
}

package() {
  cd cmdcreate

  local _target_dir="target/${CARCH}-unknown-linux-musl/release"

  install -Dm755 "$_target_dir/cmdcreate" "$pkgdir/usr/bin/cmdcreate"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

