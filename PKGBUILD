pkgname=domcp-git
_pkgname=domcp
pkgver=0.2.0.r0.gbbfb4d4
pkgrel=1
pkgdesc='Dockerize MCP servers for safety by wrapping uvx/npx/pipx in containers'
arch=('x86_64' 'aarch64')
url='https://gitlab.com/Kanedias/domcp'
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('cargo' 'git' 'rust')
optdepends=(
  'podman: preferred container engine'
  'docker: alternative container engine'
)
provides=('domcp')
conflicts=('domcp')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  local basever rev hash
  basever=$(sed -n 's/^version = "\(.*\)"/\1/p' Cargo.toml | head -n1)
  rev=$(git rev-list --count HEAD)
  hash=$(git rev-parse --short HEAD)

  printf '%s.r%s.g%s\n' "$basever" "$rev" "$hash"
}

prepare() {
  cd "$srcdir/$_pkgname"

  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
  cd "$srcdir/$_pkgname"

  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$srcdir/$_pkgname"

  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
