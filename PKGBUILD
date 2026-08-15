# Maintainer: LIghtJUNction <lightjunction.me@gmail.com>
pkgname=matchplane-git
pkgver=0.1.8.r26.g42cdce6
pkgrel=1
pkgdesc='Federated AI matching infrastructure (development version)'
arch=('x86_64')
url='https://github.com/LIghtJUNction/matchplane'
license=('LicenseRef-MatchPlane-Pending')
depends=('ca-certificates' 'gcc-libs' 'glibc' 'openssl' 'zlib')
makedepends=('bun' 'cargo' 'cmake' 'curl' 'git' 'protobuf' 'rust')
provides=('matchplane')
conflicts=('matchplane' 'matchplane-bin')
# makepkg's cross-language LTO drops native crypto symbols from SQLx's
# proc-macro shared object. Cargo still applies its safe per-crate optimizations.
options=('!lto')
backup=('etc/matchplane/matchplane.env')
install=matchplane.install
# The release workflow replaces 42cdce6a5cd63506c86f5d566bbb9302db938d5d with the exact GitHub commit being
# published. Keeping the VCS source immutable prevents a moving main branch from
# changing an AUR build after its review.
source=('matchplane::git+https://github.com/LIghtJUNction/matchplane.git#commit=42cdce6a5cd63506c86f5d566bbb9302db938d5d')
sha256sums=('SKIP')

pkgver() {
  cd matchplane
  local count revision
  count=$(git rev-list --count HEAD)
  revision=$(git rev-parse --short=7 HEAD)
  printf '0.1.8.r%s.g%s' "$count" "$revision"
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
