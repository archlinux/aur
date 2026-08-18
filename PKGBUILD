# Maintainer: LIghtJUNction <lightjunction.me@gmail.com>
pkgname=matchplane-git
# makepkg replaces this with the immutable checkout's workspace version and revision.
pkgver=0.1.10.r181.g7182c52
pkgrel=1
pkgdesc='Federated AI matching infrastructure (development version)'
arch=('x86_64')
url='https://github.com/LIghtJUNction/matchplane'
license=('MIT')
depends=('bubblewrap' 'ca-certificates' 'gcc-libs' 'git' 'glibc' 'nodejs>=22.12.0' 'openssl' 'zlib')
makedepends=('bun' 'cargo' 'cmake' 'curl' 'git' 'nodejs' 'protobuf' 'rust')
provides=('matchplane')
conflicts=('matchplane' 'matchplane-bin')
# makepkg's cross-language LTO drops native crypto symbols from SQLx's
# proc-macro shared object. Cargo still applies its safe per-crate optimizations.
options=('!lto')
backup=('etc/matchplane/matchplane.env')
install=matchplane.install
# The release workflow replaces 7182c52771249183a88d07343f861e8376c3ce70 with the exact GitHub commit being
# published. Keeping the VCS source immutable prevents a moving main branch from
# changing an AUR build after its review.
source=('matchplane::git+https://github.com/LIghtJUNction/matchplane.git#commit=7182c52771249183a88d07343f861e8376c3ce70')
sha256sums=('SKIP')

pkgver() {
  cd matchplane
  local base_version count revision
  base_version=$(awk -F'"' '$1 ~ /^[[:space:]]*version[[:space:]]*=[[:space:]]*$/ { print $2; exit }' Cargo.toml)
  [[ $base_version =~ ^[0-9]+\.[0-9]+\.[0-9]+([.][0-9]+)?$ ]] || return 1
  count=$(git rev-list --count HEAD)
  revision=$(git rev-parse --short=7 HEAD)
  printf '%s.r%s.g%s' "$base_version" "$count" "$revision"
}

build() {
  cd matchplane
  bun install --frozen-lockfile --cwd web
  bun run --cwd web build
  cargo build --release --locked --workspace --bins
}

check() {
  cd matchplane
  bun run --cwd web test
  cargo test --release --locked --workspace
}

package() {
  cd matchplane
  packaging/scripts/stage.sh "$pkgdir" target/release
}
