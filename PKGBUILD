pkgname=lattice-net-git
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc="Peer-to-peer web protocol CLI and daemon"
arch=('x86_64')
url="https://github.com/fordz0/lattice"
license=('GPL3')
depends=('glibc' 'gcc-libs' 'systemd')
makedepends=('cargo' 'git')
options=(!lto !debug)
provides=('lattice-net')
conflicts=('lattice-net' 'lattice-net-bin')
source=("git+https://github.com/fordz0/lattice.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/lattice"
  printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/lattice"
  export CARGO_TARGET_DIR=target
  cargo build --release --locked -p lattice -p lattice-daemon
}

check() {
  cd "$srcdir/lattice"
  export CARGO_TARGET_DIR=target
  cargo test --locked -p lattice
}

package() {
  cd "$srcdir/lattice"

  install -Dm755 "target/release/lattice" "$pkgdir/usr/bin/lattice"
  install -Dm755 "target/release/lattice-daemon" "$pkgdir/usr/bin/lattice-daemon"
  install -Dm644 "$startdir/lattice-daemon.service" \
    "$pkgdir/usr/lib/systemd/user/lattice-daemon.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
