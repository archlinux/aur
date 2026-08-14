# Maintainer: LIghtJUNction <lightjunction.me@gmail.com>
pkgname=matchplane-git
pkgver=0.1.2.r3.gd0e0135
pkgrel=1
pkgdesc='Federated AI matching infrastructure (development version)'
arch=('x86_64')
url='https://github.com/LIghtJUNction/matchplane'
license=('LicenseRef-MatchPlane-Pending')
depends=('ca-certificates' 'gcc-libs' 'glibc' 'openssl' 'zlib')
makedepends=('cargo' 'cmake' 'curl' 'git' 'nodejs' 'npm' 'protobuf' 'rust')
provides=('matchplane')
conflicts=('matchplane' 'matchplane-bin')
# makepkg's cross-language LTO drops native crypto symbols from SQLx's
# proc-macro shared object. Cargo still applies its safe per-crate optimizations.
options=('!lto')
backup=('etc/matchplane/matchplane.env')
install=matchplane.install
source=('matchplane::git+https://github.com/LIghtJUNction/matchplane.git')
sha256sums=('SKIP')

pkgver() {
  cd matchplane
  local count revision
  count=$(git rev-list --count HEAD)
  revision=$(git rev-parse --short=7 HEAD)
  printf '0.1.2.r%s.g%s' "$count" "$revision"
}

build() {
  cd matchplane
  npm ci --ignore-scripts --prefix web
  npm run build --prefix web
  cargo build --release --locked --workspace --bins
}

check() {
  cd matchplane
  npm test --prefix web
  cargo test --release --locked --workspace
}

package() {
  cd matchplane
  packaging/scripts/stage.sh "$pkgdir" target/release
}
