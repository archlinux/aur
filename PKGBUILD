# shellcheck disable=SC2148
pkgname=binsider-git
pkgver=r259.b3c5487
pkgrel=1
pkgdesc="Analyze ELF binaries like a boss. Git master version."
arch=('x86_64')
url="https://github.com/orhun/binsider"
license=('Apache-2.0' 'MIT')
provides=('binsider' 'binsider-git')
makedepends=('cargo' 'git')
conflicts=('binsider' 'binsider-git')
source=("binsider::git+https://github.com/orhun/binsider")
sha1sums=('SKIP')
depends=('gcc-libs')

build() {
  cd binsider || exit 1
  if command -v rustup >/dev/null 2>&1; then
    RUSTFLAGS="-C target-cpu=native" rustup run stable \
      cargo build --release
  elif rustc --version | grep -q stable; then
    RUSTFLAGS="-C target-cpu=native" \
      cargo build --release
  else
    cargo build --release
  fi
}

pkgver() {
  cd binsider || exit 1
  local _rev=$(git rev-list --count HEAD)
  local _hash=$(git rev-parse --short HEAD)
  echo "r${_rev}.${_hash}"
}

package() {
  cd binsider || exit 1
  install -Dm755 "target/release/binsider" "${pkgdir}/usr/bin/binsider"

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/binsider/README.md"
  install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/binsider/CHANGELOG.md"

  install -Dm644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/binsider/LICENSE-MIT"
  install -Dm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/binsider/LICENSE-APACHE"
}
